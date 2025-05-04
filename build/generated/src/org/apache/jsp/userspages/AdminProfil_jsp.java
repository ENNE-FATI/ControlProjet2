package org.apache.jsp.userspages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class AdminProfil_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_if_test.release();
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

      out.write('\n');
      out.write('\n');

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Mon Profil - Administration</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css\">\n");
      out.write("        <style>\n");
      out.write("            :root {\n");
      out.write("                --primary-color: #4361ee;\n");
      out.write("                --secondary-color: #3a0ca3;\n");
      out.write("                --accent-color: #f72585;\n");
      out.write("                --light-color: #f8f9fa;\n");
      out.write("                --dark-color: #212529;\n");
      out.write("                --sidebar-width: 280px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            body {\n");
      out.write("                font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;\n");
      out.write("                background-color: #f5f7fb;\n");
      out.write("                color: #333;\n");
      out.write("                line-height: 1.6;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .app-container {\n");
      out.write("                display: flex;\n");
      out.write("                min-height: 100vh;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Sidebar */\n");
      out.write("            .sidebar {\n");
      out.write("                width: var(--sidebar-width);\n");
      out.write("                background: white;\n");
      out.write("                box-shadow: 2px 0 15px rgba(0, 0, 0, 0.05);\n");
      out.write("                position: fixed;\n");
      out.write("                height: 100vh;\n");
      out.write("                z-index: 100;\n");
      out.write("                padding: 1.5rem 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-header {\n");
      out.write("                padding: 0 1.5rem 1.5rem;\n");
      out.write("                border-bottom: 1px solid #eee;\n");
      out.write("                margin-bottom: 1rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-header h4 {\n");
      out.write("                font-weight: 700;\n");
      out.write("                color: var(--secondary-color);\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                gap: 0.75rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-menu {\n");
      out.write("                padding: 0 1rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-menu a {\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                padding: 0.75rem 1rem;\n");
      out.write("                color: #555;\n");
      out.write("                text-decoration: none;\n");
      out.write("                border-radius: 8px;\n");
      out.write("                margin-bottom: 0.5rem;\n");
      out.write("                transition: all 0.2s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-menu a:hover, \n");
      out.write("            .sidebar-menu a.active {\n");
      out.write("                background-color: #f0f4ff;\n");
      out.write("                color: var(--primary-color);\n");
      out.write("                font-weight: 500;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-menu i {\n");
      out.write("                width: 24px;\n");
      out.write("                text-align: center;\n");
      out.write("                margin-right: 0.75rem;\n");
      out.write("                font-size: 1.1rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-footer {\n");
      out.write("                padding: 1.5rem;\n");
      out.write("                position: absolute;\n");
      out.write("                bottom: 0;\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Main Content */\n");
      out.write("            .main-content {\n");
      out.write("                margin-left: var(--sidebar-width);\n");
      out.write("                flex: 1;\n");
      out.write("                padding: 2rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Profile Card */\n");
      out.write("            .profile-card {\n");
      out.write("                max-width: 800px;\n");
      out.write("                margin: 0 auto;\n");
      out.write("                background: white;\n");
      out.write("                border-radius: 12px;\n");
      out.write("                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.03);\n");
      out.write("                overflow: hidden;\n");
      out.write("                border: 1px solid #eee;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .profile-header {\n");
      out.write("                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));\n");
      out.write("                color: white;\n");
      out.write("                padding: 2rem;\n");
      out.write("                text-align: center;\n");
      out.write("                position: relative;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .profile-avatar {\n");
      out.write("                width: 120px;\n");
      out.write("                height: 120px;\n");
      out.write("                border-radius: 50%;\n");
      out.write("                border: 4px solid rgba(255, 255, 255, 0.3);\n");
      out.write("                object-fit: cover;\n");
      out.write("                margin-bottom: 1rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .profile-body {\n");
      out.write("                padding: 2rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .section-title {\n");
      out.write("                font-size: 1.1rem;\n");
      out.write("                font-weight: 600;\n");
      out.write("                color: var(--secondary-color);\n");
      out.write("                margin-bottom: 1.5rem;\n");
      out.write("                padding-bottom: 0.5rem;\n");
      out.write("                border-bottom: 1px solid #eee;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-group {\n");
      out.write("                margin-bottom: 1.5rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-label {\n");
      out.write("                font-weight: 500;\n");
      out.write("                color: #555;\n");
      out.write("                margin-bottom: 0.5rem;\n");
      out.write("                display: block;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-control {\n");
      out.write("                border-radius: 8px;\n");
      out.write("                padding: 0.75rem 1rem;\n");
      out.write("                border: 1px solid #ddd;\n");
      out.write("                width: 100%;\n");
      out.write("                transition: all 0.3s;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-control:focus {\n");
      out.write("                border-color: var(--primary-color);\n");
      out.write("                box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .profile-actions {\n");
      out.write("                display: flex;\n");
      out.write("                justify-content: flex-end;\n");
      out.write("                gap: 1rem;\n");
      out.write("                padding: 1.5rem;\n");
      out.write("                border-top: 1px solid #eee;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Buttons */\n");
      out.write("            .btn {\n");
      out.write("                font-weight: 500;\n");
      out.write("                border-radius: 8px;\n");
      out.write("                padding: 0.75rem 1.5rem;\n");
      out.write("                transition: all 0.2s;\n");
      out.write("                display: inline-flex;\n");
      out.write("                align-items: center;\n");
      out.write("                gap: 0.5rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-primary {\n");
      out.write("                background-color: var(--primary-color);\n");
      out.write("                border-color: var(--primary-color);\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-primary:hover {\n");
      out.write("                background-color: #3a56e8;\n");
      out.write("                border-color: #3a56e8;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-outline-secondary {\n");
      out.write("                border-color: #ddd;\n");
      out.write("                color: #555;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-outline-secondary:hover {\n");
      out.write("                background-color: #f8f9fa;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Responsive */\n");
      out.write("            @media (max-width: 768px) {\n");
      out.write("                .sidebar {\n");
      out.write("                    transform: translateX(-100%);\n");
      out.write("                    transition: transform 0.3s;\n");
      out.write("                    z-index: 1000;\n");
      out.write("                }\n");
      out.write("                .sidebar.active {\n");
      out.write("                    transform: translateX(0);\n");
      out.write("                }\n");
      out.write("                .main-content {\n");
      out.write("                    margin-left: 0;\n");
      out.write("                    width: 100%;\n");
      out.write("                }\n");
      out.write("                .profile-actions {\n");
      out.write("                    flex-direction: column;\n");
      out.write("                }\n");
      out.write("                .profile-actions .btn {\n");
      out.write("                    width: 100%;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"app-container\">\n");
      out.write("            <!-- Sidebar -->\n");
      out.write("            <div class=\"sidebar\">\n");
      out.write("                <div class=\"sidebar-header\">\n");
      out.write("                    <h4><i class=\"fas fa-compass\" style=\"color: var(--primary-color)\"></i> ZahraMotion</h4>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"sidebar-menu\">\n");
      out.write("                    <a href=\"Route?page=admin\">\n");
      out.write("                        <i class=\"fas fa-tachometer-alt\"></i> Tableau de bord\n");
      out.write("                    </a>\n");
      out.write("                    <a href=\"Route?page=activites\">\n");
      out.write("                        <i class=\"fas fa-map-marked-alt\"></i> Activités\n");
      out.write("                    </a>\n");
      out.write("                    <a href=\"Route?page=guides\">\n");
      out.write("                        <i class=\"fas fa-users\"></i> Guides\n");
      out.write("                    </a>\n");
      out.write("                    <a href=\"Route?page=AdminProfil\" class=\"active\">\n");
      out.write("                        <i class=\"fas fa-user-cog\"></i> Mon Profil\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"sidebar-footer\">\n");
      out.write("            <a href=\"LogoutController\" class=\"btn btn-outline-primary w-100\">\n");
      out.write("                <i class=\"fas fa-sign-out-alt\"></i> Déconnexion\n");
      out.write("            </a>\n");
      out.write("        </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- Main Content -->\n");
      out.write("            <div class=\"main-content\">\n");
      out.write("                <div class=\"profile-card\">\n");
      out.write("                    <form action=\"AdminProfilController\" method=\"POST\">\n");
      out.write("                        <!-- Messages d'erreur/succès -->\n");
      out.write("                        ");
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                        ");
      if (_jspx_meth_c_if_1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("                        <!-- En-tête du profil -->\n");
      out.write("                        <div class=\"profile-header\">\n");
      out.write("                            <img src=\"https://ui-avatars.com/api/?name=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${admin.nom}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("&background=random&color=fff\" \n");
      out.write("                                 alt=\"Avatar\" class=\"profile-avatar\">\n");
      out.write("                            <h3>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${admin.nom}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h3>\n");
      out.write("                            <p class=\"text-white-50\">Compte administrateur</p>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <!-- Corps du profil -->\n");
      out.write("                        <div class=\"profile-body\">\n");
      out.write("                            <!-- Section Informations personnelles -->\n");
      out.write("                            <div class=\"mb-4\">\n");
      out.write("                                <h5 class=\"section-title\">\n");
      out.write("                                    <i class=\"fas fa-user-circle mr-2\"></i>Informations personnelles\n");
      out.write("                                </h5>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label class=\"form-label\">Nom</label>\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" name=\"nom\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${admin.nom}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label class=\"form-label\">Email</label>\n");
      out.write("                                    <input type=\"email\" class=\"form-control\" name=\"email\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${admin.email}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <!-- Section Sécurité -->\n");
      out.write("                            <div class=\"mb-4\">\n");
      out.write("                                <h5 class=\"section-title\">\n");
      out.write("                                    <i class=\"fas fa-lock mr-2\"></i>Changer le mot de passe\n");
      out.write("                                </h5>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label class=\"form-label\">Mot de passe actuel</label>\n");
      out.write("                                    <input type=\"password\" class=\"form-control\" name=\"currentPassword\" placeholder=\"Entrez votre mot de passe actuel\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"col-md-6\">\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label class=\"form-label\">Nouveau mot de passe</label>\n");
      out.write("                                            <input type=\"password\" class=\"form-control\" name=\"newPassword\" placeholder=\"Nouveau mot de passe\">\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-md-6\">\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label class=\"form-label\">Confirmer le mot de passe</label>\n");
      out.write("                                            <input type=\"password\" class=\"form-control\" name=\"confirmPassword\" placeholder=\"Confirmer le mot de passe\">\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <!-- Actions -->\n");
      out.write("                        <div class=\"profile-actions\">\n");
      out.write("                            <button type=\"reset\" class=\"btn btn-outline-secondary\">\n");
      out.write("                                <i class=\"fas fa-times mr-1\"></i> Annuler\n");
      out.write("                            </button>\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary\">\n");
      out.write("                                <i class=\"fas fa-save mr-1\"></i> Enregistrer les modifications\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Bootstrap Bundle with Popper -->\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js\"></script>\n");
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

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty success}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                            <div class=\"alert alert-success\">");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${success}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("</div>\n");
        out.write("                        ");
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }

  private boolean _jspx_meth_c_if_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_1.setPageContext(_jspx_page_context);
    _jspx_th_c_if_1.setParent(null);
    _jspx_th_c_if_1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty error}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_1 = _jspx_th_c_if_1.doStartTag();
    if (_jspx_eval_c_if_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                            <div class=\"alert alert-danger\">");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("</div>\n");
        out.write("                        ");
        int evalDoAfterBody = _jspx_th_c_if_1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
    return false;
  }
}
