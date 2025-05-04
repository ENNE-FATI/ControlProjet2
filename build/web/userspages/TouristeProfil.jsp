<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Touriste"%>
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
        <title>Mon Profil | Touriste</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary-color: #00A896;
                --secondary-color: #02C39A;
                --light-color: #F7F9FC;
            }
            
            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--light-color);
            }
            
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
                padding: 2rem;
            }
            
            .profile-card {
                background: white;
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                padding: 2rem;
                max-width: 800px;
                margin: 0 auto;
            }
            
            .profile-header {
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                padding: 2rem;
                text-align: center;
                border-radius: 12px 12px 0 0;
            }
            
            .profile-avatar {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                margin: 0 auto 1rem;
            }
            
            .form-group {
                margin-bottom: 1.5rem;
            }
            
            .btn-save {
                background-color: var(--primary-color);
                color: white;
            }
            
            .btn-save:hover {
                background-color: #008672;
                color: white;
            }
            
            .alert {
                transition: opacity 0.5s ease-out;
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
            <a href="Route?page=activitesTouriste" class="nav-item">
                <i class="fas fa-map-marked-alt"></i>
                <span>Activités</span>
            </a>
            <a href="MesReservationController" class="nav-item">
                <i class="fas fa-calendar-check"></i>
                <span>Réservations</span>
            </a>
            <a href="Route?page=profil" class="nav-item active">
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
            <div class="profile-card">
                <form action="TouristeProfilController" method="POST" onsubmit="return validateForm()">
                    <!-- Messages d'alerte -->
                    <% 
                        String success = (String) session.getAttribute("success");
                        String error = (String) session.getAttribute("error");
                        Integer successDuration = (Integer) session.getAttribute("successDuration");
                        
                        if (success != null && !success.isEmpty()) { 
                            session.removeAttribute("success");
                            session.removeAttribute("successDuration");
                    %>
                        <div class="alert alert-success alert-dismissible fade show" 
                             <% if (successDuration != null && successDuration > 0) { %>data-bs-autohide="true" data-bs-delay="<%= successDuration %>"<% } %>>
                            <i class="fas fa-check-circle me-2"></i><%= success %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% 
                        } 
                        if (error != null && !error.isEmpty()) { 
                            session.removeAttribute("error");
                    %>
                        <div class="alert alert-danger alert-dismissible fade show">
                            <i class="fas fa-exclamation-circle me-2"></i><%= error %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <!-- En-tête du profil -->
                    <div class="profile-header">
                        <% 
                            Touriste touriste = (Touriste) session.getAttribute("touriste");
                            String nomComplet = (touriste != null) ? touriste.getNom() : "Utilisateur";
                            String email = (touriste != null) ? touriste.getEmail() : "";
                        %>
                        <img src="https://ui-avatars.com/api/?name=<%= nomComplet %>&background=00A896&color=fff" 
                             alt="Avatar" class="profile-avatar">
                        <h3><%= nomComplet %></h3>
                        <p>Compte touriste</p>
                    </div>

                    <!-- Corps du formulaire -->
                    <div class="p-4">
                        <h4 class="mb-4"><i class="fas fa-user-circle me-2"></i>Informations personnelles</h4>
                        
                        <div class="form-group">
                            <label class="form-label">Nom complet</label>
                            <input type="text" class="form-control" name="nom" 
                                   value="<%= nomComplet %>" required>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" 
                                   value="<%= email %>" required>
                        </div>

                        <h4 class="mt-5 mb-4"><i class="fas fa-lock me-2"></i>Changer le mot de passe</h4>
                        
                        <div class="form-group">
                            <label class="form-label">Mot de passe actuel</label>
                            <input type="password" class="form-control" name="currentPassword" id="currentPassword">
                            <small class="text-muted">Laissez vide si vous ne souhaitez pas changer</small>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Nouveau mot de passe</label>
                                    <input type="password" class="form-control" name="newPassword" id="newPassword">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Confirmer</label>
                                    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword">
                                </div>
                            </div>
                        </div>

                        <div class="text-end mt-4">
                            <button type="submit" class="btn btn-save px-4">
                                <i class="fas fa-save me-1"></i> Enregistrer les modifications
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            function validateForm() {
                const currentPassword = document.getElementById('currentPassword').value;
                const newPassword = document.getElementById('newPassword').value;
                const confirmPassword = document.getElementById('confirmPassword').value;
                
                if (currentPassword || newPassword || confirmPassword) {
                    if (!currentPassword || !newPassword || !confirmPassword) {
                        alert('Pour changer le mot de passe, veuillez remplir tous les champs');
                        return false;
                    }
                    
                    if (newPassword !== confirmPassword) {
                        alert('Les nouveaux mots de passe ne correspondent pas');
                        return false;
                    }
                    
                    if (newPassword.length < 6) {
                        alert('Le mot de passe doit contenir au moins 6 caractères');
                        return false;
                    }
                }
                
                return true;
            }
            
            // Auto-dismiss success alerts after delay
            document.addEventListener('DOMContentLoaded', function() {
                const alerts = document.querySelectorAll('.alert[data-bs-autohide="true"]');
                alerts.forEach(function(alert) {
                    const delay = parseInt(alert.getAttribute('data-bs-delay')) || 5000;
                    setTimeout(function() {
                        const bsAlert = new bootstrap.Alert(alert);
                        bsAlert.close();
                    }, delay);
                });
                
                // Scroll vers le haut pour voir les messages
                if (document.querySelector('.alert')) {
                    window.scrollTo(0, 0);
                }
                
                // Effacer les champs de mot de passe après soumission réussie
                if (document.querySelector('.alert-success')) {
                    document.getElementById('currentPassword').value = '';
                    document.getElementById('newPassword').value = '';
                    document.getElementById('confirmPassword').value = '';
                }
            });
        </script>
    </body>
</html>