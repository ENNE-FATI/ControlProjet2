package controllers;

import entities.Touriste;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.TouristeService;

@WebServlet(name = "TouristeController", urlPatterns = {"/TouristeController"})
public class TouristeController extends HttpServlet {

    private TouristeService ts;

    @Override
    public void init() throws ServletException {
        super.init();
        ts = new TouristeService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        
        if (op == null) {
            String id = request.getParameter("id");
            if (id == null || id.isEmpty()) {
                // Création
                String nom = request.getParameter("nom");
                String email = request.getParameter("email");
                String motDePasse = request.getParameter("motDePasse");
                
                Touriste touriste = new Touriste(nom, email, motDePasse);
                ts.create(touriste);
                response.sendRedirect("Route?page=touriste");
            } else {
                // Mise à jour
                String nom = request.getParameter("nom");
                String email = request.getParameter("email");
                String motDePasse = request.getParameter("motDePasse");
                
                Touriste touriste = new Touriste(nom, email, motDePasse);
                touriste.setId(Integer.parseInt(id));
                ts.update(touriste);
                response.sendRedirect("Route?page=touriste");
            }
        } else if (op.equals("delete")) {
            // Suppression
            int id = Integer.parseInt(request.getParameter("id"));
            Touriste touriste = ts.findById(id);
            ts.delete(touriste);
            response.sendRedirect("Route?page=touriste");
        } else if (op.equals("update")) {
            // Préparation de la mise à jour
            int id = Integer.parseInt(request.getParameter("id"));
            Touriste touriste = ts.findById(id);
            response.sendRedirect("Route?page=profil&id=" + touriste.getId() + 
                    "&nom=" + touriste.getNom() + "&email=" + touriste.getEmail() + 
                    "&motDePasse=" + touriste.getMotDePasse());
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
        return "Touriste Controller";
    }
}