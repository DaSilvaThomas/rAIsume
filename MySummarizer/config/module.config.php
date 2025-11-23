<?php
return [
    'router' => [
        'routes' => [
            'mysummarizer-form' => [
                'type' => 'Literal',
                'options' => [
                    'route'    => '/summarizer',
                    'defaults' => [
                        '__NAMESPACE__' => 'MySummarizer\Controller',
                        'controller'    => \MySummarizer\Controller\FormController::class,
                        'action'        => 'index',
                    ],
                ],
                'may_terminate' => true,
                'child_routes' => [
                    'submit' => [
                        'type' => 'Literal',
                        'options' => [
                            'route'    => '/submit',
                            'defaults' => [
                                'controller' => \MySummarizer\Controller\FormController::class,
                                'action'     => 'submit',
                            ],
                        ],
                    ],
                ],
            ],
        ],
    ],

    'controllers' => [
        'factories' => [
            \MySummarizer\Controller\FormController::class => function($container) {
                return new \MySummarizer\Controller\FormController(
                    $container->get(\MySummarizer\Service\SummaryService::class),
                    $container->get('Omeka\ApiManager')
                );
            },
        ],
    ],

    'service_manager' => [
        'factories' => [
            \MySummarizer\Service\SummaryService::class => \Laminas\ServiceManager\Factory\InvokableFactory::class,
        ],
    ],

    'view_manager' => [
        'template_map' => [
            'my-summarizer/form/index'  => __DIR__ . '/../view/my-summarizer/form/index.phtml',
            'my-summarizer/form/result' => __DIR__ . '/../view/my-summarizer/form/result.phtml',
        ],
        'template_path_stack' => [
            __DIR__ . '/../view',
        ],
    ],
];
