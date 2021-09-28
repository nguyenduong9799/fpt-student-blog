<%@page import="group1.dto.UserDTO" %>
<<<<<<< Updated upstream
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Home Page</title>
            <link rel="stylesheet" href="./css/home.css">

        </head>

        <body>
                <div class="header">
                    <ul class="nav">
                        <li><a href="home.jsp">FPT Sudent Blog</a></li>
=======
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="./css/home.css">

    </head>
>>>>>>> Stashed changes

    <body>
        <div class="container">

            <div id="header">
                <ul id="nav">
                    <div class="left">
                        <li><a href="home.jsp">FPT Sudent Blog</a></li>
                        <li><a href="notification.jsp">Notification</a></li>
<<<<<<< Updated upstream
                    
=======
                        <li><jsp:include page="search.jsp"/></li>
                    </div>
>>>>>>> Stashed changes

                    <%
                        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                        if (loginUser != null) {
                    %>
                    <div class="right">
                        <li>
                            <a href="profile.jsp">Welcome: <%= loginUser.getUserName()%></a>
                        </li>
                        <li >
                            <a href="MainController?action=Logout">Logout</a>
                        </li>
                    </div>
                    <%
                        }
                        if (loginUser == null) {
                    %>
                    <div class="right">
                        <li>
                            <a href="login.jsp" >Login</a> 
                        </li>
                        <li >
                            <a href="createAccount.jsp" >Sign Up</a>
                        </li> 
                    </div>
                    <%
                        }
                    %>

                </ul>
            </div>
        </div>
        <div id="content">
            <div class="column side">
                <h1>show tat ca category o day</h1>
            </div>
            <div class="column middle">
                <h1>bai viet show o day quang gan vong lap vo day di</h1>
            </div>
        </div>
        <div id="footer">

        </div>
    </body>

</html>