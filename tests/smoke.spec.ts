import {test, expect} from '@playwright/test';

test('homepage loads', async ({page}) => {
    const response = await page.goto('https://charlies.ddev.site');
    expect(response?.status()).toBe(200);
    await expect(page.getByRole('heading', {level: 1})).toBeVisible();
})