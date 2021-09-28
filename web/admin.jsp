<%-- 
    Document   : admin
    Created on : Sep 25, 2021, 11:27:17 AM
    Author     : khoala
--%>

<%@page import="group1.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String errorMessage = (String) session.getAttribute("ERROR_MESSAGE");
            if (errorMessage == null) {
                errorMessage = "";
            }
        %>
        <h1><%= errorMessage%></h1>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("LogoutController");
                return;
            }else{
        %>
            <a>Welcome: <%= loginUser.getUserName()%></a>
            <a href="MainController?action=Logout">Logout</a>                              
        <%
            }
        %>
        
        <div class="container">
            <c:set var="searchValue" scope="page" value="${param.search}"/>
            <form action="SearchController" >

                <div class="header__search">
                    <div class="header__search-wrap">
                        <input type="text" class="header__search-input" name="search" value="${searchValue}" placeholder="Search...">
                    </div>
                    <button type="submit" class="header__search-btn">
                        <i class="header__search-btn-icon fas fa-search"></i>
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>