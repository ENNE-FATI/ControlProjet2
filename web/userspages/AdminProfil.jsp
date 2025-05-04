<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <title>Mon Profil - Administration</title>
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
            }

            .sidebar-header h4 {
                font-weight: 700;
                color: var(--secondary-color);
                display: flex;
                align-items: center;
                gap: 0.75rem;
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

            /* Profile Card */
            .profile-card {
                max-width: 800px;
                margin: 0 auto;
                background: white;
                border-radius: 12px;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.03);
                overflow: hidden;
                border: 1px solid #eee;
            }

            .profile-header {
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                padding: 2rem;
                text-align: center;
                position: relative;
            }

            .profile-avatar {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                border: 4px solid rgba(255, 255, 255, 0.3);
                object-fit: cover;
                margin-bottom: 1rem;
            }

            .profile-body {
                padding: 2rem;
            }

            .section-title {
                font-size: 1.1rem;
                font-weight: 600;
                color: var(--secondary-color);
                margin-bottom: 1.5rem;
                padding-bottom: 0.5rem;
                border-bottom: 1px solid #eee;
            }

            .form-group {
                margin-bottom: 1.5rem;
            }

            .form-label {
                font-weight: 500;
                color: #555;
                margin-bottom: 0.5rem;
                display: block;
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

            .profile-actions {
                display: flex;
                justify-content: flex-end;
                gap: 1rem;
                padding: 1.5rem;
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
                color: white;
            }

            .btn-primary:hover {
                background-color: #3a56e8;
                border-color: #3a56e8;
                color: white;
            }

            .btn-outline-secondary {
                border-color: #ddd;
                color: #555;
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
                .profile-actions {
                    flex-direction: column;
                }
                .profile-actions .btn {
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
                    <h4><i class="fas fa-compass" style="color: var(--primary-color)"></i> ZahraMotion</h4>
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
                    <a href="Route?page=AdminProfil" class="active">
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
                <div class="profile-card">
                    <form action="AdminProfilController" method="POST">
                        <!-- Messages d'erreur/succès -->
                        <c:if test="${not empty success}">
                            <div class="alert alert-success">${success}</div>
                        </c:if>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">${error}</div>
                        </c:if>

                        <!-- En-tête du profil -->
                        <div class="profile-header">
                            <img src="https://ui-avatars.com/api/?name=${admin.nom}&background=random&color=fff" 
                                 alt="Avatar" class="profile-avatar">
                            <h3>${admin.nom}</h3>
                            <p class="text-white-50">Compte administrateur</p>
                        </div>

                        <!-- Corps du profil -->
                        <div class="profile-body">
                            <!-- Section Informations personnelles -->
                            <div class="mb-4">
                                <h5 class="section-title">
                                    <i class="fas fa-user-circle mr-2"></i>Informations personnelles
                                </h5>
                                <div class="form-group">
                                    <label class="form-label">Nom</label>
                                    <input type="text" class="form-control" name="nom" value="${admin.nom}" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Email</label>
                                    <input type="email" class="form-control" name="email" value="${admin.email}" required>
                                </div>
                            </div>

                            <!-- Section Sécurité -->
                            <div class="mb-4">
                                <h5 class="section-title">
                                    <i class="fas fa-lock mr-2"></i>Changer le mot de passe
                                </h5>
                                <div class="form-group">
                                    <label class="form-label">Mot de passe actuel</label>
                                    <input type="password" class="form-control" name="currentPassword" placeholder="Entrez votre mot de passe actuel">
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Nouveau mot de passe</label>
                                            <input type="password" class="form-control" name="newPassword" placeholder="Nouveau mot de passe">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Confirmer le mot de passe</label>
                                            <input type="password" class="form-control" name="confirmPassword" placeholder="Confirmer le mot de passe">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Actions -->
                        <div class="profile-actions">
                            <button type="reset" class="btn btn-outline-secondary">
                                <i class="fas fa-times mr-1"></i> Annuler
                            </button>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save mr-1"></i> Enregistrer les modifications
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