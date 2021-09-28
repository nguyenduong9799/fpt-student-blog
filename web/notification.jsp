
<%@page import="group1.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/home.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header">
            <ul class="nav">
                <li><a href="home.jsp">FPT Sudent Blog</a></li>

                <li><a href="notification.jsp">Notification</a></li>


                <%
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    if (loginUser != null) {
                %>
                <li class="right">
                    <a href="profile.jsp">Welcome: <%= loginUser.getUserName()%></a>
                </li>
                <li class="right">
                    <a href="MainController?action=Logout">Logout</a>
                </li> 
                <%
                    }
                    if (loginUser == null) {
                %>
                <li class="right">
                    <a href="login.jsp" >Login</a> 
                </li>
                <li class="right">
                    <a href="createAccount.jsp" >Sign Up</a>
                </li>              
                <%
                    }
                %>
            </ul>
        </div>
        <div class="content"> 
        </div>
        <div class="footer">

        </div>
    </body>
</html>
