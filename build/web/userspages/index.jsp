<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ZahraMotion - Explorez le monde autrement</title>
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
        
        .hero-section {
            position: relative;
            padding: 120px 0 150px;
            overflow: hidden;
            background-color: #F8F9FA;
        }
        
        .hero-bg {
            position: absolute;
            top: 0;
            right: 0;
            width: 50%;
            height: 100%;
            background: url('https://images.unsplash.com/photo-1533130061792-64b345e4a833?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            border-radius: 0 0 0 100px;
            z-index: 1;
        }
        
        .hero-bg:after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, rgba(42, 157, 143, 0.7) 0%, rgba(38, 70, 83, 0.4) 100%);
            border-radius: 0 0 0 100px;
        }
        
        .hero-content {
            position: relative;
            z-index: 2;
        }
        
        .hero-title {
            font-size: 3.5rem;
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 20px;
            color: var(--dark-color);
        }
        
        .hero-title span {
            color: var(--primary-color);
        }
        
        .hero-text {
            font-size: 1.1rem;
            color: var(--text-light);
            margin-bottom: 30px;
            max-width: 500px;
        }
        
        .feature-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            margin-bottom: 30px;
            border: none;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        
        .feature-card img {
            height: 220px;
            object-fit: cover;
        }
        
        .feature-card .card-body {
            padding: 25px;
        }
        
        .feature-card .card-title {
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--dark-color);
        }
        
        .feature-card .card-text {
            color: var(--text-light);
            margin-bottom: 20px;
        }
        
        .feature-card .card-price {
            font-weight: 700;
            color: var(--primary-color);
            font-size: 1.2rem;
        }
        
        .feature-card .card-location {
            color: var(--text-light);
            font-size: 0.9rem;
        }
        
        .feature-card .card-rating {
            color: var(--secondary-color);
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
        
        .category-card {
            position: relative;
            border-radius: 15px;
            overflow: hidden;
            margin-bottom: 30px;
            height: 200px;
        }
        
        .category-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: all 0.5s ease;
        }
        
        .category-card:hover img {
            transform: scale(1.1);
        }
        
        .category-card .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(0deg, rgba(0,0,0,0.7) 0%, rgba(0,0,0,0.3) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            color: white;
            text-align: center;
            padding: 20px;
        }
        
        .category-card .overlay h3 {
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .category-card .overlay p {
            font-size: 0.9rem;
            margin-bottom: 0;
        }
        
        .testimonial-section {
            background-color: var(--light-color);
            padding: 80px 0;
        }
        
        .testimonial-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            position: relative;
        }
        
        .testimonial-card:before {
            content: '\f10d';
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 2rem;
            color: rgba(42, 157, 143, 0.1);
        }
        
        .testimonial-card .testimonial-text {
            font-style: italic;
            margin-bottom: 20px;
            color: var(--text-light);
        }
        
        .testimonial-card .testimonial-author {
            display: flex;
            align-items: center;
        }
        
        .testimonial-card .testimonial-author img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
        }
        
        .testimonial-card .testimonial-author-info h5 {
            margin-bottom: 5px;
            font-weight: 600;
        }
        
        .testimonial-card .testimonial-author-info p {
            margin-bottom: 0;
            color: var(--text-light);
            font-size: 0.9rem;
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
        
        .stats-item {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .stats-item .stats-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 15px;
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
            .hero-bg {
                width: 100%;
                border-radius: 0;
            }
            
            .hero-content {
                text-align: center;
                padding: 0 20px;
            }
            
            .hero-text {
                margin: 0 auto 30px;
            }
            
            .hero-section {
                padding: 100px 0;
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
                        <a class="nav-link active" href="index.jsp">Accueil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">À propos</a>
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

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-bg"></div>
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 hero-content">
                    <h1 class="hero-title">Découvrez des <span>ZahraMotion</span> extraordinaires</h1>
                    <p class="hero-text">Explorez des expériences uniques guidées par des experts locaux et créez des souvenirs inoubliables partout en France.</p>
                    <div class="d-flex flex-wrap gap-3">
                        <a href="#categories" class="btn btn-custom-primary">Découvrir les activités</a>
                        <a href="about.jsp" class="btn btn-custom-secondary">En savoir plus</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="py-5" id="categories">
        <div class="container py-5">
            <div class="section-title">
                <h2>Explorez par catégorie</h2>
                <p>Découvrez nos activités soigneusement sélectionnées pour tous les goûts et toutes les passions</p>
            </div>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="category-card">
                        <img src="https://images.unsplash.com/photo-1551632811-561732d1e306?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" alt="ZahraMotion">
                        <div class="overlay">
                            <h3>ZahraMotion</h3>
                            <p>15 activités</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="category-card">
                        <img src="https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" alt="Gastronomie">
                        <div class="overlay">
                            <h3>Gastronomie</h3>
                            <p>12 activités</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="category-card">
                        <img src="https://images.unsplash.com/photo-1513883049090-d0b7439799bf?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" alt="Culture">
                        <div class="overlay">
                            <h3>Culture</h3>
                            <p>18 activités</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Activities -->
    <section class="py-5 bg-light">
        <div class="container py-5">
            <div class="section-title">
                <h2>Activités populaires</h2>
                <p>Les expériences les mieux notées et les plus appréciées par nos clients</p>
            </div>
            
            <div class="row">
    <!-- Surf -->
 <!-- Surf -->
<div class="col-lg-4 col-md-6">
    <div class="feature-card">
        <img src="https://images.unsplash.com/photo-1502680390469-be75c86b636f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" class="card-img-top" alt="Cours de surf">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-2">
               
                <div class="card-rating">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                    <span class="ms-1 text-muted">(4.0)</span>
                </div>
            </div>
            <h5 class="card-title">Cours de surf</h5>
            <p class="card-text">Cours de surf pour débutants et confirmés.</p>
            <div class="d-flex justify-content-between align-items-center">
                <span class="card-price">320€ <small class="text-muted">/personne</small></span>
                <span class="card-location"><i class="fas fa-map-marker-alt me-1"></i> Agadir</span>
            </div>
        </div>
    </div>
</div>

<!-- Quad -->
<div class="col-lg-4 col-md-6">
    <div class="feature-card">
        <img src="https://dynamic-media.tacdn.com/media/photo-o/2f/0c/e0/f0/caption.jpg?w=1400&h=1000&s=1" class="card-img-top" alt="Balade en Quad">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-2">
               
                <div class="card-rating">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                    <span class="ms-1 text-muted">(4.5)</span>
                </div>
            </div>
            <h5 class="card-title">Balade en Quad</h5>
            <p class="card-text">Une heure de Quad dans les dunes autour de Marrakech.</p>
            <div class="d-flex justify-content-between align-items-center">
                <span class="card-price">250€ <small class="text-muted">/personne</small></span>
                <span class="card-location"><i class="fas fa-map-marker-alt me-1"></i> Marrakech</span>
            </div>
        </div>
    </div>
</div>

<!-- Musée de la Kasbah -->
<div class="col-lg-4 col-md-6">
    <div class="feature-card">
        <img src="https://images.unsplash.com/photo-1564399579883-451a5d44ec08?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" class="card-img-top" alt="Musée de la Kasbah">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-2">
               
                <div class="card-rating">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                    <i class="far fa-star"></i>
                    <span class="ms-1 text-muted">(3.0)</span>
                </div>
            </div>
            <h5 class="card-title">Visite du musée de la Kasbah</h5>
            <p class="card-text">Découvrez le patrimoine marocain au musée historique de Tanger.</p>
            <div class="d-flex justify-content-between align-items-center">
                <span class="card-price">2€ <small class="text-muted">/personne</small></span>
                <span class="card-location"><i class="fas fa-map-marker-alt me-1"></i> Tanger</span>
            </div>
        </div>
    </div>
</div>

            <div class="text-center mt-5">
                <a href="#" class="btn btn-custom-secondary" onclick="alertConnexion(event)">Voir toutes les activités</a>
            </div>
        </div>
    </section>

    <!-- Why Choose Us -->
    <section class="py-5">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <img src="https://images.unsplash.com/photo-1527529482837-4698179dc6ce?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" alt="Pourquoi nous choisir" class="img-fluid rounded-4 shadow">
                </div>
                <div class="col-lg-6">
                    <div class="ps-lg-5">
                        <h2 class="mb-4 fw-bold">Pourquoi choisir ZahraMotion ?</h2>
                        <p class="mb-4">Nous nous engageons à vous offrir des expériences authentiques et mémorables avec des guides locaux passionnés.</p>
                        
                        <div class="d-flex mb-4">
                            <div class="flex-shrink-0">
                                <div class="bg-primary rounded-circle p-3 text-white" style="width: 50px; height: 50px; display: flex; align-items: center; justify-content: center;">
                                    <i class="fas fa-check"></i>
                                </div>
                            </div>
                            <div class="ms-3">
                                <h5>Guides experts locaux</h5>
                                <p class="text-muted mb-0">Tous nos guides sont des locaux passionnés qui connaissent parfaitement leur région.</p>
                            </div>
                        </div>
                        
                        <div class="d-flex mb-4">
                            <div class="flex-shrink-0">
                                <div class="bg-primary rounded-circle p-3 text-white" style="width: 50px; height: 50px; display: flex; align-items: center; justify-content: center;">
                                    <i class="fas fa-users"></i>
                                </div>
                            </div>
                            <div class="ms-3">
                                <h5>Petits groupes</h5>
                                <p class="text-muted mb-0">Nous privilégions les petits groupes pour une expérience plus personnalisée et conviviale.</p>
                            </div>
                        </div>
                        
                        <div class="d-flex">
                            <div class="flex-shrink-0">
                                <div class="bg-primary rounded-circle p-3 text-white" style="width: 50px; height: 50px; display: flex; align-items: center; justify-content: center;">
                                    <i class="fas fa-heart"></i>
                                </div>
                            </div>
                            <div class="ms-3">
                                <h5>Expériences authentiques</h5>
                                <p class="text-muted mb-0">Nous vous proposons des activités uniques, loin des sentiers battus du tourisme de masse.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials -->
  <section class="testimonial-section">
    <div class="container py-5">
        <div class="section-title text-center">
            <h2>Ce que disent nos clients</h2>
            <p>Découvrez les témoignages de ceux qui ont vécu l'expérience ZahraMotion</p>
        </div>
        
        <div class="row justify-content-center">
            <div class="col-lg-4 col-12">
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "La randonnée dans les Alpes était absolument incroyable ! Notre guide Thomas connaissait parfaitement la région et nous a montré des endroits secrets que nous n'aurions jamais découverts seuls."
                    </div>
                    <div class="testimonial-author">
                        <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="Client">
                        <div class="testimonial-author-info">
                            <h5>Marie Laurent</h5>
                            <p>Paris, France</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4 col-12">
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "L'atelier cuisine à Lyon était une expérience unique. Le chef était passionné et nous a appris des techniques que j'utilise maintenant tous les jours. Un moment convivial et enrichissant !"
                    </div>
                    <div class="testimonial-author">
                        <img src="https://randomuser.me/api/portraits/men/45.jpg" alt="Client">
                        <div class="testimonial-author-info">
                            <h5>Pierre Dubois</h5>
                            <p>Marseille, France</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4 col-12">
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "Le tour à vélo de Bordeaux était le point fort de notre week-end. Notre guide était très sympathique et connaissait parfaitement l'histoire de la ville. Une façon géniale de découvrir Bordeaux !"
                    </div>
                    <div class="testimonial-author">
                        <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Client">
                        <div class="testimonial-author-info">
                            <h5>Sophie Tremblay</h5>
                            <p>Lyon, France</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

    <!-- Stats Section -->
    <section class="py-5">
        <div class="container py-5">
            <div class="row">
                <div class="col-md-3 col-6">
                    <div class="stats-item">
                        <div class="stats-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3>15k+</h3>
                        <p>Clients satisfaits</p>
                    </div>
                </div>
                
                <div class="col-md-3 col-6">
                    <div class="stats-item">
                        <div class="stats-icon">
                            <i class="fas fa-map-marked-alt"></i>
                        </div>
                        <h3>120+</h3>
                        <p>Destinations</p>
                    </div>
                </div>
                
                <div class="col-md-3 col-6">
                    <div class="stats-item">
                        <div class="stats-icon">
                            <i class="fas fa-hiking"></i>
                        </div>
                        <h3>500+</h3>
                        <p>Activités</p>
                    </div>
                </div>
                
                <div class="col-md-3 col-6">
                    <div class="stats-item">
                        <div class="stats-icon">
                            <i class="fas fa-award"></i>
                        </div>
                        <h3>50+</h3>
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
            <a href="inscription.jsp" class="btn btn-light btn-lg px-5 py-3 rounded-pill">Commencer l'ZahraMotion</a>
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
    <script>
  function alertConnexion(event) {
    event.preventDefault(); // Empêche la navigation
    alert("Veuillez vous connecter d'abord pour voir toutes les activités.");
  }
</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>