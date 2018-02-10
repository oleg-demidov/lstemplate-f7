<?php

// Подключение скриптов шаблона

$config['head']['template']['js'] = array(
    "___path.skin.assets.web___/framework7/dist/js/framework7.min.js",
    '___path.skin.assets.web___/js/init.js'
    
);

$config['head']['default']['js'] = array(
    //"___path.skin.web___/components/ls-vendor/html5shiv.js" => array('browser' => 'lt IE 9'),
    //"___path.skin.web___/components/ls-vendor/jquery.placeholder.min.js" => array('browser' => 'lt IE 9'),

    //"//yastatic.net/share/share.js" => array('merge' => false),
    //"https://www.google.com/recaptcha/api.js?onload=__do_nothing__&render=explicit" => array('merge' => false),
);

// Подключение стилей шаблона
$config['head']['template']['css'] = array(
    "___path.skin.assets.web___/framework7/dist/css/framework7.min.css",
    "___path.skin.assets.web___/css/layout.css"
	
);

$config['components'] = [
    'ls-vendor', 'ls-core', 'ls-component','f7-icon', 'icon'
];

