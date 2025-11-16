<?php
    session_start();

    // Récupération des erreurs
    $errors = $_SESSION['errors'] ?? [];
    unset($_SESSION['errors']);

?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>rAIsume</title>

    <!-- CSS Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="bg-light py-5 d-flex flex-column gap-4">

    <!-- Titre -->
    <div class="container d-flex justify-content-center align-items-center">
        <div class="col-md-6 text-center">
            <h1>Bienvenue sur rAIsume !</h1>
        </div>
    </div>

    <!-- Gestion des messages -->
    <div class="container d-flex justify-content-center">
        <div class="col-md-6">

            <!-- Erreurs -->
            <?php if (!empty($errors)): ?>
                <?php foreach ($errors as $error): ?>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <?= htmlspecialchars($error) ?>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>

         </div>
    </div>

    <!-- Formulaire de saisie -->
    <div class="container d-flex justify-content-center align-items-center mt-4">
        <div class="col-md-6 card shadow-sm border-0">
            <div class="card-body">
                <h4 class="card-title mb-4 text-center">Formulaire de saisie</h4>
                
                <form action="process.php" method="post">
                    <input type="hidden" name="form_type" value="text">
                    <div class="mb-3">
                        <label for="content" class="form-label">Insérez du texte :</label>
                        <textarea
                            class="form-control"
                            id="content"
                            name="content"
                            rows="5"
                            placeholder="Tapez votre texte ici !"
                            required></textarea>
                    </div>

                    <div class="d-flex justify-content-between">
                        <button type="reset" class="btn btn-secondary">
                            <i class="bi bi-x me-1"></i> Annuler
                        </button>
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-send-fill me-1"></i> Envoyer
                        </button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <!-- Chargement fichiers -->
    <div class="container d-flex justify-content-center align-items-center mt-4">
        <div class="col-md-6 card shadow-sm border-0">
            <div class="card-body">
                <h4 class="card-title mb-4 text-center">Importer un fichier</h4>

                <form action="process.php" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="form_type" value="file">
                    <div class="mb-3">
                        <label for="file" class="form-label">Choisir un fichier :</label>
                        <input class="form-control" type="file" name="file" id="file" accept=".txt" required>
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="reset" class="btn btn-secondary">
                            <i class="bi bi-x me-1"></i> Annuler
                        </button>
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-send-fill me-1"></i> Envoyer
                        </button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <!-- JS Bootstrap Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- JS personnalisé -->
    <script src="assets/js/script.js"></script>
</body>
</html>