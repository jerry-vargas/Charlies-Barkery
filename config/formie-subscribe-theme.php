<?php

return [
    'resetClasses' => true,
    'form' => [
        'attributes' => [
            'class' => 'flex flex-col gap-5',
        ],
    ],
    'page' => [
        'attributes' => [
            'class' => 'flex flex-col gap-5',
        ],
    ],
    'pageContainer' => [
        'attributes' => [
            'class' => 'flex flex-col gap-5',
        ],
    ],
    'row' => [
        'attributes' => [
            'class' => 'grid gap-4',
        ],
    ],
    'field' => [
        'attributes' => [
            'class' => 'flex flex-col gap-1',
        ],
    ],
    'fieldLabel' => [
        'attributes' => [
            'class' => 'font-hobeaux text-charcoal text-sm font-bold',
        ],
    ],
    'fieldRequired' => [
        'attributes' => [
            'class' => 'text-bronze',
        ],
    ],
    'fieldInstructions' => [
        'attributes' => [
            'class' => 'font-hobeaux text-xs text-gray-400 text-center',
        ],
    ],
    'fieldErrors' => [
        'attributes' => [
            'class' => 'flex flex-col gap-1',
        ],
    ],
    'fieldError' => [
        'attributes' => [
            'class' => 'font-hobeaux text-sm text-red-600',
        ],
    ],
    'fieldInputWrapper' => [
        'attributes' => [
            'class' => 'w-full',
        ],
    ],
    'fieldInput' => [
        'attributes' => [
            'class' => 'font-hobeaux w-full border border-gray-200 rounded-xl px-4 py-3 text-sm text-charcoal placeholder-gray-400 bg-white focus:outline-none focus:ring-2 focus:ring-teal',
        ],
    ],
    'buttonWrapper' => [
        'attributes' => [
            'class' => 'mt-2',
        ],
    ],
    'submitButton' => [
        'attributes' => [
            'class' => 'font-hobeaux bg-charcoal text-white font-bold px-8 py-3 rounded-full hover:bg-bronze transition-colors',
        ],
    ],
    'name' => [
        'subFieldRows' => [
            'attributes' => [
                'class' => 'flex flex-col gap-4',
            ],
        ],
        'subFieldRow' => [
            'attributes' => [
                'class' => 'grid gap-4 sm:grid-cols-2',
            ],
        ],
    ],
    'address' => [
        'subFieldRows' => [
            'attributes' => [
                'class' => 'flex flex-col gap-4',
            ],
        ],
        'subFieldRow' => [
            'attributes' => [
                'class' => 'grid gap-4 sm:grid-cols-2',
            ],
        ],
    ],
    'dateTime' => [
        'subFieldRows' => [
            'attributes' => [
                'class' => 'flex flex-col gap-4',
            ],
        ],
        'subFieldRow' => [
            'attributes' => [
                'class' => 'grid gap-4 grid-cols-1',
            ],
        ],
    ],
    'checkboxes' => [
        'fieldOptions' => [
            'attributes' => [
                'class' => 'flex flex-wrap gap-3',
            ],
        ],
        'fieldOption' => [
            'attributes' => [
                'class' => 'flex items-center gap-2 cursor-pointer',
            ],
        ],
        'fieldOptionLabel' => [
            'attributes' => [
                'class' => 'font-hobeaux text-sm text-charcoal',
            ],
        ],
        'fieldInput' => [
            'attributes' => [
                'class' => 'accent-teal w-4 h-4',
            ],
        ],
    ],
    'radioButtons' => [
        'fieldOptions' => [
            'attributes' => [
                'class' => 'flex flex-wrap gap-3',
            ],
        ],
        'fieldOption' => [
            'attributes' => [
                'class' => 'flex items-center gap-2 cursor-pointer',
            ],
        ],
        'fieldOptionLabel' => [
            'attributes' => [
                'class' => 'font-hobeaux text-sm text-charcoal',
            ],
        ],
        'fieldInput' => [
            'attributes' => [
                'class' => 'accent-teal w-4 h-4',
            ],
        ],
    ],
    'dropdown' => [
        'fieldInput' => [
            'attributes' => [
                'class' => 'font-hobeaux w-full border border-gray-200 rounded-xl px-4 py-3 text-sm text-charcoal bg-white focus:outline-none focus:ring-2 focus:ring-teal',
            ],
        ],
    ],
    'multiLineText' => [
        'fieldInput' => [
            'attributes' => [
                'class' => 'font-hobeaux w-full border border-gray-200 rounded-xl px-4 py-3 text-sm text-charcoal placeholder-gray-400 bg-white focus:outline-none focus:ring-2 focus:ring-teal resize-none',
            ],
        ],
    ],
];
