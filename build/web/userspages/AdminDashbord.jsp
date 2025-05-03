<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tableau de bord - Administration</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary-color: #4361ee;
                --secondary-color: #3a0ca3;
                --accent-color: #f72585;
                --light-color: #f8f9fa;
                --dark-color: #212529;
                --sidebar-width: 280px;
                --success-color: #4cc9f0;
            }
            
            body {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
                background-color: #f5f7fb;
                color: #333;
                line-height: 1.6;
            }

            .app-container {
                display: flex;
                min-height: 100vh;
            }

            /* Sidebar */
            .sidebar {
                width: var(--sidebar-width);
                background: white;
                box-shadow: 2px 0 15px rgba(0, 0, 0, 0.05);
                position: fixed;
                height: 100vh;
                z-index: 100;
                padding: 1.5rem 0;
            }

            .sidebar-header {
                padding: 0 1.5rem 1.5rem;
                border-bottom: 1px solid #eee;
                margin-bottom: 1rem;
                display: flex;
                align-items: center;
            }

            .logo {
                height: 40px;
                margin-right: 10px;
            }

            .sidebar-header h4 {
                font-weight: 700;
                color: var(--secondary-color);
                margin: 0;
            }

            .sidebar-menu {
                padding: 0 1rem;
            }

            .sidebar-menu a {
                display: flex;
                align-items: center;
                padding: 0.75rem 1rem;
                color: #555;
                text-decoration: none;
                border-radius: 8px;
                margin-bottom: 0.5rem;
                transition: all 0.2s;
            }

            .sidebar-menu a:hover, 
            .sidebar-menu a.active {
                background-color: #f0f4ff;
                color: var(--primary-color);
                font-weight: 500;
            }

            .sidebar-menu i {
                width: 24px;
                text-align: center;
                margin-right: 0.75rem;
                font-size: 1.1rem;
            }

            .sidebar-footer {
                padding: 1.5rem;
                position: absolute;
                bottom: 0;
                width: 100%;
            }

            /* Main Content */
            .main-content {
                margin-left: var(--sidebar-width);
                flex: 1;
                padding: 2rem;
            }

            /* Header Section */
            .header-section {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
            }

            .header-title h1 {
                font-size: 1.8rem;
                font-weight: 700;
                color: var(--dark-color);
                margin-bottom: 0.5rem;
            }

            .header-title p {
                color: #6c757d;
                margin: 0;
            }

            /* Stats Cards */
            .stats-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 1.5rem;
                margin-bottom: 2rem;
            }

            .stat-card {
                background: white;
                border-radius: 10px;
                padding: 1.5rem;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
                transition: transform 0.3s;
            }

            .stat-card:hover {
                transform: translateY(-5px);
            }

            .stat-card h3 {
                font-size: 1.5rem;
                font-weight: 600;
                margin-bottom: 0.5rem;
                color: var(--dark-color);
            }

            .stat-card p {
                color: #6c757d;
                margin: 0;
                font-size: 0.9rem;
            }

            .stat-card i {
                font-size: 1.5rem;
                margin-bottom: 1rem;
                color: var(--primary-color);
            }

            .stat-card:nth-child(1) { border-left: 4px solid var(--primary-color); }
            .stat-card:nth-child(2) { border-left: 4px solid var(--success-color); }
            .stat-card:nth-child(3) { border-left: 4px solid #f72585; }
            .stat-card:nth-child(4) { border-left: 4px solid #7209b7; }

            /* Recent Activity */
            .activity-card {
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                padding: 1.5rem;
                margin-bottom: 2rem;
            }

            .activity-card h3 {
                font-size: 1.25rem;
                font-weight: 600;
                margin-bottom: 1.5rem;
                color: var(--dark-color);
            }

            .activity-item {
                display: flex;
                padding: 1rem 0;
                border-bottom: 1px solid #eee;
            }

            .activity-icon {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: #f0f4ff;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 1rem;
                color: var(--primary-color);
            }

            .activity-content {
                flex: 1;
            }

            .activity-title {
                font-weight: 600;
                margin-bottom: 0.25rem;
            }

            .activity-time {
                font-size: 0.8rem;
                color: #6c757d;
            }

            /* Responsive */
            @media (max-width: 992px) {
                .stats-container {
                    grid-template-columns: repeat(2, 1fr);
                }
            }

            @media (max-width: 768px) {
                .sidebar {
                    transform: translateX(-100%);
                    transition: transform 0.3s;
                    z-index: 1000;
                }
                .sidebar.active {
                    transform: translateX(0);
                }
                .main-content {
                    margin-left: 0;
                    width: 100%;
                }
                .header-section {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 1rem;
                }
            }
        </style>
    </head>
    <body>
        <div class="app-container">
            <!-- Sidebar -->
            <div class="sidebar">
               <div class="sidebar-header">
                    <h4><i class="fas fa-compass" style="color: var(--primary-color)"></i> TourAdmin</h4>
                </div>
                <div class="sidebar-menu">
                    <a href="Route?page=admin" class="active">
                        <i class="fas fa-tachometer-alt"></i> Tableau de bord
                    </a>
                    <a href="Route?page=activites">
                        <i class="fas fa-map-marked-alt"></i> Activités
                    </a>
                    <a href="Route?page=guides">
                        <i class="fas fa-users"></i> Guides
                    </a>
                    <a href="Route?page=AdminProfil">
                        <i class="fas fa-user-cog"></i> Mon Profil
                    </a>
                </div>
                <div class="sidebar-footer">
                    <a href="Route?page=deconnexion" class="btn btn-outline-primary w-100">
                        <i class="fas fa-sign-out-alt"></i> Déconnexion
                    </a>
                </div>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <!-- Header -->
                <div class="header-section">
                    <div class="header-title">
                        <h1>Tableau de bord</h1>
                        <p>Bienvenue dans votre espace d'administration</p>
                    </div>
                </div>

                <!-- Stats Cards -->
                <div class="stats-container">
                    <div class="stat-card">
                        <i class="fas fa-map-marked-alt"></i>
                        <h3>42</h3>
                        <p>Activités disponibles</p>
                    </div>
                    <div class="stat-card">
                        <i class="fas fa-calendar-check"></i>
                        <h3>128</h3>
                        <p>Réservations ce mois</p>
                    </div>
                    <div class="stat-card">
                        <i class="fas fa-users"></i>
                        <h3>18</h3>
                        <p>Guides actifs</p>
                    </div>
                    <div class="stat-card">
                        <i class="fas fa-star"></i>
                        <h3>94%</h3>
                        <p>Satisfaction clients</p>
                    </div>
                </div>

                <!-- Recent Activity -->
                <div class="activity-card">
                    <h3>Activités récentes</h3>
                    
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-plus"></i>
                        </div>
                        <div class="activity-content">
                            <div class="activity-title">Nouvelle activité ajoutée</div>
                            <div class="activity-time">Il y a 2 heures</div>
                        </div>
                    </div>
                    
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-user-check"></i>
                        </div>
                        <div class="activity-content">
                            <div class="activity-title">Nouveau guide enregistré</div>
                            <div class="activity-time">Aujourd'hui, 09:45</div>
                        </div>
                    </div>
                    
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <div class="activity-content">
                            <div class="activity-title">5 nouvelles réservations</div>
                            <div class="activity-time">Hier, 18:30</div>
                        </div>
                    </div>
                    
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-comment-alt"></i>
                        </div>
                        <div class="activity-content">
                            <div class="activity-title">3 nouveaux avis clients</div>
                            <div class="activity-time">Hier, 14:15</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>