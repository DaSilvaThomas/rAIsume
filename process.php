<?php

    // Importation de la config Omeka S
    require 'config.php';

    // Gestion des messages
    session_start();
    $success = [];
    $errors = [];

    $filename = null;
    
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $form_type = $_POST['form_type'] ?? '';

        // Chargement du texte
        if ($form_type === 'text') {
            if (isset($_POST['content'])) {
                $content = $_POST['content'];
                $filename = null;
            } else {
                $errors[] = "Erreur lors du chargement du texte.";
            }

        // Chargement du fichier
        } elseif ($form_type === 'file') {
            if (isset($_FILES['file']) && $_FILES['file']['error'] === UPLOAD_ERR_OK) {
                $filename = $_FILES['file']['name'];
                $file_path = $_FILES['file']['tmp_name'];
                $content = file_get_contents($file_path);
            } else {
                $errors[] = "Erreur lors du chargement du fichier ou aucun fichier reçu.";
            }
        }

        if (!empty($errors)) {
            $_SESSION['errors'] = $errors;
            header("Location: index.php");
            exit;
        }
    }

    // Exécution du code si la variable $content n'est pas vide
    if (!empty($content)) {

        // Nettoyage du texte
        $content_clean = trim(preg_replace('/\s+/', ' ', strip_tags($content)));

        // Résumé du texte
        $summary = substr($content_clean, 0, 200) . "...";

        // Date d'import
        $import_date = date('Y-m-d H:i:s');
        
        // Envoyer les données vers Omeka S
        

    } else {
        $_SESSION['errors'] = ["Erreur : Le fichier importé est vide."];
        header("Location: index.php");
        exit;
    }

?>