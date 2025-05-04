<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <title>Tableau de bord - Administration</title>

    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Styles -->
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-light: #e0e7ff;
            --secondary-color: #3a0ca3;
            --accent-color: #f72585;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --sidebar-width: 280px;
            --success-color: #4cc9f0;
            --warning-color: #f8961e;
            --danger-color: #ef233c;
        }
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: #f5f7fb;
            color: #333;
        }
        .app-container {
            display: flex;
            min-height: 100vh;
        }
        .sidebar {
            width: var(--sidebar-width);
            background: white;
            box-shadow: 2px 0 15px rgba(0, 0, 0, 0.05);
            position: fixed;
            height: 100vh;
            padding: 1.5rem 0;
            z-index: 1000;
        }
        .sidebar-header {
            padding: 0 1.5rem 1.5rem;
            border-bottom: 1px solid #eee;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
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
            background-color: var(--primary-light);
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
        .main-content {
            margin-left: var(--sidebar-width);
            flex: 1;
            padding: 2rem;
        }
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
            margin-bottom: 0;
        }
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
            position: relative;
            overflow: hidden;
        }
        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: var(--primary-color);
        }
        .stat-card:nth-child(2)::before { background: var(--success-color); }
        .stat-card:nth-child(3)::before { background: var(--accent-color); }
        .stat-card:nth-child(4)::before { background: var(--warning-color); }
        .stat-card i {
            font-size: 1.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        .stat-card:nth-child(2) i { color: var(--success-color); }
        .stat-card:nth-child(3) i { color: var(--accent-color); }
        .stat-card:nth-child(4) i { color: var(--warning-color); }
        .stat-card h3 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
            font-weight: 700;
        }
        .stat-card p {
            color: #6c757d;
            margin-bottom: 0;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }
        .card-header {
            background: white;
            border-bottom: 1px solid #eee;
            padding: 1.25rem 1.5rem;
            border-radius: 10px 10px 0 0 !important;
        }
        .card-header h3 {
            margin-bottom: 0;
            font-weight: 600;
        }
        .card-body {
            padding: 1.5rem;
        }
        #chart-container {
            width: 100%;
            height: 400px;
        }
        .error {
            color: var(--danger-color);
            text-align: center;
            margin-top: 1rem;
        }
        
        /* Styles pour la section Guides Disponibles */
        .guide-card {
            display: flex;
            align-items: center;
            padding: 1rem;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            margin-bottom: 1rem;
            transition: transform 0.2s;
        }
        .guide-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .guide-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: var(--primary-light);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            color: var(--primary-color);
            font-weight: 600;
            font-size: 1.2rem;
        }
        .guide-info {
            flex: 1;
        }
        .guide-name {
            font-weight: 600;
            margin-bottom: 0.25rem;
        }
        .guide-specialty {
            font-size: 0.8rem;
            color: #6c757d;
            margin-bottom: 0.25rem;
        }
        .guide-status {
            display: inline-block;
            padding: 0.25em 0.5em;
            border-radius: 4px;
            font-size: 0.75rem;
            font-weight: 500;
        }
        .status-available {
            background-color: #e6f7ee;
            color: #00a854;
        }
        .status-busy {
            background-color: #fff7e6;
            color: #fa8c16;
        }
        .guide-rating {
            color: #ffc107;
            font-size: 0.9rem;
        }
        
        /* Styles pour les activités programmées */
        .activity-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
        }
        .activity-card {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s;
        }
        .activity-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }
        .activity-header {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }
        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--primary-light);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            color: var(--primary-color);
        }
        .activity-title {
            font-weight: 600;
            margin-bottom: 0.25rem;
        }
        .activity-date {
            font-size: 0.8rem;
            color: #6c757d;
        }
        .activity-desc {
            color: #6c757d;
            margin-bottom: 1rem;
        }
        .activity-status {
            display: inline-block;
            padding: 0.35em 0.65em;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 500;
        }
        .status-confirmed {
            background-color: #e6f7ee;
            color: #00a854;
        }
        .status-pending {
            background-color: #fff7e6;
            color: #fa8c16;
        }
        .status-cancelled {
            background-color: #fff1f0;
            color: #f5222d;
        }
        
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                transition: transform 0.3s;
            }
            .sidebar.active {
                transform: translateX(0);
            }
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>

