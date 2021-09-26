<%@page import="group1.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="./css/home.css">
        <link rel="stylesheet" href="./css/themify-icons.css">
    </head>
    <body>
        <div id="main">
            <div id="header">

                <ul id="nav">
                    <li><a href="home.jsp">FPT Sudent Blog</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="notification.jsp">Notification</a></li>  
                </ul>

                <div class="search-btn">

                </div>
                <%
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    if (loginUser != null) {
                %>
                <a>Welcome: <%= loginUser.getUserName()%></a>
                <a href="MainController?action=Logout">Logout</a>                              
                <%
                    }
                    if (loginUser == null) {
                %>
                <a href="login.jsp">Login</a>
                <a href="#">Sign Up</a>
                <%
                    }
                %>
            </div>
        </div>
        <div id="content">

        </div>
        <div id="footer">

        </div>
    </body>
</html>