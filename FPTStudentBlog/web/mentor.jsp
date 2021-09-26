<%-- 
    Document   : mentor
    Created on : Sep 24, 2021, 9:20:09 PM
    Author     : ACER
--%>

<%@page import="group1.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/mentor.css" rel="stylesheet" type="text/css"/>
        <title>Mentor Page</title>
    </head>
    <body>
        <div class="container">
            <div id="header">
                <ul id="nav">
                    <div class="left">
                        <li><a href="home.jsp">FPT Sudent Blog</a></li>
                        <li><a href="notification.jsp">Notification</a></li>
                        <li><a href="waitingPost.jsp">Show waiting posts</a></li>
                        <li><a href="approvedPost.jsp">Show approved posts</a></li>
                        <li><a href="deniedPost.jsp">Show denied posts</a></li>
                    </div>
                    <%
                        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                        if (loginUser != null) {
                    %>
                    <div class="right">
                        <li>
                            <a href="profile.jsp">Welcome: <%= loginUser.getUserName()%></a>
                        </li>
                        <li>
                            <a href="MainController?action=Logout">Logout</a>
                        </li>
                    </div>
                    <%
                        }
                        if (loginUser == null) {
                    %>
                    <div class="right">
                        <li>
                            <a href="createAccount.jsp" >Sign Up</a>
                        </li>    
                        <li>
                            <a href="login.jsp" >Login</a> 
                        </li>
                    </div>
                    <%
                        }
                    %>
                </ul>
            </div>
            <div id="content">       


            </div>
            <div id="footer">

            </div>

    </body>
</html>