<div class="app-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h4><i class="fas fa-compass" style="color: var(--primary-color)"></i> ZahraMotion</h4>
        </div>
        <div class="sidebar-menu">
            <a href="Route?page=admin" class="active"><i class="fas fa-tachometer-alt"></i> Tableau de bord</a>
            <a href="Route?page=activites"><i class="fas fa-map-marked-alt"></i> Activités</a>
            <a href="Route?page=guides"><i class="fas fa-users"></i> Guides</a>
            <a href="Route?page=AdminProfil"><i class="fas fa-user-cog"></i> Mon Profil</a>
        </div>
        <div class="sidebar-footer">
            <a href="LogoutController" class="btn btn-outline-primary w-100">
                <i class="fas fa-sign-out-alt"></i> Déconnexion
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header-section">
            <div class="header-title">
                <h1>Tableau de bord</h1>
                <p>Bienvenue dans votre espace d'administration</p>
            </div>
            
        </div>

        <!-- Stats -->
        <div class="stats-container">
            <div class="stat-card">
                <i class="fas fa-map-marked-alt"></i>
                <h3>5</h3>
                <p>Activités disponibles</p>
            </div>
           
            <div class="stat-card">
                <i class="fas fa-users"></i>
                <h3>2</h3>
                <p>Guides actifs</p>
            </div>
           
        </div>

        <!-- Graphique et Guides Disponibles -->
        <div class="row">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-chart-bar me-2"></i>Réservations par lieu d'activité</h3>
                    </div>
                    <div class="card-body">
                        <div id="chart-container">
                            <canvas id="reservationChart"></canvas>
                        </div>
                        <div id="chart-error" class="error"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-users me-2"></i>Guides Disponibles</h3>
                    </div>
                    <div class="card-body">
                        <!-- Guide 1 -->
                        <div class="guide-card">
                            <div class="guide-avatar">ER</div>
                            <div class="guide-info">
                                <div class="guide-name">ERRAFI</div>
                                <div class="guide-specialty">Visite du musee de la Kasbah</div>
                                <div>
                                   
                                    <span class="float-end guide-rating">
                                        <i class="fas fa-star"></i> 4.8
                                    </span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Guide 2 -->
                        <div class="guide-card">
                            <div class="guide-avatar">ML</div>
                            <div class="guide-info">
                                <div class="guide-name">Naciri</div>
                                <div class="guide-specialty">Quad</div>
                                <div>
                                   
                                    <span class="float-end guide-rating">
                                        <i class="fas fa-star"></i> 4.9
                                    </span>
                                </div>
                            </div>
                        </div>
                        
                       
                        
                        
                        
                        <div class="text-center mt-3">
                            <a href="Route?page=guides" class="btn btn-sm btn-outline-primary">
                                Voir tous les guides
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Activités programmées -->
        <div class="card">
            <div class="card-header">
                <h3><i class="fas fa-calendar-alt me-2"></i>Prochaines activités programmées</h3>
            </div>
            <div class="card-body">
                <div class="activity-grid">
                    <!-- Carte Activité 1 -->
                    <div class="activity-card">
                        <div class="activity-header">
                            <div class="activity-icon">
                                <i class="fas fa-hiking"></i>
                            </div>
                            <div>
                                <h5 class="activity-title">Cours de cuisine marocaine</h5>
                               
                            </div>
                        </div>
                        <p class="activity-desc">Apprenez a preparer des plats marocains typiques comme le tajine et le couscous dans une ambiance conviviale..</p>
                        <div>
                            <span class="activity-status status-confirmed">
                                <i class="fas fa-check-circle me-1"></i>Confirmé
                            </span>
                            <span class="float-end text-muted">12 participants</span>
                        </div>
                    </div>
                    
                    <!-- Carte Activité 2 -->
                    <div class="activity-card">
                        <div class="activity-header">
                            <div class="activity-icon">
                                <i class="fas fa-umbrella-beach"></i>
                            </div>
                            <div>
                                <h5 class="activity-title">Surf</h5>
                            </div>
                        </div>
                        <p class="activity-desc">Journée détente avec visite des calanques et baignade.</p>
                        <div>
                            <span class="activity-status status-pending">
                                <i class="fas fa-clock me-1"></i>En attente
                            </span>
                            <span class="float-end text-muted">8 participants</span>
                        </div>
                    </div>
                    
                    <!-- Carte Activité 3 -->
                    <div class="activity-card">
                        <div class="activity-header">
                            <div class="activity-icon">
                                <i class="fas fa-city"></i>
                            </div>
                            <div>
                                <h5 class="activity-title">Visite du musee de la Kasbah</h5>
                               
                            </div>
                        </div>
                        <p class="activity-desc">Découverte du vieux Lyon avec guide spécialisé en histoire.</p>
                        <div>
                            <span class="activity-status status-confirmed">
                                <i class="fas fa-check-circle me-1"></i>Confirmé
                            </span>
                            
                        </div>
                    </div>
                    
                    <!-- Carte Activité 4 -->
                    <div class="activity-card">
                        <div class="activity-header">
                            <div class="activity-icon">
                                <i class="fas fa-wine-glass-alt"></i>
                            </div>
                            <div>
                                <h5 class="activity-title">Visite du musee de la Kasbah</h5>
                               
                            </div>
                        </div>
                        <p class="activity-desc">Tour des vignobles régionaux avec dégustation commentée.</p>
                        <div>
                            <span class="activity-status status-cancelled">
                                <i class="fas fa-times-circle me-1"></i>Annulé
                            </span>
                            <span class="float-end text-muted">5 participants</span>
                        </div>
                    </div>
                </div>
                
                <div class="text-center mt-4">
                    <a href="Route?page=activites" class="btn btn-outline-primary">
                        <i class="fas fa-plus me-2"></i>Voir toutes les activités
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Chart Script -->
<script>
document.addEventListener('DOMContentLoaded', async () => {
    const ctx = document.getElementById('reservationChart');
    const errorDiv = document.getElementById('chart-error');

    try {
        const response = await fetch('http://localhost:8080/ControlProjet2/ActiviteLieuController');

        if (!response.ok) {
            throw new Error(`Erreur ${response.status} : ${response.statusText}`);
        }

        const data = await response.json();

        if (data.length === 0) {
            errorDiv.textContent = "Aucune donnée disponible";
            return;
        }

        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: data.map(item => item.lieuName),
                datasets: [{
                    label: 'Nombre de réservations',
                    data: data.map(item => item.reservationCount),
                    backgroundColor: [
                        'rgba(67, 97, 238, 0.7)',
                        'rgba(76, 201, 240, 0.7)',
                        'rgba(247, 37, 133, 0.7)',
                        'rgba(248, 150, 30, 0.7)',
                        'rgba(114, 9, 183, 0.7)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: { stepSize: 1 }
                    }
                }
            }
        });

    } catch (error) {
        console.error("Erreur lors de la récupération des données:", error);
        errorDiv.textContent = error.message;
    }
});
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>