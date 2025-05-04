<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Touriste"%>
<%@page import="entities.Touriste"%>
<%
    // Récupérer le touriste connecté depuis la session
    Touriste touriste = (Touriste) session.getAttribute("touriste");
    String nomComplet = "";
    String initiales = "";

    if (touriste != null) {
        // Extraire le prénom et nom
        String[] noms = touriste.getNom().split(" ");
        if (noms.length > 0) {
            nomComplet = noms[0]; // Prénom
            initiales = noms[0].substring(0, 1); // Première lettre du prénom
            if (noms.length > 1) {
                nomComplet += " " + noms[1].substring(0, 1) + "."; // Initiale du nom
                initiales += noms[1].substring(0, 1); // Première lettre du nom
            }
        }
    }
%>

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
        <title>Mon Espace Voyageur</title>
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

            /* Main Content */
            .main-content {
                margin-left: 100px;
                padding: 2rem 3rem;
            }

            /* Header */
            .profile-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 3rem;
            }

            .welcome-message h1 {
                font-size: 2.2rem;
                font-weight: 700;
                color: var(--dark-color);
                margin-bottom: 0.5rem;
            }

            .welcome-message p {
                color: #666;
                font-size: 1rem;
            }

            .user-profile {
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .user-avatar {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background-color: var(--primary-color);
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-weight: bold;
                font-size: 1.2rem;
            }

            .user-name {
                font-weight: 600;
            }

            /* Stats Cards */
            .stats-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                gap: 1.5rem;
                margin-bottom: 3rem;
            }

            .stat-card {
                background: var(--card-bg);
                border-radius: 15px;
                padding: 1.5rem;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                transition: transform 0.3s, box-shadow 0.3s;
                border-left: 5px solid var(--primary-color);
                display: flex;
                align-items: center;
                gap: 1.5rem;
            }

            .stat-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            }

            .stat-icon {
                width: 50px;
                height: 50px;
                border-radius: 12px;
                background-color: rgba(0, 168, 150, 0.1);
                display: flex;
                align-items: center;
                justify-content: center;
                color: var(--primary-color);
                font-size: 1.5rem;
            }

            .stat-info h3 {
                font-size: 1.8rem;
                font-weight: 700;
                margin-bottom: 0.2rem;
                color: var(--dark-color);
            }

            .stat-info p {
                color: #666;
                font-size: 0.9rem;
                margin: 0;
            }

            /* Conseils Préparation */
            .section-title {
                font-size: 1.5rem;
                font-weight: 600;
                color: var(--dark-color);
                margin-bottom: 1.5rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .conseils-container {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                gap: 1.5rem;
                margin-bottom: 3rem;
            }

            .conseil-card {
                background: var(--card-bg);
                border-radius: 15px;
                padding: 1.5rem;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                transition: transform 0.3s;
            }

            .conseil-card:hover {
                transform: translateY(-5px);
            }

            .conseil-title {
                font-size: 1.2rem;
                font-weight: 600;
                margin-bottom: 1rem;
                color: var(--dark-color);
                display: flex;
                align-items: center;
                gap: 0.8rem;
            }

            .conseil-title i {
                color: var(--primary-color);
                font-size: 1.5rem;
            }

            .conseil-content {
                color: #666;
                font-size: 0.95rem;
                line-height: 1.6;
            }

            .conseil-list {
                padding-left: 1.2rem;
                margin-top: 0.5rem;
            }

            .conseil-list li {
                margin-bottom: 0.5rem;
            }

            /* Responsive */
            @media (max-width: 992px) {
                .main-content {
                    padding: 2rem;
                }
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

                .profile-header {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 1rem;
                }

                .user-profile {
                    width: 100%;
                    justify-content: flex-end;
                }
            }
        </style>
    </head>
    <body>
        <!-- Navigation Verticale -->
        <nav class="nav-vertical">
            <a href="Route?page=touriste" class="nav-item active">
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
            <!-- Header -->
            <header class="profile-header">
                <div class="welcome-message">
                    <h1>Bonjour, <%= nomComplet%></h1>
                    <p>Prêt pour votre prochaine ZahraMotion ?</p>
                </div>
                <div class="user-profile">
                    <div class="user-avatar"><%= initiales%></div>
                    <div class="user-name"><%= nomComplet%></div>
                </div>
            </header>

            <!-- Conseils Préparation -->
            <section>
                <h2 class="section-title">
                    Conseils pour bien préparer vos activités
                </h2>

                
                    <!-- Conseil 4 -->
                    <div class="conseil-card">
                        <h3 class="conseil-title">
                            <i class="fas fa-money-bill-wave"></i> Gestion du budget
                        </h3>
                        <div class="conseil-content">
                            Quelques conseils pour bien gérer vos finances pendant le voyage :
                            <ul class="conseil-list">
                                <li>Informez votre banque de votre voyage pour éviter le blocage de votre carte</li>
                                <li>Échangez une partie de votre argent en devise locale avant le départ</li>
                                <li>Prévoyez un budget quotidien réaliste incluant repas, transports et activités</li>
                                <li>Gardez une réserve d'argent liquide pour les urgences</li>
                                <li>Comparez les taux de change avant de convertir de grosses sommes</li>
                            </ul>
                        </div>
                    </div>

                    <!-- Conseil 5 -->
                    <div class="conseil-card">
                        <h3 class="conseil-title">
                            <i class="fas fa-camera"></i> Photos et souvenirs
                        </h3>
                        <div class="conseil-content">
                            Pour immortaliser votre voyage dans les meilleures conditions :
                            <ul class="conseil-list">
                                <li>Chargez complètement vos appareils avant chaque journée</li>
                                <li>Emportez des batteries ou power banks supplémentaires</li>
                                <li>Utilisez des cartes mémoire de grande capacité</li>
                                <li>Protégez votre équipement contre les intempéries</li>
                                <li>Prenez des photos à différentes heures pour varier les lumières</li>
                            </ul>
                            N'oubliez pas de profiter du moment présent sans être toujours derrière l'objectif !
                        </div>
                    </div>

                    <!-- Conseil 6 -->
                    <div class="conseil-card">
                        <h3 class="conseil-title">
                            <i class="fas fa-route"></i> Transport sur place
                        </h3>
                        <div class="conseil-content">
                            Optimisez vos déplacements pendant votre séjour :
                            <ul class="conseil-list">
                                <li>Étudiez les options de transport avant votre arrivée</li>
                                <li>Téléchargez les applications de transport locales</li>
                                <li>Notez les adresses importantes dans la langue locale</li>
                                <li>Prévoyez du temps supplémentaire pour les trajets imprévus</li>
                                <li>Envisagez des passes touristiques pour les transports en commun</li>
                            </ul>
                            Pour les locations de voiture, vérifiez bien les conditions d'assurance et les règles de conduite locales.
                        </div>
                    </div>
                </div>
            </section>

            <!-- Checklist Préparation -->
            <section>
                <h2 class="section-title">
                    Checklist avant départ
                </h2>

                <div class="conseil-card">
                    <h3 class="conseil-title">
                        <i class="fas fa-check-circle"></i> À ne pas oublier
                    </h3>
                    <div class="conseil-content">
                        <ul class="conseil-list">
                            <li><input type="checkbox"> Passeport/CNI valide + copies</li>
                            <li><input type="checkbox"> Billets de transport et réservations</li>
                            <li><input type="checkbox"> Carte bancaire internationale</li>
                            <li><input type="checkbox"> Assurance voyage en cours de validité</li>
                            <li><input type="checkbox"> Adaptateurs électriques</li>
                            <li><input type="checkbox"> Médicaments personnels + ordonnances</li>
                            <li><input type="checkbox"> Chargers pour vos appareils électroniques</li>
                            <li><input type="checkbox"> Liste des contacts importants (ambassade, assurance)</li>
                            <li><input type="checkbox"> Confirmation des activités réservées</li>
                            <li><input type="checkbox"> Guide de voyage ou applications utiles</li>
                        </ul>
                        <p style="margin-top: 1rem;">Cochez chaque élément au fur et à mesure de votre préparation pour ne rien oublier !</p>
                    </div>
                </div>
            </section>
        </main>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>