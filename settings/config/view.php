<?php

/*
 * Тема шаблона и цвета
 * 
 */
$config['view']['layout'] = 'layout';

$config['view']['theme_color'] = 'blue';

if(Config::Get('view.theme_color')){
    $config['view']['theme_color'] = Config::Get('view.theme_color');
}

$f7_theme_colors = [
    'red'=> 'color-theme-red', 
    'green'=> 'color-theme-green',
    'blue'=> 'color-theme-blue',
    'pink'=> 'color-theme-pink',
    'yellow' => 'color-theme-yellow',
    'orange'=> 'color-theme-orange',
    'gray'=> 'color-theme-gray',
    'white'=> 'color-theme-white',
    'black'=> 'color-theme-black'
];
$config['view']['f7_theme_color'] = $f7_theme_colors[$config['view']['theme_color']]; //по умолчанию blue

/*
 * Тема шаблона dark, light
 */
$themesLayouts = [
    'md_light' =>[
        'theme_layout' => 'theme-light',
        'theme_style' => 'md'
    ],
    'md_dark' =>[
        'theme_layout' => 'theme-dark',
        'theme_style' => 'md'
    ],
    'ios_light' =>[
        'theme_layout' => 'theme-light',
        'theme_style' => 'ios'
    ],
    'ios_dark' =>[
        'theme_layout' => 'theme-dark',
        'theme_style' => 'ios'
    ]
];

$config['view']['theme_layout'] = $themesLayouts['md_light'];

if( Config::Get('view.theme') ){
    $config['view']['theme_layout'] = $themesLayouts[Config::Get('view.theme')];
}

/*
 * Передача в шаблон указателя использовать ajax для заггрузки страниц
 */
//$oSesion = new ModuleSession();
$config['view']['ajax'] = getRequest('ajax', 0 /*$oSesion->GetCookie('ajax', 0)*/);
//$oSesion->SetCookie('ajax', 0);


/*
 *  Настройки основного Тулбара
 */
$config['view']['hide_toolbar_on_scroll'] = false; // to hide both Navbar and Toolbar on page scroll
$config['view']['hide_bars_on_scroll'] = true; // to hide Toolbar/Tabbar on page scroll

