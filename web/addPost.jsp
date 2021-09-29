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
        <link href="css/addPost.css" rel="stylesheet" type="text/css"/>
        <link href="css/mentor.css" rel="stylesheet" type="text/css"/>
        <!-- Include the default theme -->
        <link rel="stylesheet" href="minified/themes/default.min.css" />
        <!-- Include the editors JS -->
        <script src="minified/sceditor.min.js"></script>
        <!-- Include the BBCode or XHTML formats -->
        <script src="minified/jquery.sceditor.xhtml.min.js" type="text/javascript"></script>
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
            <textarea id="title" rows="2" cols="55" type="text" name="title" required="" placeholder="Title of the post ..."></textarea><br>
            <!--Category-->       
            <select class="select" name="category">
                <option selected disabled>Choose Category</option>
                <%
                    ArrayList<CategoryDTO> listCate = CategoryDAO.getAllCategory();
                    if (listCate != null) {
                        if (!listCate.isEmpty()) {
                            for (CategoryDTO category : listCate) {
                %>
                <option class="option"value="<%=category.getCategoryName()%>"><%=category.getCategoryName()%></option>
                <%
                            }
                        }
                    }
                %>
            </select>
            <!--Content-->
            <h2>Content of the post</h2>           
            <textarea rows="20" cols="5" id="editor" name="postContent"></textarea><br>
            <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>">
            <input class="button" type="submit" name="action" value="Submit Post">
        </form>
    </div>
    <script>
        var textarea = document.getElementById('editor');
        sceditor.create(textarea, {
            format: 'xhtml',
            style: 'minified/themes/content/default.min.css'
        });

    </script>
</body>
</html>
