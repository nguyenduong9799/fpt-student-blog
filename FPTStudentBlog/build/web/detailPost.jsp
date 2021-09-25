<%-- 
    Document   : detailPost
    Created on : Sep 22, 2021, 7:12:12 PM
    Author     : ACER
--%>

<%@page import="java.util.List"%>
<%@page import="group1.dto.TagDTO"%>
<%@page import="group1.dto.PostDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Post Page</title>
    </head>
    <body>
        <%
            PostDTO post = (PostDTO) request.getAttribute("POST_DETAIL");
            List<TagDTO> listTag = (List<TagDTO>) request.getAttribute("POST_TAGS");
        %>
        <form action="MainController">
            Post Tile: <%=post.getTitle()%><br>
            Post Author:<%=post.getUserID()%><br>
            Post Category:<%=post.getCategory()%><br>
            Post Status:<%=post.getStatus()%><br>
            Post Tags:
            <%
                for (TagDTO tag : listTag) {
            %>
            <a href=""><%=tag.getTagName()%></a>
            <%
                }
            %>
            <br>
            Create date:<%=post.getDate()%><br>
            Post Content:<%=post.getPostContent()%><br>
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
    </body>
</html>