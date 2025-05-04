<%@page import="java.util.List"%>
<%@page import="entities.ActiviteTouristique"%>
<%@page import="services.ActivityService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
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
            
            .search-container {
                flex-grow: 1;
                max-width: 500px;
                position: relative;
            }
            
            .search-input {
                width: 100%;
                padding: 0.8rem 1rem 0.8rem 3rem;
                border-radius: 30px;
                border: 1px solid #ddd;
                font-size: 1rem;
                transition: all 0.3s;
            }
            
            .search-input:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 0.25rem rgba(0, 168, 150, 0.25);
            }
            
            .search-icon {
                position: absolute;
                left: 1.2rem;
                top: 50%;
                transform: translateY(-50%);
                color: #666;
            }
            
            .search-results {
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background: white;
                border-radius: 0 0 8px 8px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                max-height: 300px;
                overflow-y: auto;
                display: none;
                z-index: 100;
                border: 1px solid #ddd;
                border-top: none;
            }
            
            .search-result-item {
                padding: 12px 16px;
                cursor: pointer;
                border-bottom: 1px solid #eee;
                transition: all 0.2s;
            }
            
            .search-result-item:hover {
                background-color: #f8f9fa;
            }
            
            .search-result-item:last-child {
                border-bottom: none;
            }
            
            .result-title {
                font-weight: 600;
                color: var(--dark-color);
            }
            
            .result-location {
                font-size: 0.8rem;
                color: #666;
                margin-top: 2px;
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
                
                .search-container {
                    max-width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <!-- Navigation Verticale -->
        <nav class="nav-vertical">
            <a href="Route?page=touriste" class="nav-item">
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
            <a href="LogoutController" class="nav-item">
                <i class="fas fa-sign-out-alt"></i>
                <span>Déconnexion</span>
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
                <div class="search-container" id="searchContainer">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" class="search-input" id="searchInput" placeholder="Rechercher une activité...">
                    <div class="search-results" id="searchResults"></div>
                </div>
                
                
            </div>

            <!-- Liste des activités -->
            <div class="activities-grid" id="activitiesGrid">
                <%
                    ActivityService as = new ActivityService();
                    List<ActiviteTouristique> activites = as.findAll();
                    
                    String[] defaultImages = {
                        "data:image/jpeg;base64,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",
                        "data:image/jpeg;base64,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",
     
                        "https://images.unsplash.com/photo-1527631746610-bca00a040d60?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                        "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                                           "https://images.unsplash.com/photo-1539635278303-d4002c07eae3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                        "https://images.unsplash.com/photo-1464037866556-6812c9d1c72e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                        "https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1968&q=80",
                        "https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                        
                    };
                    
                    if (activites != null && !activites.isEmpty()) {
                        for (int i = 0; i < activites.size(); i++) {
                            ActiviteTouristique activite = activites.get(i);
                            String imageUrl = defaultImages[i % defaultImages.length];
                            String categorie = "Activité";
                %>
                <div class="activity-card" data-name="<%= activite.getNom().toLowerCase() %>" data-location="<%= activite.getLieu() != null ? activite.getLieu().toLowerCase() : "" %>">
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
        
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const searchInput = document.getElementById('searchInput');
                const searchResults = document.getElementById('searchResults');
                const activitiesGrid = document.getElementById('activitiesGrid');
                const activityCards = activitiesGrid.querySelectorAll('.activity-card');
                const tags = document.querySelectorAll('.tag');
                
                // Fonction de recherche en temps réel
                searchInput.addEventListener('input', function() {
                    const searchTerm = this.value.toLowerCase().trim();
                    searchResults.style.display = 'none';
                    
                    if (searchTerm.length > 2) {
                        filterActivities(searchTerm);
                        showSearchResults(searchTerm);
                    } else {
                        resetActivities();
                    }
                });
                
                // Filtrage des activités
                function filterActivities(searchTerm) {
                    let hasResults = false;
                    
                    activityCards.forEach(card => {
                        const name = card.dataset.name;
                        const location = card.dataset.location;
                        
                        if (name.includes(searchTerm) || location.includes(searchTerm)) {
                            card.style.display = 'block';
                            hasResults = true;
                        } else {
                            card.style.display = 'none';
                        }
                    });
                    
                    // Afficher un message si aucun résultat
                    if (!hasResults) {
                        const noResults = document.createElement('div');
                        noResults.style.gridColumn = '1 / -1';
                        noResults.style.textAlign = 'center';
                        noResults.style.padding = '2rem';
                        noResults.innerHTML = `
                            <i class="fas fa-search" style="font-size: 2rem; color: #ccc; margin-bottom: 1rem;"></i>
                            <p style="color: #666;">Aucun résultat trouvé pour "${searchTerm}"</p>
                        `;
                        
                        // Vérifier si le message existe déjà
                        if (!activitiesGrid.querySelector('.no-results-message')) {
                            noResults.classList.add('no-results-message');
                            activitiesGrid.appendChild(noResults);
                        }
                    } else {
                        const noResultsMsg = activitiesGrid.querySelector('.no-results-message');
                        if (noResultsMsg) {
                            noResultsMsg.remove();
                        }
                    }
                }
                
                // Réinitialiser l'affichage des activités
                function resetActivities() {
                    activityCards.forEach(card => {
                        card.style.display = 'block';
                    });
                    
                    const noResultsMsg = activitiesGrid.querySelector('.no-results-message');
                    if (noResultsMsg) {
                        noResultsMsg.remove();
                    }
                }
                
                // Afficher les résultats de recherche dans le dropdown
                function showSearchResults(searchTerm) {
                    // Simuler des résultats (remplacer par un appel AJAX en production)
                    const mockResults = [
                        { id: 1, nom: 'Surf à Taghazout', lieu: 'Taghazout' },
                        { id: 2, nom: 'Visite de Marrakech', lieu: 'Marrakech' },
                        { id: 3, nom: 'Randonnée dans l\'Atlas', lieu: 'Montagnes Atlas' }
                    ].filter(item => 
                        item.nom.toLowerCase().includes(searchTerm) || 
                        item.lieu.toLowerCase().includes(searchTerm)
                    );
                    
                    searchResults.innerHTML = '';
                    
                    if (mockResults.length > 0) {
                        mockResults.forEach(result => {
                            const resultItem = document.createElement('div');
                            resultItem.className = 'search-result-item';
                            resultItem.innerHTML = `
                                <div class="result-title">${result.nom}</div>
                                <div class="result-location">${result.lieu}</div>
                            `;
                            
                            resultItem.addEventListener('click', function() {
                                window.location.href = `Route?page=reserver&id=${result.id}`;
                            });
                            
                            searchResults.appendChild(resultItem);
                        });
                        
                        searchResults.style.display = 'block';
                    }
                }
                
                // Cacher les résultats quand on clique ailleurs
                document.addEventListener('click', function(e) {
                    if (!e.target.closest('#searchContainer')) {
                        searchResults.style.display = 'none';
                    }
                });
                
                // Filtrage par tags
                tags.forEach(tag => {
                    tag.addEventListener('click', function() {
                        tags.forEach(t => t.classList.remove('active'));
                        this.classList.add('active');
                        
                        // Ici vous pourriez implémenter le filtrage par catégorie
                        // Pour l'instant on réinitialise juste l'affichage
                        resetActivities();
                    });
                });
            });
        </script>
    </body>
</html>