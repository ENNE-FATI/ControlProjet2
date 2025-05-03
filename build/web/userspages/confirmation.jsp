<%@page import="entities.ReservationActivity"%>
<%@page import="entities.ActiviteTouristique"%>
<%@page import="entities.Touriste"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmation de réservation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
        }
        
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .confirmation-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-width: 800px;
            margin: 2rem auto;
        }
        
        .confirmation-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 2rem;
            text-align: center;
        }
        
        .confirmation-body {
            padding: 2.5rem;
            background-color: white;
        }
        
        .confirmation-icon {
            font-size: 4rem;
            color: #2ecc71;
            margin-bottom: 1.5rem;
        }
        
        .detail-item {
            border-left: 4px solid var(--secondary-color);
            padding-left: 1rem;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }
        
        .detail-item:hover {
            border-left-color: var(--accent-color);
            transform: translateX(5px);
        }
        
        .btn-return {
            background-color: var(--primary-color);
            color: white;
            padding: 0.75rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
        }
        
        .btn-return:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .activity-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
    <div class="confirmation-card">
        <div class="confirmation-header">
            <div class="confirmation-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h1 class="display-5 fw-bold">Réservation confirmée !</h1>
            <p class="lead">Votre activité a été réservée avec succès</p>
        </div>
        
        <div class="confirmation-body">
            <%
                ReservationActivity reservation = (ReservationActivity) request.getAttribute("reservation");
                ActiviteTouristique activite = reservation.getActivite();
                Touriste touriste = reservation.getTouriste();
                
                // Formater la date
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE d MMMM yyyy", java.util.Locale.FRENCH);
                String formattedDate = reservation.getReservationDate().format(formatter);
                
                // Image par défaut
                String[] defaultImages = {
                    "https://images.unsplash.com/photo-1539635278303-d4002c07eae3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                    "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                    "https://images.unsplash.com/photo-1527631746610-bca00a040d60?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
                };
                String imageUrl = defaultImages[activite.getId() % defaultImages.length];
            %>
            
            <img src="<%= imageUrl %>" alt="<%= activite.getNom() %>" class="activity-image">
            
            <h3 class="mb-4">Merci, <span class="text-primary"><%= touriste.getNom() %></span> !</h3>
            <p class="lead text-muted mb-4">Voici les détails de votre réservation :</p>
            
            <div class="details-section mb-5">
                <div class="detail-item">
                    <h5 class="text-secondary">Activité</h5>
                    <p class="h4"><%= activite.getNom() %></p>
                </div>
                
                <div class="detail-item">
                    <h5 class="text-secondary">Date</h5>
                    <p class="h4"><%= formattedDate %></p>
                </div>
                
                <div class="detail-item">
                    <h5 class="text-secondary">Prix</h5>
                    <p class="h4 text-success">€<%= activite.getPrix() %></p>
                </div>
                
                <div class="detail-item">
                    <h5 class="text-secondary">Numéro de réservation</h5>
                    <p class="h4 text-muted">#<%= reservation.getId().hashCode() %></p>
                </div>
            </div>
            
            <div class="d-grid gap-2">
                <a href="Route?page=activitesTouriste" class="btn btn-return">
                    <i class="fas fa-arrow-left me-2"></i>Retour aux activités
                </a>
            </div>
            
            <div class="mt-4 text-center text-muted">
                <small>Un email de confirmation a été envoyé à <%= touriste.getEmail() %></small>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>