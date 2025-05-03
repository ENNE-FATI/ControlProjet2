<%@page import="java.util.List"%>
<%@page import="entities.ActiviteTouristique"%>
<%@page import="services.ActivityService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Découvrez nos Activités</title>
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
            
            .main-content {
                margin-left: 100px;
                padding: 2rem 3rem;
            }
            
            .filter-section {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
                flex-wrap: wrap;
                gap: 1rem;
            }
            
            .search-bar {
                flex-grow: 1;
                max-width: 500px;
                position: relative;
            }
            
            .search-bar input {
                width: 100%;
                padding: 0.8rem 1rem 0.8rem 3rem;
                border-radius: 30px;
                border: 1px solid #ddd;
                font-size: 1rem;
            }
            
            .search-bar i {
                position: absolute;
                left: 1.2rem;
                top: 50%;
                transform: translateY(-50%);
                color: #666;
            }
            
            .filter-tags {
                display: flex;
                gap: 0.5rem;
                flex-wrap: wrap;
            }
            
            .tag {
                padding: 0.5rem 1rem;
                background-color: white;
                border-radius: 20px;
                font-size: 0.9rem;
                cursor: pointer;
                transition: all 0.2s;
                border: 1px solid #eee;
            }
            
            .tag:hover, .tag.active {
                background-color: var(--primary-color);
                color: white;
                border-color: var(--primary-color);
            }
            
            .activities-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                gap: 2rem;
            }
            
            .activity-card {
                background: var(--card-bg);
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                transition: all 0.3s;
            }
            
            .activity-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            }
            
            .activity-image {
                height: 200px;
                background-size: cover;
                background-position: center;
                position: relative;
            }
            
            .activity-badge {
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
            
            .activity-content {
                padding: 1.5rem;
            }
            
            .activity-title {
                font-size: 1.3rem;
                font-weight: 600;
                margin-bottom: 0.5rem;
                color: var(--dark-color);
            }
            
            .activity-location {
                display: flex;
                align-items: center;
                color: #666;
                font-size: 0.9rem;
                margin-bottom: 0.5rem;
            }
            
            .activity-location i {
                margin-right: 0.5rem;
                color: var(--primary-color);
            }
            
            .activity-description {
                color: #666;
                margin-bottom: 1rem;
                font-size: 0.9rem;
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
                overflow: hidden;
            }
            
            .activity-meta {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 1rem;
            }
            
            .activity-price {
                font-weight: 700;
                font-size: 1.2rem;
                color: var(--primary-color);
            }
            
            /* Style du bouton Réserver */
            .btn-reserver {
                background-color: var(--primary-color);
                color: white;
                border: none;
                padding: 0.6rem 1.2rem;
                border-radius: 8px;
                font-weight: 500;
                transition: all 0.2s;
                text-decoration: none;
                display: inline-block;
                cursor: pointer;
            }
            
            .btn-reserver:hover {
                background-color: var(--dark-color);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            
            .pagination {
                display: flex;
                justify-content: center;
                margin-top: 3rem;
                gap: 0.5rem;
            }
            
            .page-item {
                padding: 0.5rem 1rem;
                border-radius: 8px;
                cursor: pointer;
                transition: all 0.2s;
            }
            
            .page-item:hover, .page-item.active {
                background-color: var(--primary-color);
                color: white;
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
                
                .filter-section {
                    flex-direction: column;
                    align-items: stretch;
                }
                
                .search-bar {
                    max-width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <!-- Navigation Verticale -->
          <nav class="nav-vertical">
            <a href="Route?page=touriste" class="nav-item ">
                <i class="fas fa-home"></i>
                <span>Accueil</span>
            </a>
            <a href="Route?page=activitesTouriste" class="nav-item active">
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
            <header class="profile-header">
                <h1 style="font-size: 2rem; color: var(--dark-color);">Découvrez nos Activités</h1>
                <p style="color: #666;">Trouvez l'expérience parfaite pour votre prochain voyage</p>
            </header>

            <!-- Filtres et recherche -->
            <div class="filter-section">
                <div class="search-bar">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Rechercher une activité...">
                </div>
                
                <div class="filter-tags">
                    <div class="tag active">Toutes</div>
                    <div class="tag">Aventure</div>
                    <div class="tag">Culture</div>
                    <div class="tag">Gastronomie</div>
                    <div class="tag">Nature</div>
                    <div class="tag">Sports</div>
                </div>
            </div>

            <!-- Liste des activités -->
            <div class="activities-grid">
                <%
                    ActivityService as = new ActivityService();
                    List<ActiviteTouristique> activites = as.findAll();
                    
                    // Images par défaut
                    String[] defaultImages = {
                        "https://images.unsplash.com/photo-1539635278303-d4002c07eae3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                        "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                        "https://images.unsplash.com/photo-1527631746610-bca00a040d60?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                        "https://images.unsplash.com/photo-1464037866556-6812c9d1c72e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                        "https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1968&q=80",
                        "https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                    };
                    
                    if (activites != null && !activites.isEmpty()) {
                        for (int i = 0; i < activites.size(); i++) {
                            ActiviteTouristique activite = activites.get(i);
                            // Utilisation d'une image par défaut basée sur l'index
                            String imageUrl = defaultImages[i % defaultImages.length];
                            // Catégorie par défaut
                            String categorie = "Activité"; // Valeur par défaut
                %>
                <div class="activity-card">
                    <div class="activity-image" style="background-image: url('<%= imageUrl %>');">
                        <span class="activity-badge"><%= categorie %></span>
                    </div>
                    <div class="activity-content">
                        <h3 class="activity-title"><%= activite.getNom() %></h3>
                        <div class="activity-location">
                            <i class="fas fa-map-marker-alt"></i>
                            <span><%= activite.getLieu() != null ? activite.getLieu() : "Lieu non spécifié" %></span>
                        </div>
                        <p class="activity-description"><%= activite.getDescription() %></p>
                        <div class="activity-meta">
                            <span class="activity-price">€<%= activite.getPrix() %>/pers</span>
                            <a href="Route?page=reserver&id=<%= activite.getId() %>" class="btn-reserver">Réserver</a>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <div style="grid-column: 1 / -1; text-align: center; padding: 2rem;">
                    <i class="fas fa-map-marked-alt" style="font-size: 3rem; color: #ccc; margin-bottom: 1rem;"></i>
                    <p style="color: #666;">Aucune activité disponible pour le moment</p>
                </div>
                <%
                    }
                %>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <div class="page-item"><i class="fas fa-chevron-left"></i></div>
                <div class="page-item active">1</div>
                <div class="page-item">2</div>
                <div class="page-item">3</div>
                <div class="page-item"><i class="fas fa-chevron-right"></i></div>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>