<%@page import="group1.dto.TagDTO"%>
<%@page import="java.util.List"%>
<%@page import="group1.dto.PostDTO"%>
<%@page import="group1.dao.PostDAO"%>
<%@page import="group1.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/home.css">
        <title>ViewPost Page</title>
    </head>
    <body>
        <div class="container">
            <div id="header">
                <ul id="nav">
                    <div class="left">
                        <li><a href="home.jsp">FPT Sudent Blog</a></li>
                        <li><a href="notification.jsp">Notification</a></li>
                        <li><jsp:include page="search.jsp"/></li>
                    </div>
                    <%
                        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                        if (loginUser != null) {
                    %>
                    <div class="right">
                        <li><a href="addPost.jsp">Create New Post</a></li>
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
            <%
                PostDTO post = (PostDTO) request.getAttribute("POST_VIEW");
                List<TagDTO> listTag = (List<TagDTO>) request.getAttribute("POST_TAGS");
            %>
            <div class="post">
                <h2><%=post.getTitle()%></h2><br>
            </div>   
            <div class="post-content">
                <h3>Author: <%=post.getUserID()%></h3><br>
                <h3>Category: <%=post.getCategory()%></h3><br>
                <h3>Date: <%=post.getDate()%></h3><br>
                <h3>Tags:</h3>
                <p><%=post.getPostContent()%></p>
                <h3>Voted:<%=post.getVote()%></h3>
            </div>
            <div class="post-comment">
                
            </div>
        </div>
        <div id="footer">

        </div>
    </body>
</html>