<?php

$dir_name = dirname(__FILE__);

$config=[];

require $dir_name.'/assets.php';

require $dir_name.'/view.php';

require $dir_name.'/routes.php';

require $dir_name.'/app.php';

$config['recaptcha'] = [
    'sitekey' => '6Ld0A0oUAAAAADXJeEGT1ld4V6vRWo0gkexpeMOn'
];

return $config;