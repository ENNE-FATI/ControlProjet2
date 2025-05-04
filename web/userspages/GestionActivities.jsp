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
        <title>Gestion des Activités - Administration</title>
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
                border-left: 4px solid var(--primary-color);
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
                color: var(--primary-color);
                margin-bottom: 1rem;
            }

            /* Table Card */
            .table-card {
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                overflow: hidden;
            }

            .table-header {
                padding: 1.5rem;
                border-bottom: 1px solid #eee;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .table-header h3 {
                font-size: 1.25rem;
                font-weight: 600;
                margin: 0;
                color: var(--dark-color);
            }

            .search-container {
                position: relative;
                width: 300px;
            }

            .search-input {
                padding-left: 40px;
                border-radius: 8px;
                border: 1px solid #ddd;
                height: 40px;
                width: 100%;
                transition: all 0.3s;
            }

            .search-input:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
            }

            .search-icon {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: #aaa;
            }

            /* Table Styles */
            .table-responsive {
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 1rem 1.5rem;
                text-align: left;
                border-bottom: 1px solid #eee;
            }

            th {
                background-color: #f9fafb;
                font-weight: 600;
                color: #555;
                position: sticky;
                top: 0;
            }

            tr:hover td {
                background-color: #f8f9fa;
            }

            /* Style spécifique pour la colonne Description */
            table td:nth-child(3) {
                width: 30%;
                max-width: 300px;
                white-space: normal;
                word-wrap: break-word;
            }

            .badge {
                padding: 0.5em 0.8em;
                font-size: 0.75rem;
                font-weight: 600;
                border-radius: 50px;
            }

            .badge-primary {
                background-color: rgba(67, 97, 238, 0.1);
                color: var(--primary-color);
            }

            .badge-secondary {
                background-color: rgba(108, 117, 125, 0.1);
                color: #6c757d;
            }

            /* Action Buttons */
            .action-btns {
                display: flex;
                gap: 0.5rem;
            }

            .btn {
                font-weight: 500;
                border-radius: 8px;
                padding: 0.5rem 1rem;
                font-size: 0.875rem;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                transition: all 0.2s;
            }

            .btn-sm {
                padding: 0.375rem 0.75rem;
                font-size: 0.75rem;
            }

            .btn-primary {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
            }

            .btn-primary:hover {
                background-color: #3a56e8;
                border-color: #3a56e8;
            }

            .btn-danger {
                background-color: #e63946;
                border-color: #e63946;
            }

            .btn-danger:hover {
                background-color: #d62839;
                border-color: #d62839;
            }

            .btn-success {
                background-color: var(--success-color);
                border-color: var(--success-color);
            }

            .btn-success:hover {
                background-color: #3ab9e0;
                border-color: #3ab9e0;
            }

            /* Empty State */
            .empty-state {
                padding: 3rem;
                text-align: center;
                color: #6c757d;
            }

            .empty-state i {
                font-size: 2rem;
                color: #dee2e6;
                margin-bottom: 1rem;
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
                .search-container {
                    width: 100%;
                }
                .stats-container {
                    grid-template-columns: 1fr;
                }
                
                /* Adaptation responsive pour la colonne Description */
                table td:nth-child(3) {
                    width: auto;
                    max-width: none;
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
                    <a href="Route?page=admin">
                        <i class="fas fa-tachometer-alt"></i> Tableau de bord
                    </a>
                    <a href="Route?page=activites" class="active">
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
                    <a href="LogoutController" class="btn btn-outline-primary w-100">
                        <i class="fas fa-sign-out-alt"></i> Déconnexion
                    </a>
                </div>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <!-- Header -->
                <div class="header-section">
                    <div class="header-title">
                        <h1>Gestion des Activités</h1>
                        <p>Consultez et gérez toutes les activités touristiques</p>
                    </div>
                    <a href="Route?page=ajouteractivite" class="btn btn-success">
                        <i class="fas fa-plus"></i> Ajouter une activité
                    </a>
                </div>

               
                <!-- Table Card -->
                <div class="table-card">
                    <div class="table-header">
                        <h3>Liste des activités</h3>
                        <div class="search-container">
                            <i class="fas fa-search search-icon"></i>
                            <input type="text" class="search-input" placeholder="Rechercher..." id="searchInput">
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Lieu</th>
                                    <th>Description</th>
                                    <th>Prix</th>
                                    <th>Guide</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        ActivityService as = new ActivityService();
                                        java.util.List<ActiviteTouristique> activities = as.findAll();
                                        if (activities != null && !activities.isEmpty()) {
                                            for (ActiviteTouristique a : activities) {
                                                if (a != null) {
                                %>
                                <tr>
                                    <td><strong><%= a.getNom() != null ? a.getNom() : ""%></strong></td>
                                    <td><%= a.getLieu() != null ? a.getLieu() : ""%></td>
                                    <td><%= a.getDescription() != null ? a.getDescription() : ""%></td>
                                    <td><span class="badge badge-primary"><%= String.format("%.2f €", a.getPrix())%></span></td>
                                    <td>
                                        <% if (a.getGuide() != null) { %>
                                            <%= a.getGuide().getNom() != null ? a.getGuide().getNom() : "Sans nom" %>
                                        <% } else { %>
                                            <span class="badge badge-secondary">Non assigné</span>
                                        <% } %>
                                    </td>
                                    <td>
                                        <div class="action-btns">
                                            <a href="${pageContext.request.contextPath}/ActivitiesController?id=<%= a.getId()%>&op=update" class="btn btn-primary btn-sm">
                                                <i class="fas fa-edit"></i> Modifier
                                            </a>
                                            <a href="${pageContext.request.contextPath}/ActivitiesController?id=<%= a.getId()%>&op=delete" 
                                            class="btn btn-danger btn-sm"
                                            onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette activité?')">
                                                <i class="fas fa-trash"></i> Supprimer
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="6" class="empty-state">
                                        <i class="fas fa-map-marked-alt"></i>
                                        <p>Aucune activité trouvée</p>
                                    </td>
                                </tr>
                                <%
                                    }
                                } catch (Exception e) {
                                %>
                                <tr>
                                    <td colspan="6" class="empty-state" style="color: #e63946;">
                                        <i class="fas fa-exclamation-triangle"></i>
                                        <p>Erreur lors du chargement des activités: <%= e.getMessage()%></p>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Search Functionality -->
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const searchInput = document.getElementById('searchInput');
                const tableRows = document.querySelectorAll('tbody tr');
                
                searchInput.addEventListener('keyup', function() {
                    const searchTerm = searchInput.value.toLowerCase();
                    
                    tableRows.forEach(row => {
                        const rowText = row.textContent.toLowerCase();
                        if (rowText.includes(searchTerm)) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                });
            });
        </script>
    </body>
</html>