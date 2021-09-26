package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import group1.dto.PostDTO;
import group1.dao.PostDAO;

public final class waitingPost_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Waiting Post Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "search.jsp", out, false);
      out.write("\r\n");
      out.write("         ");

            PostDAO dao = new PostDAO();
            List<PostDTO> list = dao.getWaitingPost();
            if (list != null) {
                if (!list.isEmpty()) {
        
      out.write("\r\n");
      out.write("        <table border=\"1\">\r\n");
      out.write("            <thead>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th>Post Title</th>\r\n");
      out.write("                    <th>Post's Author ID</th>\r\n");
      out.write("                    <th>Status</th>\r\n");
      out.write("                    <th>Create Date</th>\r\n");
      out.write("                    <th>Category</th>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </thead>\r\n");
      out.write("            <tbody>\r\n");
      out.write("                ");

                    for (PostDTO post : list) {
                
      out.write("\r\n");
      out.write("            <form action=\"MainController\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>");
      out.print(post.getTitle());
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print(post.getUserID());
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print(post.getStatus());
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print(post.getDate());
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print(post.getCategory());
      out.write("</td>   \r\n");
      out.write("                    <td><input type=\"submit\" name=\"action\" value=\"Show details\"></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <input type=\"hidden\" name=\"postID\" value=\"");
      out.print(post.getPostID());
      out.write("\">\r\n");
      out.write("            </form>\r\n");
      out.write("        </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("    ");
                            }
    } else {
    
      out.write("\r\n");
      out.write("    <h1>No information</h1>\r\n");
      out.write("    ");

            }
        }
    
      out.write("\r\n");
      out.write("</body>\r\n");
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
