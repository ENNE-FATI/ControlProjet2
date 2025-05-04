<%@ page contentType="text/html;charset=UTF-8" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - ZahraMotion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2A9D8F;
            --secondary-color: #E9C46A;
            --accent-color: #E76F51;
            --dark-color: #264653;
            --light-color: #F8F9FA;
            --text-color: #333333;
            --text-light: #6C757D;
            --border-radius: 12px;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            color: var(--text-color);
            background-color: #FAFAFA;
        }
        
        .login-container {
            max-width: 800px;
            width: 100%;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            display: flex;
            margin: 50px auto;
        }
        
        .login-form-container {
            flex: 1;
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .login-image-container {
            flex: 1;
            background-image: url('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            position: relative;
            min-height: 100%;
        }
        
        .login-image-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(42, 157, 143, 0.8), rgba(231, 111, 81, 0.8));
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 30px;
            color: white;
            text-align: center;
        }
        
        .login-image-title {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 15px;
        }
        
        .login-image-text {
            font-size: 0.9rem;
            line-height: 1.5;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .login-header h2 {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 5px;
            font-size: 1.6rem;
        }
        
        .login-header p {
            color: var(--text-light);
            font-size: 0.85rem;
        }
        
        .form-control {
            border: 1px solid #dfe6e9;
            padding: 10px 15px;
            height: auto;
            border-radius: var(--border-radius);
            margin-bottom: 15px;
            font-size: 0.9rem;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(42, 157, 143, 0.25);
        }
        
        .form-label {
            font-weight: 500;
            font-size: 0.85rem;
            color: var(--dark-color);
            margin-bottom: 5px;
        }
        
        .btn-login {
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            border: none;
            width: 100%;
            padding: 10px;
            font-weight: 600;
            font-size: 0.9rem;
            border-radius: var(--border-radius);
            color: white;
            margin-top: 10px;
            transition: all 0.3s;
        }
        
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(42, 157, 143, 0.4);
        }
        
        .login-footer {
            text-align: center;
            margin-top: 15px;
            color: var(--text-light);
            font-size: 0.85rem;
        }
        
        .login-footer a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .login-footer a:hover {
            color: var(--accent-color);
        }
        
        .forgot-password {
            text-align: right;
            margin-top: -10px;
            margin-bottom: 15px;
        }
        
        .forgot-password a {
            color: var(--text-light);
            text-decoration: none;
            font-size: 0.75rem;
            transition: all 0.3s;
        }
        
        .forgot-password a:hover {
            color: var(--primary-color);
        }
        
        @media (max-width: 768px) {
            .login-container {
                flex-direction: column-reverse;
                max-width: 400px;
            }
            
            .login-image-container {
                height: 180px;
            }
            
            .login-form-container {
                padding: 25px 20px;
            }
        }
        
        /* Styles du header et footer */
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
        
        footer {
            background-color: var(--dark-color);
            color: white;
            padding: 70px 0 20px;
        }
        
        footer h5 {
            font-weight: 600;
            margin-bottom: 20px;
            color: white;
        }
        
        footer ul {
            padding-left: 0;
        }
        
        footer ul li {
            margin-bottom: 10px;
        }
        
        footer a {
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        footer a:hover {
            color: white;
            text-decoration: none;
        }
        
        footer .social-icons a {
            display: inline-block;
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            margin-right: 10px;
            transition: all 0.3s ease;
        }
        
        footer .social-icons a:hover {
            background: var(--primary-color);
            transform: translateY(-3px);
        }
        
        .newsletter-form {
            position: relative;
            margin-top: 20px;
        }
        
        .newsletter-form input {
            height: 50px;
            border-radius: 30px;
            padding-left: 20px;
            padding-right: 60px;
            border: none;
        }
        
        .newsletter-form button {
            position: absolute;
            right: 5px;
            top: 5px;
            height: 40px;
            width: 40px;
            border-radius: 50%;
            background: var(--primary-color);
            border: none;
            color: white;
            transition: all 0.3s ease;
        }
        
        .newsletter-form button:hover {
            background: var(--accent-color);
        }
        
        .footer-bottom {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 20px;
            margin-top: 50px;
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
                        <a class="nav-link active" href="Connexion.jsp">Connexion</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Inscription.jsp">Inscription</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contenu principal -->
    <div class="container">
        <div class="login-container">
            <!-- Formulaire à gauche -->
            <div class="login-form-container">
                <div class="login-header">
                    <h2>Connexion</h2>
                    <p>Accédez à votre espace personnel</p>
                </div>

                <!-- Formulaire de connexion -->
                <form action="../LoginController" method="post">

                    <% if (request.getAttribute("msg") != null) {%>
                    <div class="alert alert-danger text-center"><%= request.getAttribute("msg")%></div>
                    <% }%>

                    <!-- Champ Email -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Adresse email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="exemple@email.com" required>
                    </div>

                    <!-- Champ Mot de passe -->
                    <div class="mb-3">
                        <label for="password" class="form-label">Mot de passe</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Votre mot de passe" required>
                    </div>

                    <!-- Bouton de connexion -->
                    <button type="submit" class="btn btn-login">Se connecter</button>
                </form>

                <!-- Pied de page du formulaire -->
                <div class="login-footer">
                    <p>Vous n'avez pas de compte? <a href="Inscription.jsp">Créer un compte</a></p>
                </div>
            </div>

            <!-- Image à droite -->
            <div class="login-image-container">
                <div class="login-image-overlay">
                    <div class="login-image-title">Bienvenue sur ZahraMotion</div>
                    <div class="login-image-text">
                        Découvrez, participez et organisez des activités passionnantes avec notre communauté
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <h5>ZahraMotion</h5>
                    <p class="mb-4">Découvrez des expériences uniques avec des guides locaux passionnés partout en France.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                
                <div class="col-lg-2 col-md-4 col-6 mb-4">
                    <h5>Liens rapides</h5>
                    <ul class="list-unstyled">
                        <li><a href="index.jsp">Accueil</a></li>
                        <li><a href="about.jsp">À propos</a></li>
                        <li><a href="#">Activités</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
                
                <div class="col-lg-2 col-md-4 col-6 mb-4">
                    <h5>Catégories</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">ZahraMotion</a></li>
                        <li><a href="#">Gastronomie</a></li>
                        <li><a href="#">Culture</a></li>
                        <li><a href="#">Nature</a></li>
                        <li><a href="#">Bien-être</a></li>
                    </ul>
                </div>
                
                <div class="col-lg-4 col-md-4 mb-4">
                    <h5>Newsletter</h5>
                    <p>Inscrivez-vous pour recevoir nos dernières offres et actualités.</p>
                    <form class="newsletter-form">
                        <input type="email" class="form-control" placeholder="Votre email">
                        <button type="submit"><i class="fas fa-paper-plane"></i></button>
                    </form>
                </div>
            </div>
            
            <div class="footer-bottom">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start">
                        <p class="mb-0">&copy; <%= new java.util.Date().getYear() + 1900 %> ZahraMotion. Tous droits réservés.</p>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <a href="#">Conditions d'utilisation</a>
                        <span class="mx-2">|</span>
                        <a href="#">Politique de confidentialité</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>