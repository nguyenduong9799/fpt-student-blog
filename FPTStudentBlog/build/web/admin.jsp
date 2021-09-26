<%-- 
    Document   : admin
    Created on : Sep 25, 2021, 11:27:17 AM
    Author     : buili
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="group1.dto.UserDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="./css/main.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/478461b23c.js" crossorigin="anonymous"></script>
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
                        <input style="border: 1px solid #007bff" type="text" class="header__search-input" name="search" value="${searchValue}" placeholder="Search...">
                    </div>
                    <button style="background-color: #435d7d" type="submit" class="header__search-btn">
                        <i class="header__search-btn-icon fas fa-search"></i>
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>