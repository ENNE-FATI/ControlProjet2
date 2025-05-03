<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                margin-bottom: 2rem;
            }
            
            .page-title h1 {
                font-size: 2rem;
                font-weight: 700;
                color: var(--dark-color);
                margin-bottom: 0.5rem;
            }
            
            .page-title p {
                color: #666;
                font-size: 1rem;
            }
            
            /* Profile Layout */
            .profile-container {
                display: grid;
                grid-template-columns: 300px 1fr;
                gap: 2rem;
            }
            
            /* Sidebar Profil */
            .profile-sidebar {
                background: var(--card-bg);
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                padding: 2rem;
                height: fit-content;
                position: sticky;
                top: 2rem;
            }
            
            .profile-avatar {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                background-color: var(--primary-color);
                margin: 0 auto 1.5rem;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 3rem;
                font-weight: bold;
                overflow: hidden;
                border: 5px solid var(--accent-color);
            }
            
            .profile-avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            
            .profile-info {
                text-align: center;
                margin-bottom: 2rem;
            }
            
            .profile-name {
                font-size: 1.5rem;
                font-weight: 600;
                margin-bottom: 0.5rem;
            }
            
            .profile-location {
                color: #666;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
                margin-bottom: 1.5rem;
            }
            
            .profile-stats {
                display: flex;
                justify-content: space-around;
                margin-bottom: 2rem;
            }
            
            .stat-item {
                text-align: center;
            }
            
            .stat-value {
                font-size: 1.3rem;
                font-weight: 700;
                color: var(--dark-color);
            }
            
            .stat-label {
                font-size: 0.8rem;
                color: #666;
            }
            
            .profile-menu {
                list-style: none;
                padding: 0;
                margin: 0;
            }
            
            .profile-menu li {
                margin-bottom: 0.5rem;
            }
            
            .profile-menu a {
                display: block;
                padding: 0.8rem 1rem;
                border-radius: 8px;
                color: #555;
                text-decoration: none;
                transition: all 0.2s;
                display: flex;
                align-items: center;
                gap: 0.8rem;
            }
            
            .profile-menu a:hover, .profile-menu a.active {
                background-color: rgba(0, 168, 150, 0.1);
                color: var(--primary-color);
                font-weight: 500;
            }
            
            .profile-menu i {
                width: 20px;
                text-align: center;
            }
            
            /* Profile Content */
            .profile-content {
                background: var(--card-bg);
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                padding: 2rem;
            }
            
            .section-title {
                font-size: 1.3rem;
                font-weight: 600;
                margin-bottom: 1.5rem;
                color: var(--dark-color);
                display: flex;
                align-items: center;
                gap: 0.8rem;
            }
            
            .section-title i {
                color: var(--primary-color);
            }
            
            .form-group {
                margin-bottom: 1.5rem;
            }
            
            .form-label {
                display: block;
                margin-bottom: 0.5rem;
                font-weight: 500;
                color: #555;
            }
            
            .form-control {
                width: 100%;
                padding: 0.8rem 1rem;
                border: 1px solid #ddd;
                border-radius: 8px;
                font-size: 1rem;
                transition: all 0.2s;
            }
            
            .form-control:focus {
                border-color: var(--primary-color);
                outline: none;
                box-shadow: 0 0 0 3px rgba(0, 168, 150, 0.1);
            }
            
            .btn-save {
                background-color: var(--primary-color);
                color: white;
                border: none;
                padding: 0.8rem 1.5rem;
                border-radius: 8px;
                font-weight: 500;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.2s;
            }
            
            .btn-save:hover {
                background-color: var(--dark-color);
            }
            
            /* Responsive */
            @media (max-width: 992px) {
                .profile-container {
                    grid-template-columns: 1fr;
                }
                
                .profile-sidebar {
                    position: static;
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
            }
        </style>
    </head>
    <body>
        <!-- Navigation Verticale -->
          <nav class="nav-vertical">
            <a href="Route?page=touriste" class="nav-item ">
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
        </nav>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Header -->
            <div class="profile-header">
                <div class="page-title">
                    <h1>Mon Profil</h1>
                    <p>Gérez vos informations personnelles et vos préférences</p>
                </div>
            </div>

            <!-- Profile Container -->
            <div class="profile-container">
                <!-- Sidebar -->
                <aside class="profile-sidebar">
                    <div class="profile-avatar">
                        <img src="https://ui-avatars.com/api/?name=Jean+Dupont&background=00A896&color=fff" alt="Avatar">
                    </div>
                    
                    <div class="profile-info">
                        <h2 class="profile-name">Jean Dupont</h2>
                        <div class="profile-location">
                            <i class="fas fa-map-marker-alt"></i>
                            Paris, France
                        </div>
                    </div>
                    
                    <div class="profile-stats">
                        <div class="stat-item">
                            <div class="stat-value">12</div>
                            <div class="stat-label">Activités</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-value">4.8</div>
                            <div class="stat-label">Note</div>
                        </div>
                    </div>
                    
                    <ul class="profile-menu">
                        <li>
                            <a href="#" class="active">
                                <i class="fas fa-user-circle"></i>
                                Informations
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fas fa-lock"></i>
                                Sécurité
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fas fa-heart"></i>
                                Favoris
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fas fa-bell"></i>
                                Notifications
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fas fa-cog"></i>
                                Préférences
                            </a>
                        </li>
                    </ul>
                </aside>

                <!-- Profile Content -->
                <div class="profile-content">
                    <h2 class="section-title">
                        <i class="fas fa-user-circle"></i>
                        Informations personnelles
                    </h2>
                    
                    <form>
                        <div class="form-group">
                            <label for="name" class="form-label">Nom complet</label>
                            <input type="text" id="name" class="form-control" value="Jean Dupont">
                        </div>
                        
                        <div class="form-group">
                            <label for="email" class="form-label">Adresse email</label>
                            <input type="email" id="email" class="form-control" value="jean.dupont@example.com">
                        </div>
                        
                        <div class="form-group">
                            <label for="phone" class="form-label">Téléphone</label>
                            <input type="tel" id="phone" class="form-control" value="+33 6 12 34 56 78">
                        </div>
                        
                        <div class="form-group">
                            <label for="birthdate" class="form-label">Date de naissance</label>
                            <input type="date" id="birthdate" class="form-control" value="1985-05-15">
                        </div>
                        
                        <div class="form-group">
                            <label for="address" class="form-label">Adresse</label>
                            <input type="text" id="address" class="form-control" value="15 Rue de la République">
                        </div>
                        
                        <div class="form-group">
                            <label for="city" class="form-label">Ville</label>
                            <input type="text" id="city" class="form-control" value="Paris">
                        </div>
                        
                        <div class="form-group">
                            <label for="country" class="form-label">Pays</label>
                            <select id="country" class="form-control">
                                <option value="FR" selected>France</option>
                                <option value="BE">Belgique</option>
                                <option value="CH">Suisse</option>
                                <option value="CA">Canada</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="bio" class="form-label">À propos de moi</label>
                            <textarea id="bio" class="form-control" rows="4">Passionné de voyages et d'aventures, j'aime découvrir de nouvelles cultures et paysages à travers le monde.</textarea>
                        </div>
                        
                        <button type="submit" class="btn-save">
                            <i class="fas fa-save"></i> Enregistrer les modifications
                        </button>
                    </form>
                </div>
            </div>
        </main>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>