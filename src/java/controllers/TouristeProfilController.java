package controllers;

import entities.Touriste;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.TouristeService;

@WebServlet(name = "TouristeProfilController", urlPatterns = {"/TouristeProfilController"})
public class TouristeProfilController extends HttpServlet {
    private TouristeService ts;
    
    @Override
    public void init() throws ServletException {
        super.init();
        ts = new TouristeService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        try {
            Touriste touriste = (Touriste) session.getAttribute("touriste");
            if (touriste == null) {
                response.sendRedirect("Route?page=login");
                return;
            }

            String nom = request.getParameter("nom");
            String email = request.getParameter("email");
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            if (nom == null || nom.trim().isEmpty() || email == null || email.trim().isEmpty()) {
                session.setAttribute("error", "Le nom et l'email sont obligatoires");
                response.sendRedirect("Route?page=profil");
                return;
            }

            touriste.setNom(nom.trim());
            touriste.setEmail(email.trim());

            if (currentPassword != null && !currentPassword.isEmpty() && 
                newPassword != null && !newPassword.isEmpty()) {
                
                if (!newPassword.equals(confirmPassword)) {
                    session.setAttribute("error", "Les nouveaux mots de passe ne correspondent pas");
                    response.sendRedirect("Route?page=profil");
                    return;
                }

                if (!currentPassword.equals(touriste.getMotDePasse())) {
                    session.setAttribute("error", "Mot de passe actuel incorrect");
                    response.sendRedirect("Route?page=profil");
                    return;
                }

                touriste.setMotDePasse(newPassword);
            }

            if (ts.update(touriste)) {
                session.setAttribute("success", "Vos modifications ont bien été enregistrées avec succès");
                // Message disparaîtra après 5 secondes
                session.setAttribute("successDuration", 5000); 
                session.setAttribute("touriste", touriste);
            } else {
                session.setAttribute("error", "Une erreur est survenue lors de la mise à jour de votre profil");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Une erreur technique est survenue. Veuillez réessayer.");
        }
        
        response.sendRedirect("Route?page=profil");
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
}