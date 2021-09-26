<%-- 
    Document   : detailPost
    Created on : Sep 22, 2021, 7:12:12 PM
    Author     : ACER
--%>

<%@page import="group1.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="group1.dto.TagDTO"%>
<%@page import="group1.dto.PostDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/mentor.css" rel="stylesheet" type="text/css"/>
        <title>Detail Post Page</title>
    </head>
    <body>
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
            <%
                PostDTO post = (PostDTO) request.getAttribute("POST_DETAIL");
                List<TagDTO> listTag = (List<TagDTO>) request.getAttribute("POST_TAGS");
            %>
            <form action="MainController">
                <h1><%=post.getTitle()%></h1><br>
                <h2>Author: <%=post.getUserID()%></h2><br>
                <h3>Category: <%=post.getCategory()%></h3><br>
                <h3>Status: <%=post.getStatus()%></h3><br>
                <h3>Tags:</h3>
                <%
                    for (TagDTO tag : listTag) {
                %>
                <a href=""><%=tag.getTagName()%></a>
                <%
                    }
                %>
                <br>
                <h3>Create date: <%=post.getDate()%></h3><br>
                <p><%=post.getPostContent()%></p><br>
                <input type="hidden" name="postID" value="<%=post.getPostID()%>">
                <%
                    if ("Waiting".equals(post.getStatus())) {
                %>
                <input type="text" name="approveContent" placeholder="Approve comment">
                <input type="submit" name="action" value="Approve">
                <input type="submit" name="action" value="Deny">
                <%
                    }
                %>
            </form>
        </div>

    </body>
</html>
