<?php

// Add default routes
$path = Config::Get('path.root.web');
$config['view']['routes']= [
    [
        'path'=> '/index/newall/',
        'url'=> '/index/newall/?ajax=1',
    ],
    [
        'path'=> '/auth/login',
        'url'=> 'auth/login/?ajax=1',
    ],
    [
        'path'=> '/auth/register',
        'url'=> '/auth/register/?ajax=1',
    ],
];