<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="group1.dto.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="group1.dao.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="group1.dto.PostDTO"%>
<%@page import="group1.dao.PostDAO"%>
<%@page import="group1.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                <div class="column side">
                    <h1>Topic</h1>
                    <c:if test="${sessionScope.LIST_CATEGORY == null}">
                        <c:redirect url="HomeController"></c:redirect>
                    </c:if>
                    <ul>
                        <c:forEach items="${sessionScope.LIST_CATEGORY}" var="o">
                            <li id="category">
                                <a href="CategoryController?txtCategoryID=${o.categoryID}">${o.categoryName}</a>
                            </li>
                        </c:forEach> 

                    </ul>
                </div>
                <%
                    PostDAO dao = new PostDAO();
                    List<PostDTO> list = dao.getApprovedPost();
                    if (list != null) {
                        if (!list.isEmpty()) {
                            for (PostDTO post : list) {
                %>
                <div class="column middle">
                    <a href="MainController?action=ViewPost&postID=<%=post.getPostID()%>"><%=post.getTitle()%></a><br>
                    <p id="author"><%=post.getUserID()%></p>
                    <p id="author"><%=post.getCategory()%></p>
                    <p id="date"><%=post.getDate()%><p>
                </div>
                <%
                            }
                        }
                    }
                %>
            </div>
            <div class="column middle">
                <h1>bai viet show o day quang gan vong lap vo day di</h1>
            </div>
            <div id="footer">

            </div>
    </body>

</html>