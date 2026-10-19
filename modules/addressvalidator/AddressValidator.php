<?php

namespace modules\addressvalidator;

use Craft;
use craft\base\Model;
use craft\elements\Address;
use craft\events\DefineRulesEvent;
use craft\helpers\App;
use yii\base\Event;
use yii\base\Module;

/**
 * Verifies checkout addresses against the Google Address Validation API.
 *
 * Only runs when an address form is submitted — checkout (commerce/cart/update-cart with
 * address params) or My Account (users/save-address) — so cart qty updates etc. never call
 * Google. Fails open: if the API key
 * is missing or Google errors, the address is accepted and a warning is logged.
 */
class AddressValidator extends Module
{
    public const ERROR_MESSAGE = "We couldn't verify this address. Please double-check it and enter a valid address.";

    private const API_URL = 'https://addressvalidation.googleapis.com/v1:validateAddress';

    /** Granularities precise enough to deliver to (PREMISE_PROXIMITY = interpolated house number) */
    private const ACCEPTED_GRANULARITIES = ['SUB_PREMISE', 'PREMISE', 'PREMISE_PROXIMITY'];

    public function init(): void
    {
        parent::init();

        Event::on(Address::class, Model::EVENT_DEFINE_RULES, function (DefineRulesEvent $event) {
            /** @var Address $address */
            $address = $event->sender;
            if (!$this->isCheckoutAddressSubmission()) {
                return;
            }

            $event->rules[] = ['addressLine1', function (string $attribute) use ($address) {
                // Don't spend a Google call if required fields etc. already failed
                if (!$address->hasErrors() && !$this->verify($address)) {
                    $address->addError($attribute, self::ERROR_MESSAGE);
                }
            }, 'skipOnEmpty' => true];
        });
    }

    private function isCheckoutAddressSubmission(): bool
    {
        $request = Craft::$app->getRequest();
        if ($request->getIsConsoleRequest() || !$request->getIsSiteRequest() || !$request->getIsPost()) {
            return false;
        }

        $action = implode('/', $request->getActionSegments() ?? []);

        // My Account → add/edit address
        if ($action === 'users/save-address') {
            return true;
        }

        if ($action !== 'commerce/cart/update-cart') {
            return false;
        }

        foreach (['shippingAddress', 'billingAddress', 'sourceShippingAddressId', 'sourceBillingAddressId'] as $param) {
            if ($request->getBodyParam($param) !== null) {
                return true;
            }
        }

        return false;
    }

    /**
     * Returns false only when Google confirms the address is not deliverable.
     */
    private function verify(Address $address): bool
    {
        $apiKey = App::env('GOOGLE_MAPS_API_KEY');
        if (!$apiKey) {
            Craft::warning('GOOGLE_MAPS_API_KEY is not set — skipping address verification.', __METHOD__);
            return true;
        }

        $payload = [
            'address' => [
                'regionCode' => $address->countryCode,
                'administrativeArea' => $address->administrativeArea,
                'locality' => $address->locality,
                'postalCode' => $address->postalCode,
                'addressLines' => array_values(array_filter([$address->addressLine1, $address->addressLine2])),
            ],
        ];

        $cacheKey = 'address-verify:' . md5(strtolower(json_encode($payload)));

        $cache = Craft::$app->getCache();
        $cached = $cache->get($cacheKey);
        if ($cached !== false) {
            return $cached === 'valid';
        }

        try {
            $response = Craft::createGuzzleClient()->post(self::API_URL, [
                'query' => ['key' => $apiKey],
                'json' => $payload,
                'timeout' => 5,
            ]);
            $verdict = json_decode((string)$response->getBody(), true)['result']['verdict'] ?? [];
        } catch (\Throwable $e) {
            // Don't cache — a Google outage shouldn't be remembered as "valid"
            Craft::warning('Address verification failed, accepting address: ' . $e->getMessage(), __METHOD__);
            return true;
        }

        $valid = ($verdict['addressComplete'] ?? false)
            && in_array($verdict['validationGranularity'] ?? null, self::ACCEPTED_GRANULARITIES, true);

        $cache->set($cacheKey, $valid ? 'valid' : 'invalid', 60 * 60 * 24);

        return $valid;
    }
}
