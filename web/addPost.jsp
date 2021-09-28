<%-- 
    Document   : addPost
    Created on : Sep 28, 2021, 5:04:33 PM
    Author     : ACER
--%>

<%@page import="group1.dto.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="group1.dao.CategoryDAO"%>
<%@page import="group1.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/mentor.css" rel="stylesheet" type="text/css"/>
        <script src="<%=request.getContextPath()%>/libraries/ckeditor5-build-classic/ckeditor.js" type="text/javascript"></script>
        <title>Create Post Page</title>
    </head>
    <body>
        <div id="header">
            <ul id="nav">
                <div class="left">
                    <li><a href="home.jsp">FPT Sudent Blog</a></li>
                </div>
                <%
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                        response.sendRedirect("LogoutController");
                        return;
                    } else {
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
                %>
            </ul>
        </div>
    </div>
    <div id="content">       
        <form action="MainController">
            <h2>Title</h2><br>
            <input type="text" name="title" required=""><br>
            <!--Category-->
            <h2>Category</h2>           
            <select name="category">
                <%
                    ArrayList<CategoryDTO> listCate = CategoryDAO.getAllCategory();
                    if (listCate != null) {
                        if (!listCate.isEmpty()) {
                            for (CategoryDTO category : listCate) {
                %>
                <option value="<%=category.getCategoryName()%>"><%=category.getCategoryName()%></option>
                <%
                            }
                        }
                    }
                %>
            </select>
            <!--Content-->
            <h2>Content</h2>           
            <textarea rows="20" cols="20" id="editor" name="postContent"></textarea><br>
            <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>">
            <input type="submit" name="action" value="Submit Post">
        </form>
    </div>
    <script>
        ClassicEditor
                .create(document.querySelector('#editor'))
                .catch(error => {
                    console.error(error);
                });
    </script>
</body>
</html>
