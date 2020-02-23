<?php

require_once(__DIR__ . '/vendor/autoload.php');

// If caller is phpunit
if (false !== strpos(debug_backtrace()[0]['file'], 'vendor/phpunit')) {
    DG\BypassFinals::setWhitelist([
        'src/AllowedSimpleFinalClass.php',
    ]);

    DG\BypassFinals::enable();
}
