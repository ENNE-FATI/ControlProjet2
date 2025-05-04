package org.apache.jsp.userspages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class StatiqueActivitsParLieux_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"fr\">\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <title>Statistiques par lieu</title>\n");
      out.write("  <script src=\"https://cdn.jsdelivr.net/npm/chart.js\"></script>\n");
      out.write("  <style>\n");
      out.write("    body { font-family: Arial, sans-serif; margin: 20px; }\n");
      out.write("    #chart-container { width: 80%; margin: 0 auto; }\n");
      out.write("    .error { color: red; }\n");
      out.write("  </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<h1>Réservations par lieu d'activité</h1>\n");
      out.write("<div id=\"chart-container\">\n");
      out.write("  <canvas id=\"reservationChart\"></canvas>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("document.addEventListener('DOMContentLoaded', async () => {\n");
      out.write("  const ctx = document.getElementById('reservationChart');\n");
      out.write("  \n");
      out.write("  try {\n");
      out.write("    const response = await fetch('http://localhost:8080/ControlProjet2/ActiviteLieuController');\n");
      out.write("    \n");
      out.write("    if (!response.ok) {\n");
      out.write("      throw new Error(`Erreur ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${response.status}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(':');
      out.write(' ');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${response.statusText}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("`);\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    const data = await response.json();\n");
      out.write("    console.log(\"Données reçues:\", data);\n");
      out.write("    \n");
      out.write("    if (data.length === 0) {\n");
      out.write("      document.getElementById('chart-container').innerHTML = \n");
      out.write("        '<p class=\"error\">Aucune donnée disponible</p>';\n");
      out.write("      return;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    new Chart(ctx, {\n");
      out.write("      type: 'bar',\n");
      out.write("      data: {\n");
      out.write("        labels: data.map(item => item.lieuName),\n");
      out.write("        datasets: [{\n");
      out.write("          label: 'Nombre de réservations',\n");
      out.write("          data: data.map(item => item.reservationCount),\n");
      out.write("          backgroundColor: [\n");
      out.write("            'rgba(255, 99, 132, 0.7)',\n");
      out.write("            'rgba(54, 162, 235, 0.7)',\n");
      out.write("            'rgba(255, 206, 86, 0.7)'\n");
      out.write("          ],\n");
      out.write("          borderWidth: 1\n");
      out.write("        }]\n");
      out.write("      },\n");
      out.write("      options: {\n");
      out.write("        responsive: true,\n");
      out.write("        scales: {\n");
      out.write("          y: {\n");
      out.write("            beginAtZero: true,\n");
      out.write("            ticks: {\n");
      out.write("              stepSize: 1\n");
      out.write("            }\n");
      out.write("          }\n");
      out.write("        }\n");
      out.write("      }\n");
      out.write("    });\n");
      out.write("    \n");
      out.write("  } catch (error) {\n");
      out.write("    console.error(\"Erreur:\", error);\n");
      out.write("    document.getElementById('chart-container').innerHTML = \n");
      out.write("      `<p class=\"error\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${error.message}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>`;\n");
      out.write("  }\n");
      out.write("});\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</body>\n");
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
