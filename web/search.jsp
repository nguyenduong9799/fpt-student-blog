
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="./css/home.css">
        <script src="https://kit.fontawesome.com/478461b23c.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:set var="searchValue" scope="page" value="${param.search}"/>
        <form action="SearchController">     
            <div class="header__search">
                <div class="header__search-wrap">
                    <input type="text" class="header__search-input" name="search" value="${searchValue}" placeholder="Search...">
                </div>
                <button type="submit" class="header__search-btn">
                    <i class="header__search-btn-icon fas fa-search"></i>
                </button>
            </div>  
        </form>
    </body>
</html>
