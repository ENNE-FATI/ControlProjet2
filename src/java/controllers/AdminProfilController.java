package controllers;

import entities.Admin;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.AdminService;

@WebServlet(name = "AdminProfilController", urlPatterns = {"/AdminProfilController"})
public class AdminProfilController extends HttpServlet {
    private AdminService as;
    
    @Override
    public void init() throws ServletException {
        super.init();
        as = new AdminService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        try {
            // Récupérer l'admin connecté depuis la session
            Admin admin = (Admin) session.getAttribute("admin");
            if (admin == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Mise à jour des informations
            String nom = request.getParameter("nom");
            String email = request.getParameter("email");
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            // Validation des champs obligatoires
            if (nom == null || nom.trim().isEmpty() || email == null || email.trim().isEmpty()) {
                session.setAttribute("error", "Le nom et l'email sont obligatoires");
                response.sendRedirect("Route?page=AdminProfil");
                return;
            }

            admin.setNom(nom.trim());
            admin.setEmail(email.trim());

            // Gestion du mot de passe (sans BCrypt)
            if (currentPassword != null && !currentPassword.isEmpty() && 
                newPassword != null && !newPassword.isEmpty()) {
                
                if (!newPassword.equals(confirmPassword)) {
                    session.setAttribute("error", "Les nouveaux mots de passe ne correspondent pas");
                    response.sendRedirect("Route?page=AdminProfil");
                    return;
                }

                if (!currentPassword.equals(admin.getMotDePasse())) {
                    session.setAttribute("error", "Mot de passe actuel incorrect");
                    response.sendRedirect("Route?page=AdminProfil");
                    return;
                }

                admin.setMotDePasse(newPassword);
            }

            // Sauvegarder les modifications
            if (as.update(admin)) {
                session.setAttribute("success", "Profil mis à jour avec succès");
                session.setAttribute("admin", admin);
            } else {
                session.setAttribute("error", "Erreur lors de la mise à jour");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Une erreur technique est survenue");
        }
        
        response.sendRedirect("Route?page=AdminProfil");
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