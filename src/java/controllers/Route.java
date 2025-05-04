/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Guide;
import entities.ActiviteTouristique;
import entities.ReservationActivity;
import entities.Touriste;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.ActivityService;
import services.GuideService;
import services.ReservationService;
import services.TouristeService;

/**
 *
 * @author pc
 */
@WebServlet(name = "Route", urlPatterns = {"/Route"})
public class Route extends HttpServlet {

    GuideService gs;
    ActivityService as;
    TouristeService ts;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        as = new ActivityService();
        gs = new GuideService();
        ts = new TouristeService();
        String page = request.getParameter("page");

        switch (page) {
            case "login":
                request.getRequestDispatcher("userspages/Connexion.jsp").forward(request, response);
                break;
            case "admin":
                request.getRequestDispatcher("userspages/AdminDashbord.jsp").forward(request, response);
                break;
            case "AdminProfil":
                request.getRequestDispatcher("userspages/AdminProfil.jsp").forward(request, response);
                break;
            case "touriste":
                request.getRequestDispatcher("userspages/TouristeDashbord.jsp").forward(request, response);
                break;

            case "Inscription":
                request.getRequestDispatcher("userspages/Inscription.jsp").forward(request, response);
                break;

            case "reserver":
                String activityId = request.getParameter("id");
                if (activityId != null && !activityId.isEmpty()) {
                    ActiviteTouristique activite = as.findById(Integer.parseInt(activityId));
                    request.setAttribute("activite", activite);

                    // Récupérer le touriste connecté depuis la session
                    Touriste touriste = (Touriste) request.getSession().getAttribute("touriste");
                    request.setAttribute("touriste", touriste);
                }
                request.getRequestDispatcher("userspages/reserver.jsp").forward(request, response);
                break;
// Add this case to your switch statement in the Route servlet
case "profil":
    request.getRequestDispatcher("userspages/TouristeProfil.jsp").forward(request, response);
    break;
            case "guides":
                List<Guide> guides = gs.findAll();
                request.setAttribute("guides", guides);
                request.getRequestDispatcher("userspages/GestionGuide.jsp").forward(request, response);
                break;

            case "activites":
                List<ActiviteTouristique> activites = as.findAll();
                request.setAttribute("activites", activites);
                request.getRequestDispatcher("userspages/GestionActivities.jsp").forward(request, response);
                break;

            case "activitesTouriste":
                List<ActiviteTouristique> activitesTouriste = as.findAll();
                request.setAttribute("activitesTouriste", activitesTouriste);
                request.getRequestDispatcher("userspages/TouristeActivite.jsp").forward(request, response);
                break;
 
            
            case "ajouteractivite":
                request.getRequestDispatcher("userspages/ajouteractivite.jsp").forward(request, response);
                break;
            case "ajouterGuide":
                String guideId = request.getParameter("id");
                if (guideId != null && !guideId.isEmpty()) {
                    Guide guide = gs.findById(Integer.parseInt(guideId));
                    request.setAttribute("guide", guide);
                }
                request.getRequestDispatcher("userspages/ajouterGuide.jsp").forward(request, response);
                break;
           
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
