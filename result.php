<?php
    session_start();

    $summary = $_SESSION['summary'] ?? null;
    $success = $_SESSION['success'] ?? [];
    unset($_SESSION['summary'], $_SESSION['success']);
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
            <h1>Résultats</h1>
        </div>
    </div>

    <!-- Gestion des messages -->
    <div class="container d-flex justify-content-center">
        <div class="col-md-6">

            <!-- Succès -->
            <?php if (!empty($success)): ?>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <?= htmlspecialchars($success) ?>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <?php endif; ?>

         </div>
    </div>

    <!-- Affichage du résumé -->
    <div class="container d-flex justify-content-center align-items-center mt-2">
        <div class="col-md-6 card shadow-sm border-0">
            <div class="card-body">
                
                <?php if ($summary): ?>
                    <p class="mb-0"><strong>Résumé :</strong> <?= htmlspecialchars($summary) ?></p>
                <?php else: ?>
                    <div class="alert alert-warning mb-0">Aucun résumé disponible.</div>
                <?php endif; ?>

            </div>
        </div>
    </div>

    <!-- JS Bootstrap Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JS personnalisé -->
    <script src="assets/js/script.js"></script>
</body>
</html>