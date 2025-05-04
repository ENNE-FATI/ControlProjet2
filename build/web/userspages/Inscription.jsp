<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Créer un compte - ZahraMotion</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #2A9D8F;
            --secondary-color: #E9C46A;
            --accent-color: #E76F51;
            --dark-color: #264653;
            --light-color: #F8F9FA;
            --text-color: #333333;
            --text-light: #6C757D;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: var(--text-color);
            background-color: var(--light-color);
        }
        
        .btn-custom-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            color: white;
            border-radius: 30px;
            padding: 10px 25px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-custom-primary:hover {
            background-color: #248277;
            border-color: #248277;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(42, 157, 143, 0.3);
        }
        
        .btn-custom-secondary {
            background-color: transparent;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
            border-radius: 30px;
            padding: 10px 25px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-custom-secondary:hover {
            background-color: var(--primary-color);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(42, 157, 143, 0.3);
        }
        
        .navbar {
            background-color: white;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
            padding: 15px 0;
        }
        
        .navbar-brand {
            font-weight: 700;
            font-size: 1.8rem;
            color: var(--primary-color);
        }
        
        .navbar-brand span {
            color: var(--accent-color);
        }
        
        .nav-link {
            font-weight: 500;
            color: var(--text-color) !important;
            margin: 0 10px;
            position: relative;
            transition: all 0.3s ease;
        }
        
        .nav-link:after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            background: var(--primary-color);
            bottom: -3px;
            left: 0;
            transition: width 0.3s ease;
        }
        
        .nav-link:hover:after, .nav-link.active:after {
            width: 100%;
        }
        
        .nav-link.active {
            color: var(--primary-color) !important;
        }

        /* Main Content */
        .container.main-container {
            min-height: calc(100vh - 120px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px;
        }

        .card-custom {
            display: flex;
            width: 100%;
            max-width: 1000px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .image-side {
            flex: 1;
            background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1350&q=80') center center / cover no-repeat;
        }

        .form-side {
            flex: 1;
            padding: 40px 30px;
        }

        .form-side h2 {
            color: var(--primary-color);
            font-weight: 700;
        }

        .form-label {
            font-weight: 500;
        }

        .form-control {
            background-color: #f8f9fa;
            border-radius: 8px;
            border: 1px solid #dee2e6;
        }

        .btn-primary {
            background: var(--primary-color);
            border: none;
            padding: 12px;
            border-radius: 30px;
            font-weight: 600;
        }

        .btn-primary:hover {
            background: #248277;
            opacity: 0.9;
        }

        .footer-link {
            font-size: 0.9rem;
            margin-top: 15px;
            text-align: center;
        }

        .footer-link a {
            color: var(--accent-color);
            font-weight: 600;
            text-decoration: none;
        }

        .footer-link a:hover {
            text-decoration: underline;
        }

        /* Footer Styles */
        footer {
            background-color: var(--dark-color);
            color: white;
            padding: 50px 0 20px;
        }

        footer a {
            color: white;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        footer .social-icons a {
            font-size: 1.2rem;
            margin-right: 15px;
        }

        @media (max-width: 768px) {
            .card-custom {
                flex-direction: column;
            }

            .image-side {
                height: 200px;
            }
        }
    </style>
</head>
<body>

<!-- Header/Navbar -->
<nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">ZahraMotion<span>.</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Accueil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">À propos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Connexion.jsp">Connexion</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="Inscription.jsp">Inscription</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container main-container">
    <div class="card-custom">
        <div class="image-side"></div>
        <div class="form-side">
            <h2>Créer un compte</h2>
            <p class="mb-4 text-muted">Rejoignez notre plateforme pour découvrir des activités touristiques inoubliables.</p>

            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>

            <form id="registrationForm" action="../InscriptionController" method="post">
                <div class="mb-3">
                    <label for="nom" class="form-label">Nom</label>
                    <input type="text" class="form-control" id="nom" name="nom" placeholder="Votre nom" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Adresse email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="exemple@email.com" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Mot de passe</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Créez un mot de passe" required>
                </div>

                <div class="form-check mb-3">
                    <input type="checkbox" class="form-check-input" id="termsCheck" required>
                    <label class="form-check-label" for="termsCheck">
                        J'accepte les <a href="#" data-bs-toggle="modal" data-bs-target="#termsModal">conditions</a> et la <a href="#" data-bs-toggle="modal" data-bs-target="#privacyModal">confidentialité</a>
                    </label>
                </div>

                <button type="submit" class="btn btn-primary w-100">Créer mon compte</button>
            </form>

            <div class="footer-link mt-3">
                <p>Vous avez déjà un compte ? <a href="Connexion.jsp">Se connecter</a></p>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4">
                <h5>ZahraMotion</h5>
                <p class="mb-4">Découvrez des expériences uniques avec des guides locaux passionnés partout en France.</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            
            <div class="col-md-2 col-6 mb-4">
                <h5>Liens rapides</h5>
                <ul class="list-unstyled">
                    <li><a href="index.jsp">Accueil</a></li>
                    <li><a href="about.jsp">À propos</a></li>
                    <li><a href="#">Activités</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            
            <div class="col-md-2 col-6 mb-4">
                <h5>Catégories</h5>
                <ul class="list-unstyled">
                    <li><a href="#">ZahraMotion</a></li>
                    <li><a href="#">Gastronomie</a></li>
                    <li><a href="#">Culture</a></li>
                    <li><a href="#">Nature</a></li>
                </ul>
            </div>
            
            <div class="col-md-4 mb-4">
                <h5>Newsletter</h5>
                <p>Inscrivez-vous pour recevoir nos dernières offres et actualités.</p>
                <form class="newsletter-form">
                    <input type="email" class="form-control" placeholder="Votre email">
                    <button type="submit"><i class="fas fa-paper-plane"></i></button>
                </form>
            </div>
        </div>
        <hr class="my-4 bg-light">
        <div class="row">
            <div class="col-md-6 text-center text-md-start">
                <p class="mb-0">&copy; 2023 ZahraMotion. Tous droits réservés.</p>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <a href="#">Conditions d'utilisation</a>
                <span class="mx-2">|</span>
                <a href="#">Politique de confidentialité</a>
            </div>
        </div>
    </div>
</footer>

<!-- Modal Conditions -->
<div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="termsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="termsModalLabel">Conditions Générales</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
            </div>
            <div class="modal-body">
                <p>En créant un compte, vous acceptez de respecter les règles de notre plateforme touristique.</p>
                <ul>
                    <li>Les réservations doivent être annulées 24h à l'avance.</li>
                    <li>Respect des guides et des horaires imposés.</li>
                    <li>Pas de spam ni de fausses informations.</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- Modal Politique de Confidentialité -->
<div class="modal fade" id="privacyModal" tabindex="-1" aria-labelledby="privacyModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="privacyModalLabel">Politique de Confidentialité</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
            </div>
            <div class="modal-body">
                <p>Nous collectons uniquement les données nécessaires pour organiser vos activités touristiques :</p>
                <ul>
                    <li>Nom, email et mot de passe sécurisés</li>
                    <li>Historique de réservation</li>
                    <li>Préférences de voyage</li>
                </ul>
                <p>Vos données ne seront jamais partagées avec des tiers sans votre consentement.</p>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Confirmation Script -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('registrationForm');
    
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Vérifier si tous les champs sont valides
        if (form.checkValidity()) {
            // Afficher la confirmation
            Swal.fire({
                title: 'Confirmer l\'inscription',
                text: 'Êtes-vous sûr de vouloir créer un compte avec ces informations ?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#4facfe',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Oui, créer mon compte',
                cancelButtonText: 'Annuler'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Soumettre le formulaire si confirmé
                    form.submit();
                }
            });
        } else {
            // Afficher les erreurs de validation
            form.reportValidity();
        }
    });
});
</script>

<!-- SweetAlert pour les belles alertes -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>
</html>