<%-- 
    Document   : waitingPost.jsp
    Created on : Sep 22, 2021, 6:51:53 PM
    Author     : ACER
--%>

<%@page import="group1.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="group1.dto.PostDTO"%>
<%@page import="group1.dao.PostDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/mentor.css" rel="stylesheet" type="text/css"/>
        <title>Waiting Post Page</title>
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
                <%
                    PostDAO dao = new PostDAO();
                    List<PostDTO> list = dao.getWaitingPost();
                    if (list != null) {
                        if (!list.isEmpty()) {
                %>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Post Title</th>
                            <th>Post's Author ID</th>
                            <th>Status</th>
                            <th>Create Date</th>
                            <th>Category</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (PostDTO post : list) {
                        %>
                    <form action="MainController">
                        <tr>
                            <td><%=post.getTitle()%></td>
                            <td><%=post.getUserID()%></td>
                            <td><%=post.getStatus()%></td>
                            <td><%=post.getDate()%></td>
                            <td><%=post.getCategory()%></td>   
                            <td><input type="submit" name="action" value="Show details"></td>
                        </tr>
                        <input type="hidden" name="postID" value="<%=post.getPostID()%>">
                    </form>
                    </tbody>
                </table>
                <%                            }
                } else {
                %>
                <h1>No information</h1>
                <%
                        }
                    }
                %>
            </div>

    </body>
</html>
