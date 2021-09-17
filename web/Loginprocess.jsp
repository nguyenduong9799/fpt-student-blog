<%-- 
    Document   : Loginprocess
    Created on : Aug 26, 2021, 2:49:22 PM
    Author     : buili
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LoginProcess Page</title>
    </head>
    <body>
        <%
            String name = request.getParameter("username");
            request.setAttribute("attname",name);
            
            RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
            rd.forward(request, response);
        %>
    </body>
</html>
