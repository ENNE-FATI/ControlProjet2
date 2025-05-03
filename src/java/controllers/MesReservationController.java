package controllers;

import entities.ReservationActivity;
import entities.Touriste;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.ReservationService;

@WebServlet(name = "MesReservationController", urlPatterns = {"/MesReservationController"})
public class MesReservationController extends HttpServlet {

    private final ReservationService reservationService;

    public MesReservationController() {
        this.reservationService = new ReservationService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Touriste touriste = (Touriste) request.getSession().getAttribute("touriste");

            if (touriste == null) {
                response.sendRedirect(request.getContextPath() + "/Route?page=login");
                return;
            }

            List<ReservationActivity> reservations = reservationService.findByTouriste(touriste);

            request.setAttribute("reservations", reservations);
            request.getRequestDispatcher("/userspages/MesReservation.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Erreur lors du chargement des réservations: " + e.getMessage());
            request.getRequestDispatcher("/userspages/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controller pour l'affichage des réservations";
    }
}
