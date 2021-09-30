<%-- 
    Document   : admin
    Created on : Sep 25, 2021, 11:27:17 AM
    Author     : khoala
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="group1.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="./css/home.css">
        <title>Admin Page</title>
    </head>
    <body>
        <div class="container">
            <div id="header">
                <ul id="nav">
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
                        } else {
                    %>

                    <div class="left">
                        <li><a>Welcome: <%= loginUser.getUserName()%></a></li>                        
                        <li><a href="createMentor.jsp">Create new mentor</a></li>
                    </div>
                    <div class="right">                       
                        <li><a href="MainController?action=Logout">Logout</a></li>
                    </div>
                    <%
                        }
                    %>
                </ul>
            </div>

        </div>
        <div id="content">
            <div class="header_search">
                <c:set var="searchValue" scope="page" value="${param.search}"/>
                <form action="SearchController" >

                    <div class="header_search-wrap">
                        <input type="text" class="header_search-input" name="search" value="${searchValue}" placeholder="Search...">
                    </div>
                    <button type="submit" class="header_search-btn">
                        <i class="header_search-btn-icon fas fa-search"></i>
                    </button>
                </form>
            </div>
            <div class="column side">
                <h1>Topic</h1>
                <c:if test="${sessionScope.LIST_CATEGORY == null}">
                    <c:redirect url="HomeController"></c:redirect>
                </c:if>

                <c:forEach items="${sessionScope.LIST_CATEGORY}" var="o">
                    <li>
                        <a href="CategoryController?txtCategoryID=${o.categoryID}">${o.categoryName}</a>
                    </li>
                </c:forEach> 
                <form action="MainController" method="POST">
                    <input type="text" name="addcategory" value="" />
                    <input type="submit" name="action" value="Add Category"/>
                </form>
                <p>${requestScope.STATUSADD}</p>
            </div>

        </div>
    </body>
</html>
