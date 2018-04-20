<?php

// Подключение скриптов шаблона

$config['head']['template']['js'] = array(
    "___path.skin.assets.web___/framework7/build/js/framework7.min.js",
    '___path.skin.assets.web___/js/init.js'
    
);

$config['head']['default']['js'] = array(
    "https://www.google.com/recaptcha/api.js?v=4&onload=onloadrecaptcha"=> array('merge' => false)
    //"___path.skin.web___/components/f7-auth/js/init.js",
    //"___path.skin.web___/components/ls-vendor/html5shiv.js" => array('browser' => 'lt IE 9'),
    //"___path.skin.web___/components/ls-vendor/jquery.placeholder.min.js" => array('browser' => 'lt IE 9'),

    //"//yastatic.net/share/share.js" => array('merge' => false),
    //"https://www.google.com/recaptcha/api.js?onload=__do_nothing__&render=explicit" => array('merge' => false),
);

// Подключение стилей шаблона
$config['head']['template']['css'] = array(
    "___path.skin.assets.web___/framework7/build/css/framework7.min.css",
    "___path.skin.assets.web___/css/layout.css"   
	
);

$config['components'] = [
    'ls-vendor', 'ls-core', 'field', 'ls-component', 'icon', 
    
//    'css-reset', 'css-helpers', 'typography', 'forms', 'grid',  'lightbox', 'avatar', 'slider', 'details', 'alert', 'dropdown', 'button', 'block',
//    'nav', 'tooltip', 'tabs', 'modal', 'table', 'text', 'uploader', 'email',  'pagination', 'editor', 'more', 'crop',
//    'performance', 'toolbar', 'actionbar', 'badge', 'autocomplete','item', 'highlighter', 'jumbotron', 'notification', 'blankslate', 'confirm',
    
     'f7-icon', 'f7-user', 'f7-auth', 'f7-notification'
];

$config['asset_actions'] = [
    'auth' => [
        'components' => ['f7-auth'],
        'lang' => ['auth.login'],
        'vars' => ['view.routes', 'view.progressbar_color', 'recaptcha.sitekey']
    ]
];

