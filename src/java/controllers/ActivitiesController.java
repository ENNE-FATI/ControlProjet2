package controllers;

import entities.Guide;
import entities.ActiviteTouristique;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.GuideService;
import services.ActivityService;

@WebServlet(name = "ActivitiesController", urlPatterns = {"/ActivitiesController"})
public class ActivitiesController extends HttpServlet {
    private GuideService gs;
    private ActivityService as;
    
    @Override
    public void init() throws ServletException {
        super.init();
        gs = new GuideService();
        as = new ActivityService();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        if (op == null) {
            String id = request.getParameter("id");
            String nom = request.getParameter("nom");
            String lieu = request.getParameter("lieu");
            String prix = request.getParameter("prix");
            String description = request.getParameter("description");
            int idGuide = Integer.parseInt(request.getParameter("guide"));
            Guide guide = gs.findById(idGuide);
            
            if (id == null || id.isEmpty()) {
                ActiviteTouristique a = new ActiviteTouristique(nom, lieu, Double.parseDouble(prix), description, guide);
                as.create(a);
            } else {
                ActiviteTouristique a = new ActiviteTouristique(nom, lieu, Double.parseDouble(prix), description, guide);
                a.setId(Integer.parseInt(id));
                as.update(a);
            }
            response.sendRedirect("Route?page=activites");
            
        } else if (op.equals("delete")) {
            String id = request.getParameter("id");
            as.delete(as.findById(Integer.parseInt(id)));
            response.sendRedirect("Route?page=activites");
            
        } else if (op.equals("update")) {
            String id = request.getParameter("id");
            ActiviteTouristique a = as.findById(Integer.parseInt(id));
            response.sendRedirect("Route?page=ajouteractivite&id=" + a.getId() 
                    + "&nom=" + a.getNom()
                    + "&lieu=" + a.getLieu()
                    + "&prix=" + a.getPrix()
                    + "&description=" + a.getDescription()
                    + "&guide=" + a.getGuide().getId());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Activities Controller";
    }
}