<?php

// Add default routes
$path = Config::Get('path.root.web');

$def_options = [
    'pushState' => true,
    'history'   => true
];
$config['view']['routes']= [
    [
        'title'     => 'Главная',
        'path'      => '/',
        'url'       => '/?ajax=1'
    ],
    [
        
        'path'      => '/index/newall/',
        'url'       => '/index/newall/?ajax=1',
        'options'   => $def_options
    ],
    [
        'path'      => '/auth/login',
        'url'       => 'auth/login/?ajax=1',
        'options'   => $def_options
    ],
    [
        'title'     => 'Регистрация',
        'path'      => '/auth/register',
        'url'       => '/auth/register/?ajax=1',
        'options'   => $def_options
    ],
];