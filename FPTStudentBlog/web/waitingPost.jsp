<%-- 
    Document   : waitingPost.jsp
    Created on : Sep 22, 2021, 6:51:53 PM
    Author     : ACER
--%>

<%@page import="java.util.List"%>
<%@page import="com.quangnt.dto.PostDTO"%>
<%@page import="com.quangnt.dao.PostDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Waiting Post Page</title>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>Post Title</th>
                    <th>Post's Author ID</th>
                    <th>Status</th>
                    <th>Create Date</th>
                    <th>Category</th>
                </tr>
            </thead>
            <tbody>
                <%
                    PostDAO dao = new PostDAO();
                    List<PostDTO> list = dao.getAllPost();
                    if (list != null) {
                        if (!list.isEmpty()) {
                            for (PostDTO post : list) {

                %>
            <form action="MainController">
                <tr>
                    <td><%=post.getTitle()%></td>
                    <td><%=post.getUserID()%></td>
                    <td><%=post.getStatus()%></td>
                    <td><%=post.getDate()%></td>
                    <td><%=post.getCategory()%></td>   
                    <td><input type="submit" name="action" value="Show details"</td>
                </tr>
                <input type="hidden" name="postID" value="<%=post.getPostID()%>"
            </form>
            <%                            }
                    }
                }
            %>
        </tbody>
    </table>

</body>
</html>
