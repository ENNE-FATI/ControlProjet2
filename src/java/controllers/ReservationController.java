package controllers;

import entities.ActiviteTouristique;
import entities.ReservationActivity;
import entities.Touriste;
import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.ActivityService;
import services.ReservationService;
import services.TouristeService;

@WebServlet(name = "ReservationController", urlPatterns = {"/ReservationController"})
public class ReservationController extends HttpServlet {

    private ActivityService activityService;
    private ReservationService reservationService;
    private TouristeService touristeService;

    @Override
    public void init() throws ServletException {
        activityService = new ActivityService();
        reservationService = new ReservationService();
        touristeService = new TouristeService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        try {
            // Récupération des paramètres
            int activiteId = Integer.parseInt(request.getParameter("activiteId"));
            LocalDate date = LocalDate.parse(request.getParameter("date"));

            // Validation de la date
            if (date.isBefore(LocalDate.now())) {
                throw new IllegalArgumentException("La date de réservation doit être dans le futur");
            }

            // Gestion du touriste
            Touriste touriste;
            if (session.getAttribute("touriste") != null) {
                touriste = (Touriste) session.getAttribute("touriste");
            } else {
                String nomClient = request.getParameter("nomClient");
                String emailClient = request.getParameter("emailClient");

                if (nomClient == null || nomClient.isEmpty() || emailClient == null || emailClient.isEmpty()) {
                    throw new IllegalArgumentException("Les informations client sont requises");
                }

                touriste = touristeService.findTouristeByEmail(emailClient);
                if (touriste == null) {
                    touriste = new Touriste(nomClient, emailClient, "");
                    touristeService.create(touriste);
                }
                session.setAttribute("touriste", touriste);
            }

            // Récupération de l'activité
            ActiviteTouristique activite = activityService.findById(activiteId);
            if (activite == null) {
                throw new IllegalArgumentException("L'activité demandée n'existe pas");
            }

            // Création de la réservation
            ReservationActivity reservation = new ReservationActivity(activite, touriste, date);
            reservationService.create(reservation);

            // Préparation des attributs pour la confirmation
            request.setAttribute("reservation", reservation);
            request.setAttribute("activite", activite);
            request.setAttribute("touriste", touriste);

            // Redirection vers la confirmation
            request.getRequestDispatcher("userspages/confirmation.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());

            // Réafficher le formulaire avec les erreurs
            try {
                int activiteId = Integer.parseInt(request.getParameter("activiteId"));
                ActiviteTouristique activite = activityService.findById(activiteId);
                request.setAttribute("activite", activite);
                request.setAttribute("date", request.getParameter("date"));
                
                if (session.getAttribute("touriste") == null) {
                    request.setAttribute("nomClient", request.getParameter("nomClient"));
                    request.setAttribute("emailClient", request.getParameter("emailClient"));
                }
                
            } catch (Exception ex) {
                request.setAttribute("error", "Erreur: " + ex.getMessage());
            }
            
            request.getRequestDispatcher("userspages/reserver.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String activiteIdParam = request.getParameter("activiteId");
            if (activiteIdParam == null || activiteIdParam.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/Route?page=activitesTouriste");
                return;
            }

            int activiteId = Integer.parseInt(activiteIdParam);
            ActiviteTouristique activite = activityService.findById(activiteId);

            if (activite == null) {
                request.setAttribute("error", "L'activité demandée n'existe pas");
                request.getRequestDispatcher("/Route?page=activitesTouriste").forward(request, response);
                return;
            }

            request.setAttribute("activite", activite);
            request.getRequestDispatcher("/Route?page=reserver").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID d'activité invalide");
            request.getRequestDispatcher("/Route?page=activitesTouriste").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Erreur: " + e.getMessage());
            request.getRequestDispatcher("/Route?page=activitesTouriste").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Contrôleur de réservation (version simplifiée)";
    }
}