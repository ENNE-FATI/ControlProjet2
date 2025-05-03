package controllers;

import entities.Admin;
import entities.Touriste;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.AdminService;
import services.TouristeService;
import services.UserService;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private AdminService adminService;
    private TouristeService touristeService;

    @Override
    public void init() throws ServletException {
        super.init();
        adminService = new AdminService();
        touristeService = new TouristeService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin admin = adminService.findAdminByEmail(email);
        if (admin != null && admin.getMotDePasse().equals(password)) {
            session.setAttribute("admin", admin);
            request.getRequestDispatcher("Route?page=admin").forward(request, response);
            return;
        }

        Touriste touriste = touristeService.findTouristeByEmail(email);
        if (touriste != null && touriste.getMotDePasse().equals(password)) {
            session.setAttribute("touriste", touriste);
            request.getRequestDispatcher("Route?page=touriste").forward(request, response);
            return;
        }

        request.setAttribute("msg", "Email ou mot de passe incorrect");
        request.getRequestDispatcher("Route?page=login").forward(request, response);
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
        return "Contrôleur d'authentification pour admin et touriste";
    }
}
