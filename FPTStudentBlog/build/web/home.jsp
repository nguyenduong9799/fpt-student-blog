
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="./css/home.css">
    </head>
    <body>
        <div class="container">
            <div id="header">
                <ul id="nav">
                    <li><a href="home.jsp">FPT Sudent Blog</a></li>
                    <li><a href="notification.jsp">Notification</a></li>  
<<<<<<< Updated upstream
                </ul>

                <div class="search-btn">
                    
                </div>
                <div id="content">

                </div>
                <div id="footer">

                </div>

            </div>
            <a href="login.jsp"></a>

=======
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
                     <a href="login.jsp">Login</a>
                </li>
               <li class="right">
                     <a href="createAccont.jsp">Sign Up</a>
                </li>
                
                <%
                    }
                %>
                </ul>
            </div>

            <div id="content">

            </div>
            <div id="footer">

            </div>
        </div>
>>>>>>> Stashed changes
    </body>
</html>
