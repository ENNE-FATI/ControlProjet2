<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>À propos - ZahraMotion</title>
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
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            color: var(--text-color);
            background-color: #FAFAFA;
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
        
        .page-header {
            position: relative;
            padding: 100px 0;
            background: linear-gradient(rgba(38, 70, 83, 0.8), rgba(42, 157, 143, 0.8)), 
                        url('https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            text-align: center;
        }
        
        .page-header h1 {
            font-weight: 700;
            margin-bottom: 15px;
        }
        
        .page-header p {
            max-width: 600px;
            margin: 0 auto;
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 50px;
        }
        
        .section-title h2 {
            font-weight: 700;
            color: var(--dark-color);
            margin-bottom: 15px;
            position: relative;
            display: inline-block;
        }
        
        .section-title h2:after {
            content: '';
            position: absolute;
            width: 50px;
            height: 3px;
            background: var(--primary-color);
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .section-title p {
            color: var(--text-light);
            max-width: 700px;
            margin: 0 auto;
        }
        
        .about-img {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .about-img img {
            width: 100%;
            height: auto;
            transition: all 0.5s ease;
        }
        
        .about-img:hover img {
            transform: scale(1.05);
        }
        
        .value-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: all 0.3s ease;
            height: 100%;
            border: none;
        }
        
        .value-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        
        .value-icon {
            width: 80px;
            height: 80px;
            background: rgba(42, 157, 143, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 2rem;
            color: var(--primary-color);
            transition: all 0.3s ease;
        }
        
        .value-card:hover .value-icon {
            background: var(--primary-color);
            color: white;
        }
        
        .value-card h4 {
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--dark-color);
        }
        
        .value-card p {
            color: var(--text-light);
            margin-bottom: 0;
        }
        
        .team-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            margin-bottom: 30px;
            border: none;
        }
        
        .team-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        
        .team-img {
            position: relative;
            overflow: hidden;
        }
        
        .team-img img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            transition: all 0.5s ease;
        }
        
        .team-card:hover .team-img img {
            transform: scale(1.1);
        }
        
        .team-social {
            position: absolute;
            bottom: -50px;
            left: 0;
            width: 100%;
            padding: 15px;
            background: rgba(42, 157, 143, 0.9);
            display: flex;
            justify-content: center;
            transition: all 0.3s ease;
        }
        
        .team-card:hover .team-social {
            bottom: 0;
        }
        
        .team-social a {
            width: 35px;
            height: 35px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
            margin: 0 5px;
            transition: all 0.3s ease;
        }
        
        .team-social a:hover {
            background: var(--accent-color);
            color: white;
            transform: translateY(-3px);
        }
        
        .team-info {
            padding: 20px;
            text-align: center;
        }
        
        .team-info h4 {
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--dark-color);
        }
        
        .team-info p {
            color: var(--text-light);
            margin-bottom: 0;
        }
        
        .timeline {
            position: relative;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .timeline::after {
            content: '';
            position: absolute;
            width: 6px;
            background-color: var(--primary-color);
            top: 0;
            bottom: 0;
            left: 50%;
            margin-left: -3px;
            border-radius: 3px;
        }
        
        .timeline-item {
            padding: 10px 40px;
            position: relative;
            width: 50%;
            box-sizing: border-box;
        }
        
        .timeline-item::after {
            content: '';
            position: absolute;
            width: 25px;
            height: 25px;
            right: -12px;
            top: 15px;
            border-radius: 50%;
            z-index: 1;
            background: white;
            border: 4px solid var(--primary-color);
        }
        
        .left {
            left: 0;
        }
        
        .right {
            left: 50%;
        }
        
        .right::after {
            left: -12px;
        }
        
        .timeline-content {
            padding: 20px 30px;
            background: white;
            position: relative;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
        }
        
        .timeline-content h3 {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 10px;
        }
        
        .timeline-content p {
            margin-bottom: 0;
            color: var(--text-light);
        }
        
        .timeline-content::before {
            content: '';
            position: absolute;
            border-style: solid;
            border-width: 10px;
            top: 15px;
        }
        
        .left .timeline-content::before {
            right: -20px;
            border-color: transparent transparent transparent white;
        }
        
        .right .timeline-content::before {
            left: -20px;
            border-color: transparent white transparent transparent;
        }
        
        .stats-item {
            text-align: center;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            height: 100%;
        }
        
        .stats-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        
        .stats-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }
        
        .stats-item h3 {
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 10px;
            color: var(--dark-color);
        }
        
        .stats-item p {
            color: var(--text-light);
            margin-bottom: 0;
            font-weight: 500;
        }
        
        .cta-section {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--dark-color) 100%);
            padding: 80px 0;
            color: white;
            text-align: center;
        }
        
        .cta-section h2 {
            font-weight: 700;
            margin-bottom: 20px;
        }
        
        .cta-section p {
            max-width: 600px;
            margin: 0 auto 30px;
            opacity: 0.9;
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
        
        @media (max-width: 991px) {
            .timeline::after {
                left: 31px;
            }
            
            .timeline-item {
                width: 100%;
                padding-left: 70px;
                padding-right: 25px;
            }
            
            .timeline-item::after {
                left: 18px;
            }
            
            .left::after, .right::after {
                left: 18px;
            }
            
            .left .timeline-content::before, .right .timeline-content::before {
                left: -20px;
                border-color: transparent white transparent transparent;
            }
            
            .right {
                left: 0;
            }
        }
    </style>
</head>
<body>
    <!-- Header/Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#">ZahraMotion<span>.</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Accueil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="about.jsp">À propos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Connexion.jsp">Connexion</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Inscription.jsp">Inscription</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <h1>Notre Histoire</h1>
            <p>Découvrez qui nous sommes et notre passion pour les expériences authentiques</p>
        </div>
    </section>

    <!-- About Section -->
    <section class="py-5">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="about-img">
                        <img src="https://images.unsplash.com/photo-1542744173-8e7e53415bb0?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" alt="Notre équipe" class="img-fluid">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="ps-lg-5">
                        <h2 class="mb-4 fw-bold">Notre mission</h2>
                        <p class="lead mb-4">Chez ZahraMotion, nous croyons que les meilleures expériences de voyage sont celles qui vous connectent avec la culture locale et les personnes qui y vivent.</p>
                        <p class="mb-4">Fondée en 2015, notre agence s'est donnée pour mission de créer des expériences authentiques et mémorables qui permettent aux voyageurs de découvrir la richesse culturelle et naturelle de la France à travers les yeux de ceux qui la connaissent le mieux : les locaux.</p>
                        <p>Nous travaillons avec un réseau de guides passionnés et d'experts locaux pour offrir des activités uniques qui vont au-delà du tourisme traditionnel. Que ce soit une randonnée dans les Alpes, un atelier de cuisine à Lyon ou une visite à vélo de Bordeaux, chaque expérience est conçue pour être immersive, enrichissante et respectueuse de l'environnement.</p>
                        <div class="mt-4">
                            <a href="#" class="btn btn-custom-primary">Découvrir nos activités</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Values Section -->
    <section class="py-5 bg-light">
        <div class="container py-5">
            <div class="section-title">
                <h2>Nos valeurs</h2>
                <p>Les principes qui guident chacune de nos actions et de nos décisions</p>
            </div>
            
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-handshake"></i>
                        </div>
                        <h4>Authenticité</h4>
                        <p>Nous privilégions les expériences authentiques qui reflètent la culture locale et favorisent les échanges humains enrichissants entre voyageurs et habitants.</p>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-leaf"></i>
                        </div>
                        <h4>Durabilité</h4>
                        <p>Nous nous engageons à promouvoir un tourisme responsable qui respecte l'environnement, soutient les économies locales et préserve le patrimoine culturel.</p>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-heart"></i>
                        </div>
                        <h4>Passion</h4>
                        <p>Nous sélectionnons des guides passionnés qui partagent leur amour pour leur région et leur savoir-faire avec enthousiasme et professionnalisme.</p>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h4>Communauté</h4>
                        <p>Nous créons des liens durables entre voyageurs et communautés locales, favorisant ainsi une compréhension mutuelle et des échanges culturels enrichissants.</p>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-star"></i>
                        </div>
                        <h4>Excellence</h4>
                        <p>Nous nous efforçons d'offrir un service de qualité exceptionnelle à chaque étape de l'expérience client, de la réservation jusqu'au retour chez soi.</p>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <h4>Innovation</h4>
                        <p>Nous recherchons constamment de nouvelles façons de créer des expériences uniques et mémorables qui sortent des sentiers battus du tourisme traditionnel.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    
    <!-- Timeline Section -->
    <section class="py-5 bg-light">
        <div class="container py-5">
            <div class="section-title">
                <h2>Notre histoire</h2>
                <p>Le parcours de ZahraMotion depuis sa création</p>
            </div>
            
            <div class="timeline">
                <div class="timeline-item left">
                    <div class="timeline-content">
                        <h3>2015</h3>
                        <p>Fondation de ZahraMotion par Claire Dubois avec une vision simple : connecter les voyageurs avec des expériences locales authentiques.</p>
                    </div>
                </div>
                
                <div class="timeline-item right">
                    <div class="timeline-content">
                        <h3>2017</h3>
                        <p>Expansion de notre réseau à plus de 50 guides locaux et lancement de notre première application mobile.</p>
                    </div>
                </div>
                
                <div class="timeline-item left">
                    <div class="timeline-content">
                        <h3>2019</h3>
                        <p>Obtention du prix "Meilleure Agence de Tourisme Durable" et ouverture de notre premier bureau à Lyon.</p>
                    </div>
                </div>
                
                <div class="timeline-item right">
                    <div class="timeline-content">
                        <h3>2021</h3>
                        <p>Lancement de notre programme de certification pour les guides et expansion dans toute la France.</p>
                    </div>
                </div>
                
                <div class="timeline-item left">
                    <div class="timeline-content">
                        <h3>2023</h3>
                        <p>Célébration de notre 100 000ème client et lancement de notre nouvelle plateforme de réservation en ligne.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="py-5">
        <div class="container py-5">
            <div class="section-title">
                <h2>ZahraMotion en chiffres</h2>
                <p>Des statistiques qui témoignent de notre croissance et de notre impact</p>
            </div>
            
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="stats-item">
                        <div class="stats-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3>100k+</h3>
                        <p>Clients satisfaits</p>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="stats-item">
                        <div class="stats-icon">
                            <i class="fas fa-map-marked-alt"></i>
                        </div>
                        <h3>50+</h3>
                        <p>Destinations</p>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="stats-item">
                        <div class="stats-icon">
                            <i class="fas fa-hiking"></i>
                        </div>
                        <h3>500+</h3>
                        <p>Activités uniques</p>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="stats-item">
                        <div class="stats-icon">
                            <i class="fas fa-award"></i>
                        </div>
                        <h3>200+</h3>
                        <p>Guides experts</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container">
            <h2>Prêt à vivre une ZahraMotion inoubliable ?</h2>
            <p>Rejoignez notre communauté de voyageurs passionnés et découvrez des expériences uniques partout en France.</p>
            <a href="index.jsp" class="btn btn-light btn-lg px-5 py-3 rounded-pill">Explorer nos activités</a>
        </div>
    </section>

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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>