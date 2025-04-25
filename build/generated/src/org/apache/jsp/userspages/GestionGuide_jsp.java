package org.apache.jsp.userspages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import entities.Guide;
import services.GuideService;

public final class GestionGuide_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Gestion des Guides - Administration</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css\">\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                min-height: 100vh;\n");
      out.write("                display: flex;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar {\n");
      out.write("                width: 250px;\n");
      out.write("                background-color: #212529;\n");
      out.write("                color: white;\n");
      out.write("                min-height: 100vh;\n");
      out.write("                position: fixed;\n");
      out.write("                left: 0;\n");
      out.write("                top: 0;\n");
      out.write("                z-index: 100;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-header {\n");
      out.write("                padding: 1rem;\n");
      out.write("                border-bottom: 1px solid rgba(255, 255, 255, 0.1);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-menu {\n");
      out.write("                padding: 1rem 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-menu a {\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                padding: 0.75rem 1rem;\n");
      out.write("                color: rgba(255, 255, 255, 0.8);\n");
      out.write("                text-decoration: none;\n");
      out.write("                transition: all 0.3s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-menu a:hover, .sidebar-menu a.active {\n");
      out.write("                background-color: rgba(255, 255, 255, 0.1);\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-menu i {\n");
      out.write("                margin-right: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-footer {\n");
      out.write("                padding: 1rem;\n");
      out.write("                border-top: 1px solid rgba(255, 255, 255, 0.1);\n");
      out.write("                position: absolute;\n");
      out.write("                bottom: 0;\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Main content area */\n");
      out.write("            .main-content {\n");
      out.write("                margin-left: 250px;\n");
      out.write("                padding: 20px;\n");
      out.write("                width: calc(100% - 250px);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            fieldset {\n");
      out.write("                border: none;\n");
      out.write("                background-color: white;\n");
      out.write("                border-radius: 10px;\n");
      out.write("                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);\n");
      out.write("                padding: 30px;\n");
      out.write("                width: 100%;\n");
      out.write("                max-width: 900px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            legend {\n");
      out.write("                font-size: 24px;\n");
      out.write("                font-weight: 600;\n");
      out.write("                color: #333;\n");
      out.write("                padding: 0 10px;\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("                position: relative;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            legend::after {\n");
      out.write("                content: '';\n");
      out.write("                display: block;\n");
      out.write("                width: 50px;\n");
      out.write("                height: 3px;\n");
      out.write("                background-color: #4a6fdc;\n");
      out.write("                margin-top: 8px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            table {\n");
      out.write("                width: 100%;\n");
      out.write("                border-collapse: collapse;\n");
      out.write("                margin-top: 15px;\n");
      out.write("                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            th, td {\n");
      out.write("                padding: 15px;\n");
      out.write("                text-align: left;\n");
      out.write("                border-bottom: 1px solid #eee;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            th {\n");
      out.write("                background-color: #f8f9fa;\n");
      out.write("                font-weight: 600;\n");
      out.write("                color: #444;\n");
      out.write("                position: sticky;\n");
      out.write("                top: 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            tbody tr:hover {\n");
      out.write("                background-color: #f9f9f9;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            tbody tr:last-child td {\n");
      out.write("                border-bottom: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a {\n");
      out.write("                text-decoration: none;\n");
      out.write("                padding: 8px 12px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                font-weight: 500;\n");
      out.write("                font-size: 14px;\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("                display: inline-block;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a[href*=\"delete\"] {\n");
      out.write("                background-color: #ff5252;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a[href*=\"delete\"]:hover {\n");
      out.write("                background-color: #e04646;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a[href*=\"update\"] {\n");
      out.write("                background-color: #4a6fdc;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a[href*=\"update\"]:hover {\n");
      out.write("                background-color: #3a5fc8;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .empty-message {\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 20px;\n");
      out.write("                color: #666;\n");
      out.write("                font-style: italic;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .error-message {\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 20px;\n");
      out.write("                color: #ff5252;\n");
      out.write("                font-style: italic;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .actions-container {\n");
      out.write("                display: flex;\n");
      out.write("                gap: 8px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .add-button {\n");
      out.write("                display: inline-block;\n");
      out.write("                background-color: #4CAF50;\n");
      out.write("                color: white;\n");
      out.write("                padding: 10px 15px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                margin-top: 20px;\n");
      out.write("                font-weight: 500;\n");
      out.write("                transition: background-color 0.3s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .add-button:hover {\n");
      out.write("                background-color: #3e9142;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @media (max-width: 768px) {\n");
      out.write("                .sidebar {\n");
      out.write("                    width: 0;\n");
      out.write("                    overflow: hidden;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                .main-content {\n");
      out.write("                    margin-left: 0;\n");
      out.write("                    width: 100%;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                table {\n");
      out.write("                    display: block;\n");
      out.write("                    overflow-x: auto;\n");
      out.write("                    white-space: nowrap;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                fieldset {\n");
      out.write("                    padding: 20px;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                th, td {\n");
      out.write("                    padding: 10px;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                a {\n");
      out.write("                    padding: 6px 10px;\n");
      out.write("                    font-size: 13px;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- Sidebar -->\n");
      out.write("        <div class=\"sidebar\">\n");
      out.write("            <div class=\"sidebar-header\">\n");
      out.write("                <h4>Administration</h4>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"sidebar-menu\">\n");
      out.write("                <a href=\"AdminDashbord.jsp\">\n");
      out.write("                    <i class=\"bi bi-speedometer2\"></i> Tableau de bord\n");
      out.write("                </a>\n");
      out.write("                <a href=\"GestionActivities.jsp\">\n");
      out.write("                    <i class=\"bi bi-list-check\"></i> Activités\n");
      out.write("                </a>\n");
      out.write("                <a href=\"GestionGuide.jsp\" class=\"active\">\n");
      out.write("                    <i class=\"bi bi-people\"></i> Guides\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"sidebar-footer\">\n");
      out.write("                <a href=\"Connexion.jsp\" class=\"btn btn-outline-light w-100\">\n");
      out.write("                    <i class=\"bi bi-box-arrow-left\"></i> Déconnexion\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Main content -->\n");
      out.write("        <div class=\"main-content\">\n");
      out.write("            <fieldset>\n");
      out.write("                <legend>Liste des guides</legend>\n");
      out.write("\n");
      out.write("                <table>\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>ID</th>\n");
      out.write("                            <th>Nom</th>\n");
      out.write("                            <th>Email</th>\n");
      out.write("                            <th>Téléphone</th>\n");
      out.write("                            <th>Langues</th>\n");
      out.write("                            <th>Actions</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("\n");
      out.write("                    <tbody>\n");
      out.write("                        ");

                            try {
                                GuideService gs = new GuideService();
                                java.util.List<Guide> guides = gs.findAll();
                                if (guides != null && !guides.isEmpty()) {
                                    for (Guide g : guides) {
                                        if (g != null) {
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>");
      out.print( g.getId());
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( g.getEmail() != null ? g.getEmail() : "");
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( g.getMotDePasse() != null ? g.getMotDePasse() : "");
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( g.getNom() != null ? g.getNom() : "");
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( g.getLangue() != null ? g.getLangue() : "");
      out.write("</td>\n");
      out.write("                            <td class=\"actions-container\">\n");
      out.write("                                <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/GuidesController?id=");
      out.print( g.getId());
      out.write("&op=delete\">Supprimer</a>\n");
      out.write("                                <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/GuidesController?id=");
      out.print( g.getId());
      out.write("&op=update\">Modifier</a>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                                }
                            }
                        } else {
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"6\" class=\"empty-message\">Aucun guide trouvé</td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                            }
                        } catch (Exception e) {
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"6\" class=\"error-message\">Erreur lors du chargement des guides: ");
      out.print( e.getMessage());
      out.write("</td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
 }
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("\n");
      out.write("                <a href=\"Route?page=ajouterGuide\" class=\"add-button\">Ajouter un guide</a>\n");
      out.write("            </fieldset>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
