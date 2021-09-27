<%-- 
    Document   : search
    Created on : Sep 24, 2021, 9:29:32 PM
    Author     : buili
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
        <link rel="stylesheet" href="./css/main.css">
        <script src="https://kit.fontawesome.com/478461b23c.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:set var="searchValue" scope="page" value="${param.search}"/>
        <form action="SearchController">
            <div class="header-with-search">
                <div class="header_logo">
                <!--logo search-->
                <a href="HomeController" class="header__logo-link hr">
                    <svg class="header__logo-img" viewBox="0 0 192 65">
                    </svg> 
                </a>
                </div>
            <div class="header__search">
                <div class="header__search-wrap">
                    <input type="text" class="header__search-input" name="search" value="${searchValue}" placeholder="Search...">
                </div>
                <button type="submit" class="header__search-btn">
                    <i class="header__search-btn-icon fas fa-search"></i>
                </button>
            </div>
            </div>
        </form>
    </body>
</html>
