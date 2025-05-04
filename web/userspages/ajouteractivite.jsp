<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Guide, services.GuideService, java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ajouter Activité - Administration</title>
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

            /* Form Card */
            .form-card {
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                padding: 2rem;
                max-width: 800px;
                margin: 0 auto;
            }

            .form-header {
                margin-bottom: 2rem;
                text-align: center;
            }

            .form-header h2 {
                font-size: 1.5rem;
                font-weight: 700;
                color: var(--dark-color);
                margin-bottom: 0.5rem;
            }

            .form-header p {
                color: #6c757d;
                margin: 0;
            }

            .form-group {
                margin-bottom: 1.5rem;
            }

            .form-label {
                font-weight: 600;
                margin-bottom: 0.5rem;
                display: block;
                color: #555;
            }

            .form-control {
                border-radius: 8px;
                padding: 0.75rem 1rem;
                border: 1px solid #ddd;
                width: 100%;
                transition: all 0.3s;
            }

            .form-control:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
            }

            .form-actions {
                display: flex;
                justify-content: flex-end;
                gap: 1rem;
                margin-top: 2rem;
                padding-top: 1.5rem;
                border-top: 1px solid #eee;
            }

            /* Buttons */
            .btn {
                font-weight: 500;
                border-radius: 8px;
                padding: 0.75rem 1.5rem;
                transition: all 0.2s;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
            }

            .btn-primary {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
            }

            .btn-primary:hover {
                background-color: #3a56e8;
                border-color: #3a56e8;
            }

            .btn-outline-secondary {
                border-color: #ddd;
            }

            .btn-outline-secondary:hover {
                background-color: #f8f9fa;
            }

            /* Responsive */
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
                .form-actions {
                    flex-direction: column;
                }
                .form-actions .btn {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div class="app-container">
            <!-- Sidebar -->
            <div class="sidebar">
                <div class="sidebar-header">
                    <img src="https://via.placeholder.com/40x40/4361ee/ffffff?text=TR" alt="Logo" class="logo">
                    <h4>ZahraMotion</h4>
                </div>
                <div class="sidebar-menu">
                    <a href="Route?page=admin">
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
                <div class="form-card">
                    <div class="form-header">
                        <h2><i class="fas fa-plus-circle mr-2"></i>Ajouter une activité</h2>
                        <p>Remplissez le formulaire pour créer une nouvelle activité touristique</p>
                    </div>
                    
                    <%
                        GuideService guideService = new GuideService();
                        List<Guide> guides = guideService.findAll();
                        
                        // Récupérer les paramètres pour l'édition
                        String id = request.getParameter("id");
                        String nom = request.getParameter("nom");
                        String lieu = request.getParameter("lieu");
                        String prix = request.getParameter("prix");
                        String description = request.getParameter("description");
                        String guideId = request.getParameter("guide");
                    %>
                    
                    <form action="ActivitiesController" method="POST">
                        <% if (id != null && !id.isEmpty()) { %>
                            <input type="hidden" name="id" value="<%= id %>">
                        <% } %>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Nom de l'activité</label>
                                    <input type="text" class="form-control" name="nom" value="<%= nom != null ? nom : "" %>" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Lieu</label>
                                    <input type="text" class="form-control" name="lieu" value="<%= lieu != null ? lieu : "" %>" required>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Prix (€)</label>
                                    <input type="number" step="0.01" class="form-control" name="prix" value="<%= prix != null ? prix : "" %>" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Guide</label>
                                    <select class="form-control" name="guide" required>
                                        <option value="">-- Sélectionnez un guide --</option>
                                        <% for (Guide guide : guides) { %>
                                            <option value="<%= guide.getId() %>" 
                                                <%= (guideId != null && guideId.equals(String.valueOf(guide.getId()))) ? "selected" : "" %>>
                                                <%= guide.getNom() %> (<%= guide.getLangue() %>)
                                            </option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" rows="4" name="description" required><%= description != null ? description : "" %></textarea>
                        </div>
                        
                        <div class="form-actions">
                            <a href="Route?page=activites" class="btn btn-outline-secondary">
                                <i class="fas fa-times"></i> Annuler
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Enregistrer
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>