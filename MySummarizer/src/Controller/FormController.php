<?php
namespace MySummarizer\Controller;

use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;
use MySummarizer\Service\SummaryService;
use Omeka\Api\Manager as ApiManager;

class FormController extends AbstractActionController
{
    /** @var SummaryService */
    private $summaryService;

    /** @var ApiManager */
    private $api;

    public function __construct(SummaryService $summaryService, ApiManager $api)
    {
        $this->summaryService = $summaryService;
        $this->api = $api;
    }

    public function indexAction()
    {
        // Affiche le formulaire
        return new ViewModel();
    }

    public function submitAction()
    {
        $request = $this->getRequest();
        if (!$request->isPost()) {
            return $this->redirect()->toRoute('mysummarizer-form');
        }

        $title = $request->getPost('title', '');
        $text = $request->getPost('text', '');

        // Générer le résumé
        $summary = $this->summaryService->generateSummary($text);

        // Créer l’item Omeka S via l’API
        $response = $this->api->create('items', [
            'o:is_public' => true,
            'dcterms:title' => [
                [
                    'type' => 'literal',
                    'property_id' => 'auto',
                    '@value' => $title,
                ],
            ],
            'dcterms:description' => [
                [
                    'type' => 'literal',
                    'property_id' => 'auto',
                    '@value' => $text,
                ],
            ],
            'dcterms:abstract' => [
                [
                    'type' => 'literal',
                    'property_id' => 'auto',
                    '@value' => $summary,
                ],
            ],
        ]);

        // On affiche une page de résultat
        $view = new ViewModel([
            'title' => $title,
            'text' => $text,
            'summary' => $summary,
            'apiResponse' => $response,
        ]);
        $view->setTemplate('my-summarizer/form/result'); // <- Ici on force le template
        return $view;
    }
}
