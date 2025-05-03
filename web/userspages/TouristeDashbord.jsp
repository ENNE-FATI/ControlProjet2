<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mon Espace Voyageur</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary-color: #00A896;
                --secondary-color: #02C39A;
                --accent-color: #F0F3BD;
                --dark-color: #05668D;
                --light-color: #F7F9FC;
                --text-color: #333333;
                --card-bg: #FFFFFF;
            }
            
            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--light-color);
                color: var(--text-color);
                line-height: 1.6;
            }
            
            /* Navigation Verticale */
            .nav-vertical {
                width: 100px;
                background: linear-gradient(180deg, var(--primary-color), var(--secondary-color));
                position: fixed;
                height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding-top: 2rem;
                z-index: 100;
                box-shadow: 4px 0 15px rgba(0, 0, 0, 0.1);
            }
            
            .nav-item {
                width: 100%;
                text-align: center;
                padding: 1rem 0;
                margin-bottom: 1.5rem;
                color: white;
                text-decoration: none;
                transition: all 0.3s;
                position: relative;
            }
            
            .nav-item.active {
                background-color: rgba(255, 255, 255, 0.2);
            }
            
            .nav-item:hover {
                background-color: rgba(255, 255, 255, 0.15);
            }
            
            .nav-item i {
                font-size: 1.5rem;
                margin-bottom: 0.5rem;
                display: block;
            }
            
            .nav-item span {
                font-size: 0.7rem;
                font-weight: 500;
            }
            
            .nav-item.active::after {
                content: '';
                position: absolute;
                right: 0;
                top: 0;
                height: 100%;
                width: 4px;
                background-color: var(--accent-color);
            }
            
            /* Main Content */
            .main-content {
                margin-left: 100px;
                padding: 2rem 3rem;
            }
            
            /* Header */
            .profile-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 3rem;
            }
            
            .welcome-message h1 {
                font-size: 2.2rem;
                font-weight: 700;
                color: var(--dark-color);
                margin-bottom: 0.5rem;
            }
            
            .welcome-message p {
                color: #666;
                font-size: 1rem;
            }
            
            .user-profile {
                display: flex;
                align-items: center;
                gap: 1rem;
            }
            
            .user-avatar {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background-color: var(--primary-color);
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-weight: bold;
                font-size: 1.2rem;
            }
            
            .user-name {
                font-weight: 600;
            }
            
            /* Stats Cards */
            .stats-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                gap: 1.5rem;
                margin-bottom: 3rem;
            }
            
            .stat-card {
                background: var(--card-bg);
                border-radius: 15px;
                padding: 1.5rem;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                transition: transform 0.3s, box-shadow 0.3s;
                border-left: 5px solid var(--primary-color);
                display: flex;
                align-items: center;
                gap: 1.5rem;
            }
            
            .stat-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            }
            
            .stat-icon {
                width: 50px;
                height: 50px;
                border-radius: 12px;
                background-color: rgba(0, 168, 150, 0.1);
                display: flex;
                align-items: center;
                justify-content: center;
                color: var(--primary-color);
                font-size: 1.5rem;
            }
            
            .stat-info h3 {
                font-size: 1.8rem;
                font-weight: 700;
                margin-bottom: 0.2rem;
                color: var(--dark-color);
            }
            
            .stat-info p {
                color: #666;
                font-size: 0.9rem;
                margin: 0;
            }
            
            /* Upcoming Trips */
            .section-title {
                font-size: 1.5rem;
                font-weight: 600;
                color: var(--dark-color);
                margin-bottom: 1.5rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            
            .section-title a {
                font-size: 0.9rem;
                font-weight: 500;
                color: var(--primary-color);
                text-decoration: none;
            }
            
            .trips-container {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                gap: 1.5rem;
                margin-bottom: 3rem;
            }
            
            .trip-card {
                background: var(--card-bg);
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                transition: transform 0.3s;
            }
            
            .trip-card:hover {
                transform: translateY(-5px);
            }
            
            .trip-image {
                height: 150px;
                background-size: cover;
                background-position: center;
                position: relative;
            }
            
            .trip-badge {
                position: absolute;
                top: 1rem;
                right: 1rem;
                background-color: var(--accent-color);
                color: var(--text-color);
                padding: 0.3rem 0.8rem;
                border-radius: 20px;
                font-size: 0.8rem;
                font-weight: 500;
            }
            
            .trip-content {
                padding: 1.5rem;
            }
            
            .trip-title {
                font-size: 1.2rem;
                font-weight: 600;
                margin-bottom: 0.5rem;
                color: var(--dark-color);
            }
            
            .trip-date {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                color: #666;
                font-size: 0.9rem;
                margin-bottom: 1rem;
            }
            
            .trip-meta {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            
            .trip-price {
                font-weight: 700;
                font-size: 1.1rem;
                color: var(--primary-color);
            }
            
            .btn-trip {
                background-color: var(--primary-color);
                color: white;
                border: none;
                padding: 0.5rem 1rem;
                border-radius: 8px;
                font-weight: 500;
                transition: all 0.2s;
            }
            
            .btn-trip:hover {
                background-color: var(--dark-color);
            }
            
            /* Recommended Activities */
            .activities-scroll {
                display: flex;
                gap: 1.5rem;
                overflow-x: auto;
                padding-bottom: 1rem;
                scrollbar-width: thin;
            }
            
            .activities-scroll::-webkit-scrollbar {
                height: 6px;
            }
            
            .activities-scroll::-webkit-scrollbar-thumb {
                background-color: var(--primary-color);
                border-radius: 3px;
            }
            
            .activity-card {
                min-width: 250px;
                background: var(--card-bg);
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            }
            
            .activity-image {
                height: 120px;
                background-size: cover;
                background-position: center;
            }
            
            .activity-body {
                padding: 1.2rem;
            }
            
            .activity-title {
                font-size: 1rem;
                font-weight: 600;
                margin-bottom: 0.5rem;
            }
            
            .activity-location {
                display: flex;
                align-items: center;
                gap: 0.3rem;
                color: #666;
                font-size: 0.8rem;
                margin-bottom: 0.8rem;
            }
            
            .activity-footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            
            .activity-price {
                font-weight: 700;
                color: var(--primary-color);
            }
            
            .btn-explore {
                background-color: transparent;
                color: var(--primary-color);
                border: 1px solid var(--primary-color);
                padding: 0.3rem 0.8rem;
                border-radius: 20px;
                font-size: 0.8rem;
                transition: all 0.2s;
            }
            
            .btn-explore:hover {
                background-color: var(--primary-color);
                color: white;
            }
            
            /* Responsive */
            @media (max-width: 992px) {
                .main-content {
                    padding: 2rem;
                }
            }
            
            @media (max-width: 768px) {
                .nav-vertical {
                    width: 100%;
                    height: auto;
                    bottom: 0;
                    top: auto;
                    flex-direction: row;
                    justify-content: space-around;
                    padding: 0.5rem 0;
                }
                
                .main-content {
                    margin-left: 0;
                    margin-bottom: 80px;
                    padding: 1.5rem;
                }
                
                .profile-header {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 1rem;
                }
                
                .user-profile {
                    width: 100%;
                    justify-content: flex-end;
                }
            }
        </style>
    </head>
    <body>
        <!-- Navigation Verticale -->
        <nav class="nav-vertical">
            <a href="Route?page=touriste" class="nav-item active">
                <i class="fas fa-home"></i>
                <span>Accueil</span>
            </a>
            <a href="Route?page=activitesTouriste" class="nav-item">
                <i class="fas fa-map-marked-alt"></i>
                <span>Activités</span>
            </a>
            <a href="MesReservationController" class="nav-item">
                <i class="fas fa-calendar-check"></i>
                <span>Réservations</span>
            </a>
            <a href="Route?page=profil" class="nav-item">
                <i class="fas fa-user"></i>
                <span>Profil</span>
            </a>
        </nav>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Header -->
            <header class="profile-header">
                <div class="welcome-message">
                    <h1>Bonjour, Jean</h1>
                    <p>Prêt pour votre prochaine aventure ?</p>
                </div>
                <div class="user-profile">
                    <div class="user-avatar">JP</div>
                    <div class="user-name">Jean P.</div>
                </div>
            </header>

            <!-- Stats Cards -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <div class="stat-info">
                        <h3>3</h3>
                        <p>Réservations actives</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <div class="stat-info">
                        <h3>8</h3>
                        <p>Activités favorites</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <div class="stat-info">
                        <h3>4.8</h3>
                        <p>Votre note moyenne</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-map-marked-alt"></i>
                    </div>
                    <div class="stat-info">
                        <h3>5</h3>
                        <p>Destinations explorées</p>
                    </div>
                </div>
            </div>

            <!-- Upcoming Trips -->
            <section>
                <h2 class="section-title">
                    Vos prochains voyages
                    <a href="Route?page=reservations">Voir tout</a>
                </h2>
                
                <div class="trips-container">
                    <!-- Trip 1 -->
                    <div class="trip-card">
                        <div class="trip-image" style="background-image: url('https://images.unsplash.com/photo-1464037866556-6812c9d1c72e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');">
                            <span class="trip-badge">Confirmé</span>
                        </div>
                        <div class="trip-content">
                            <h3 class="trip-title">Randonnée alpine</h3>
                            <div class="trip-date">
                                <i class="far fa-calendar-alt"></i>
                                15 Juin 2023 - 08:30
                            </div>
                            <div class="trip-meta">
                                <span class="trip-price">€120</span>
                                <button class="btn-trip">Détails</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Trip 2 -->
                    <div class="trip-card">
                        <div class="trip-image" style="background-image: url('https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80');">
                            <span class="trip-badge" style="background-color: #FEF3C7; color: #92400E;">En attente</span>
                        </div>
                        <div class="trip-content">
                            <h3 class="trip-title">Visite culturelle</h3>
                            <div class="trip-date">
                                <i class="far fa-calendar-alt"></i>
                                22 Juin 2023 - 14:00
                            </div>
                            <div class="trip-meta">
                                <span class="trip-price">€65</span>
                                <button class="btn-trip">Détails</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Trip 3 -->
                    <div class="trip-card">
                        <div class="trip-image" style="background-image: url('https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1968&q=80');">
                            <span class="trip-badge">Confirmé</span>
                        </div>
                        <div class="trip-content">
                            <h3 class="trip-title">Safari photo</h3>
                            <div class="trip-date">
                                <i class="far fa-calendar-alt"></i>
                                5 Juillet 2023 - 06:00
                            </div>
                            <div class="trip-meta">
                                <span class="trip-price">€210</span>
                                <button class="btn-trip">Détails</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Recommended Activities -->
            <section>
                <h2 class="section-title">
                    Recommandé pour vous
                    <a href="Route?page=activites">Tout explorer</a>
                </h2>
                
                <div class="activities-scroll">
                    <!-- Activity 1 -->
                    <div class="activity-card">
                        <div class="activity-image" style="background-image: url('https://images.unsplash.com/photo-1539635278303-d4002c07eae3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');"></div>
                        <div class="activity-body">
                            <h4 class="activity-title">Excursion en bateau</h4>
                            <div class="activity-location">
                                <i class="fas fa-map-marker-alt"></i>
                                Côte d'Azur, France
                            </div>
                            <div class="activity-footer">
                                <span class="activity-price">€75</span>
                                <button class="btn-explore">Explorer</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Activity 2 -->
                    <div class="activity-card">
                        <div class="activity-image" style="background-image: url('https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');"></div>
                        <div class="activity-body">
                            <h4 class="activity-title">Dégustation de vins</h4>
                            <div class="activity-location">
                                <i class="fas fa-map-marker-alt"></i>
                                Bordeaux, France
                            </div>
                            <div class="activity-footer">
                                <span class="activity-price">€50</span>
                                <button class="btn-explore">Explorer</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Activity 3 -->
                    <div class="activity-card">
                        <div class="activity-image" style="background-image: url('https://images.unsplash.com/photo-1527631746610-bca00a040d60?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');"></div>
                        <div class="activity-body">
                            <h4 class="activity-title">Visite guidée historique</h4>
                            <div class="activity-location">
                                <i class="fas fa-map-marker-alt"></i>
                                Paris, France
                            </div>
                            <div class="activity-footer">
                                <span class="activity-price">€35</span>
                                <button class="btn-explore">Explorer</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Activity 4 -->
                    <div class="activity-card">
                        <div class="activity-image" style="background-image: url('https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80');"></div>
                        <div class="activity-body">
                            <h4 class="activity-title">Atelier cuisine locale</h4>
                            <div class="activity-location">
                                <i class="fas fa-map-marker-alt"></i>
                                Lyon, France
                            </div>
                            <div class="activity-footer">
                                <span class="activity-price">€60</span>
                                <button class="btn-explore">Explorer</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Activity 5 -->
                    <div class="activity-card">
                        <div class="activity-image" style="background-image: url('https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1968&q=80');"></div>
                        <div class="activity-body">
                            <h4 class="activity-title">Observation des étoiles</h4>
                            <div class="activity-location">
                                <i class="fas fa-map-marker-alt"></i>
                                Provence, France
                            </div>
                            <div class="activity-footer">
                                <span class="activity-price">€45</span>
                                <button class="btn-explore">Explorer</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>