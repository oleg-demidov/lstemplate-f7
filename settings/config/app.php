<?php
$config['view']['app'] = [
    // App root element
    'root'      => '#app',
    // App Name
    'name'      => Config::Get('view.name'),
    // App id
    'id'        => 'com.livestreet.site2',
    // Enable swipe panel
    'theme'     => $config['view']['theme_layout']['theme_style'],
    'panel'     => [
      'swipe'   => 'right',
    ],
    'routes'    =>$config['view']['routes'],
];