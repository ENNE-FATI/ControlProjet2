<%@page import="java.time.LocalDate"%>
<%@page import="entities.ActiviteTouristique"%>
<%@page import="entities.Touriste"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Réserver une activité | VoyagePlus</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary-color: #3498db;
                --secondary-color: #2c3e50;
                --accent-color: #e74c3c;
                --light-color: #ecf0f1;
                --success-color: #2ecc71;
            }
            
            body {
                background-color: #f8f9fa;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            
            .reservation-container {
                max-width: 800px;
                margin: 2rem auto;
                background: white;
                border-radius: 15px;
                padding: 2.5rem;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
                border: 1px solid rgba(0, 0, 0, 0.05);
            }
            
            .activity-header {
                display: flex;
                gap: 2rem;
                margin-bottom: 2rem;
                align-items: center;
                padding-bottom: 1.5rem;
                border-bottom: 1px solid #eee;
            }
            
            .activity-image {
                width: 250px;
                height: 200px;
                border-radius: 10px;
                object-fit: cover;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
            
            .activity-title {
                color: var(--secondary-color);
                font-weight: 700;
            }
            
            .activity-price {
                color: var(--primary-color);
                font-size: 1.5rem;
                font-weight: 700;
            }
            
            .form-label {
                font-weight: 600;
                color: var(--secondary-color);
                margin-bottom: 0.5rem;
            }
            
            .form-control {
                padding: 0.75rem 1rem;
                border-radius: 8px;
                border: 1px solid #ddd;
                transition: all 0.3s ease;
            }
            
            .form-control:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
            }
            
            .btn-reserve {
                background-color: var(--primary-color);
                color: white;
                border: none;
                padding: 1rem 2rem;
                border-radius: 8px;
                font-weight: 600;
                font-size: 1.1rem;
                transition: all 0.3s ease;
                width: 100%;
                margin-top: 1rem;
            }
            
            .btn-reserve:hover {
                background-color: #2980b9;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
            
            .user-info {
                background-color: var(--light-color);
                padding: 1rem;
                border-radius: 8px;
                margin-bottom: 1.5rem;
            }
            
            .required-field::after {
                content: " *";
                color: var(--accent-color);
            }
            
            @media (max-width: 768px) {
                .activity-header {
                    flex-direction: column;
                    text-align: center;
                }
                
                .activity-image {
                    width: 100%;
                    height: auto;
                    max-height: 200px;
                }
            }
        </style>
    </head>
    <body>
        <div class="reservation-container">
            <%
                ActiviteTouristique activite = (ActiviteTouristique) request.getAttribute("activite");
                Touriste touriste = (Touriste) request.getSession().getAttribute("touriste");
                String error = (String) request.getAttribute("error");
                
                if (activite == null) {
                    response.sendRedirect("Route?page=activitesTouriste");
                    return;
                }
                
                // Image par défaut
                String[] defaultImages = {
                    "https://images.unsplash.com/photo-1539635278303-d4002c07eae3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                    "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                    "https://images.unsplash.com/photo-1527631746610-bca00a040d60?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                };
                String imageUrl = defaultImages[activite.getId() % defaultImages.length];
            %>
            
            <% if (error != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle me-2"></i>
                    <%= error %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>
            
            <h1 class="mb-4"><i class="fas fa-calendar-check me-2"></i>Réserver une activité</h1>
            
            <div class="activity-header">
                <img src="<%= imageUrl %>" alt="<%= activite.getNom() %>" class="activity-image">
                <div>
                    <h2 class="activity-title"><%= activite.getNom() %></h2>
                    <p class="text-muted"><%= activite.getDescription() %></p>
                    <p class="activity-price">€<%= activite.getPrix() %></p>
                </div>
            </div>

            <form id="reservationForm" action="ReservationController" method="POST">
                <input type="hidden" name="activiteId" value="<%= activite.getId() %>">
                
                <% if (touriste == null) { %>
                    <div class="mb-4">
                        <label for="nomClient" class="form-label required-field">Votre nom</label>
                        <input type="text" class="form-control" id="nomClient" name="nomClient" required
                               value="<%= request.getParameter("nomClient") != null ? request.getParameter("nomClient") : "" %>"
                               placeholder="Entrez votre nom complet">
                    </div>
                    
                    <div class="mb-4">
                        <label for="emailClient" class="form-label required-field">Votre email</label>
                        <input type="email" class="form-control" id="emailClient" name="emailClient" required
                               value="<%= request.getParameter("emailClient") != null ? request.getParameter("emailClient") : "" %>"
                               placeholder="Entrez votre adresse email">
                    </div>
                <% } else { %>
                    <input type="hidden" name="nomClient" value="<%= touriste.getNom() %>">
                    <input type="hidden" name="emailClient" value="<%= touriste.getEmail() %>">
                    <div class="user-info">
                        <h5><i class="fas fa-user-circle me-2"></i>Informations personnelles</h5>
                        <p class="mb-0">Vous êtes connecté en tant que: <strong><%= touriste.getNom() %></strong> (<%= touriste.getEmail() %>)</p>
                    </div>
                <% } %>
                
                <div class="mb-4">
                    <label for="date" class="form-label required-field">Date de réservation</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-calendar-day"></i></span>
                        <input type="date" class="form-control" id="date" name="date" required
                               min="<%= LocalDate.now().plusDays(1).toString() %>"
                               value="<%= request.getParameter("date") != null ? request.getParameter("date") : LocalDate.now().plusDays(1).toString() %>">
                    </div>
                    <small class="text-muted">Sélectionnez une date à partir de demain</small>
                </div>
                
                <button type="submit" class="btn btn-reserve">
                    <i class="fas fa-check-circle me-2"></i>Confirmer la réservation
                </button>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Définir la date minimale (demain)
                const today = new Date();
                const tomorrow = new Date(today);
                tomorrow.setDate(tomorrow.getDate() + 1);
                
                const yyyy = tomorrow.getFullYear();
                const mm = String(tomorrow.getMonth() + 1).padStart(2, '0');
                const dd = String(tomorrow.getDate()).padStart(2, '0');
                const minDate = yyyy + '-' + mm + '-' + dd;
                
                const dateInput = document.getElementById('date');
                dateInput.min = minDate;
                if (!dateInput.value) {
                    dateInput.value = minDate;
                }
                
                // Validation du formulaire
                document.getElementById('reservationForm').addEventListener('submit', function(e) {
                    const selectedDate = new Date(document.getElementById('date').value);
                    if (selectedDate < tomorrow) {
                        e.preventDefault();
                        alert('Veuillez sélectionner une date valide (à partir de demain)');
                    }
                });
            });
        </script>
    </body>
</html>