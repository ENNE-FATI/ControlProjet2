package controllers;

import com.google.gson.Gson;
import dao.ActivityTouristeDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mapper.ActiviteLieuCount;

@WebServlet("/ActiviteLieuController")
public class ActiviteLieuController extends HttpServlet {
    
    private final ActivityTouristeDao dao = new ActivityTouristeDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            // 1. Récupération des données depuis la BD
            List<Object[]> results = dao.countReservationsByLieu();
            
            // 2. Conversion en DTO
            List<ActiviteLieuCount> stats = new ArrayList<>();
            for (Object[] row : results) {
                stats.add(new ActiviteLieuCount(
                    (String) row[0],  // lieuName
                    (Long) row[1]      // reservationCount
                ));
            }
            
            // 3. Sérialisation JSON
            String json = new Gson().toJson(stats);
            System.out.println("Données envoyées : " + json);
            response.getWriter().write(json);
            
        } catch (Exception e) {
            System.err.println("ERREUR : " + e.getMessage());
            e.printStackTrace();
            response.sendError(500, "{\"error\":\"" + e.getMessage() + "\"}");
        }
    }
}