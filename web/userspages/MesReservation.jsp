<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="entities.ReservationActivity"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mes Réservations</title>
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
        .main-content {
            margin-left: 100px;
            padding: 2rem 3rem;
        }
        .reservation-card {
            background: var(--card-bg);
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }
        .reservation-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }
        .reservation-title {
            font-weight: 600;
            font-size: 1.2rem;
            color: var(--dark-color);
        }
        .reservation-status {
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        .status-confirmed {
            background-color: #d1fae5;
            color: #065f46;
        }
        .status-completed {
            background-color: #e0f2fe;
            color: #0369a1;
        }
        .reservation-details {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 1rem;
        }
        .detail-label {
            font-size: 0.8rem;
            color: #666;
        }
        .detail-value {
            font-weight: 500;
        }
        .reservation-actions {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
        }
        .btn-action {
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-weight: 500;
        }
        .btn-details {
            background-color: var(--primary-color);
            color: white;
        }
        .btn-details:hover {
            background-color: var(--dark-color);
        }
        .empty-state {
            text-align: center;
            background-color: white;
            padding: 3rem;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        /* Modal */
        .modal-description {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.4);
            z-index: 999;
            justify-content: center;
            align-items: center;
            padding: 1rem;
        }
        .modal-content {
            background: white;
            border-radius: 15px;
            max-width: 500px;
            width: 100%;
            padding: 2rem;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            animation: fadeIn 0.3s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .nav-vertical {
                width: 100%;
                height: auto;
                flex-direction: row;
                justify-content: space-around;
                bottom: 0;
                top: auto;
                position: fixed;
            }
            .main-content {
                margin-left: 0;
                margin-bottom: 80px;
                padding: 1.5rem;
            }
            .reservation-details {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<nav class="nav-vertical">
    <a href="Route?page=touriste" class="nav-item"><i class="fas fa-home"></i><span>Accueil</span></a>
    <a href="Route?page=activitesTouriste" class="nav-item"><i class="fas fa-map-marked-alt"></i><span>Activités</span></a>
    <a href="MesReservationController" class="nav-item active"><i class="fas fa-calendar-check"></i><span>Réservations</span></a>
    <a href="Route?page=profil" class="nav-item"><i class="fas fa-user"></i><span>Profil</span></a>
</nav>

<main class="main-content">
    <h1 style="color: var(--dark-color);">Mes Réservations</h1>
    <p style="color: #666;">Gérez vos activités réservées</p>

    <%
        List<ReservationActivity> reservations = (List<ReservationActivity>) request.getAttribute("reservations");
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd MMMM yyyy", request.getLocale());
        LocalDate today = LocalDate.now();

        if (reservations != null && !reservations.isEmpty()) {
            for (ReservationActivity reservation : reservations) {
                LocalDate dateRes = reservation.getReservationDate();
                String statutClasse = "status-confirmed";
                String statutTexte = "À venir";
                if (dateRes.isBefore(today)) {
                    statutClasse = "status-completed";
                    statutTexte = "Terminée";
                }
    %>
    <div class="reservation-card">
        <div class="reservation-header">
            <h3 class="reservation-title"><%= reservation.getActivite().getNom() %></h3>
            <span class="reservation-status <%= statutClasse %>"><%= statutTexte %></span>
        </div>
        <div class="reservation-details">
            <div>
                <div class="detail-label">Date</div>
                <div class="detail-value"><%= reservation.getReservationDate().format(dateFormatter) %></div>
            </div>
            <div>
                <div class="detail-label">Prix</div>
                <div class="detail-value">€<%= reservation.getActivite().getPrix() %></div>
            </div>
            <% if (reservation.getActivite().getGuide() != null) { %>
            <div>
                <div class="detail-label">Guide</div>
                <div class="detail-value"><%= reservation.getActivite().getGuide().getNom() %></div>
            </div>
            <% } %>
            <div>
                <div class="detail-label">Lieu</div>
                <div class="detail-value"><%= reservation.getActivite().getLieu() != null ? reservation.getActivite().getLieu() : "Non spécifié" %></div>
            </div>
        </div>
        <div class="reservation-actions">
            <button class="btn-action btn-details" onclick="showDetails('<%= reservation.getId() %>')">Détails</button>
        </div>
    </div>

    <!-- Modal de description -->
    <div class="modal-description" id="desc-<%= reservation.getId() %>">
        <div class="modal-content">
            <h4><%= reservation.getActivite().getNom() %></h4>
            <p><%= reservation.getActivite().getDescription() != null ? reservation.getActivite().getDescription() : "Aucune description disponible." %></p>
            <button class="btn btn-sm btn-secondary mt-3" onclick="hideDetails('<%= reservation.getId() %>')">Fermer</button>
        </div>
    </div>

    <% } } else { %>
    <div class="empty-state">
        <i class="fas fa-calendar-times fa-3x mb-3 text-muted"></i>
        <h3>Aucune réservation</h3>
        <p>Vous n'avez pas encore réservé d'activités.</p>
        <a href="Route?page=activitesTouriste" class="btn btn-primary">Explorer les activités</a>
    </div>
    <% } %>
</main>

<script>
    function showDetails(id) {
        document.getElementById('desc-' + id).style.display = 'flex';
    }
    function hideDetails(id) {
        document.getElementById('desc-' + id).style.display = 'none';
    }
</script>

</body>
</html>
