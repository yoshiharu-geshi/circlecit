<?php
require __DIR__ . '/../vendor/autoload.php';

$kernel = \AspectMock\Kernel::getInstance();
$kernel->init([
    'debug'         =>  true,
    'appDir'        =>  __DIR__ . '/../',
    'includePaths'  =>  [__DIR__ . '/../src'],
    'excludePaths'  =>  [__DIR__ . '/../tests'],
    'cacheDir'      =>  __DIR__ . '/../cache/AspectMock',
]);
$kernel->loadPhpFiles(__DIR__ . '/../src');
