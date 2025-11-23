<?php

namespace MySummarizer;

use Omeka\Module\AbstractModule;
use Laminas\Mvc\MvcEvent;
use MySummarizer\Service\SummaryService;
use Omeka\Api\Manager as ApiManager;

class Module extends AbstractModule
{
    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function onBootstrap(MvcEvent $event)
    {
        // Rien de spécial au bootstrap pour l’instant
    }
}