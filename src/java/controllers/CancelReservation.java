package controllers;

import entities.ActiviteTouristique;
import entities.ReservationActivity;
import entities.Touriste;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.ReservationService;

@WebServlet(name = "CancelReservation", urlPatterns = {"/CancelReservation"})
public class CancelReservation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int activiteId = Integer.parseInt(request.getParameter("activiteId"));
        int touristeId = Integer.parseInt(request.getParameter("touristeId"));
        
        ReservationService rs = new ReservationService();
        Touriste touriste = new Touriste();
        touriste.setId(touristeId);
        
        ActiviteTouristique activite = new ActiviteTouristique();
        activite.setId(activiteId);
        
        ReservationActivity reservation = new ReservationActivity();
        reservation.setActivite(activite);
        reservation.setTouriste(touriste);
        
        if (rs.delete(reservation)) {
            request.getSession().setAttribute("message", "Réservation annulée avec succès");
        } else {
            request.getSession().setAttribute("error", "Erreur lors de l'annulation de la réservation");
        }
        
        response.sendRedirect("Route?page=reservations");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}