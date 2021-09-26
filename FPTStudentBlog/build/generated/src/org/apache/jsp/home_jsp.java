package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import group1.dto.UserDTO;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Home Page</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/home.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/themify-icons.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("                <div id=\"header\">\r\n");
      out.write("                    <ul id=\"nav\">\r\n");
      out.write("                        <li><a href=\"home.jsp\">FPT Sudent Blog</a></li>\r\n");
      out.write("\r\n");
      out.write("                        <li><a href=\"notification.jsp\">Notification</a></li>\r\n");
      out.write("                    \r\n");
      out.write("\r\n");
      out.write("                        ");

                        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                        if (loginUser != null) {
                    
      out.write("\r\n");
      out.write("                    <li class=\"right\">\r\n");
      out.write("                        <a href=\"profile.jsp\">Welcome: ");
      out.print( loginUser.getUserName());
      out.write("</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"right\">\r\n");
      out.write("                        <a href=\"MainController?action=Logout\">Logout</a>\r\n");
      out.write("                    </li> \r\n");
      out.write("                    ");

                        }
                        if (loginUser == null) {
                    
      out.write("\r\n");
      out.write("                    <li class=\"right\">\r\n");
      out.write("                        <a href=\"login.jsp\" >Login</a> \r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"right\">\r\n");
      out.write("                        <a href=\"createAccount.jsp\" >Sign Up</a>\r\n");
      out.write("                    </li>              \r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("            </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div id=\"content\">\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            <div id=\"footer\">\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("    </body>\r\n");
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
