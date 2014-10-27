<?php

use Doctrine\Common\Annotations\AnnotationRegistry;
use Composer\Autoload\ClassLoader;
use Symfony\Component\ClassLoader\UniversalClassLoader;

/**
 * @var ClassLoader $loader
 */

$loader = require __DIR__.'/../vendor/autoload.php';

$loader->add('goutte',__DIR__ . '/../vendor');
$loader->add('guzzle',__DIR__ . '/../vendor');
AnnotationRegistry::registerLoader(array($loader, 'loadClass'));

return $loader;
