<%@page import="group1.dto.UserDTO" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Home Page</title>
            <link rel="stylesheet" href="./css/home.css">

        </head>

        <body>
            <br>
            <br>
            <jsp:include page="search.jsp"/>
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