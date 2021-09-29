<%@page import="group1.dto.CommentDTO"%>
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
        <!-- Include the default theme -->
        <link rel="stylesheet" href="minified/themes/default.min.css" />
        <!-- Include the editors JS -->
        <script src="minified/sceditor.min.js"></script>
        <!-- Include the BBCode or XHTML formats -->
        <script src="minified/jquery.sceditor.xhtml.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="./Font-Awesomecss/css/font-awesome.min.css">
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
                <div class="post-content-left">
                    <h3><%=post.getUserID()%></h3>
                    <h3>Tags:</h3>
                </div>
                <div class="post-content-right">
                    <h3><%=post.getCategory()%></h3>
                    <h3><%=post.getDate()%></h3> 
                    <h3>Voted:<%=post.getVote()%></h3>
                </div>
                <div class="post-content-text">
                   <%=post.getPostContent()%> 
                </div>
                
            </div>
            <div>
                <%
                    if (loginUser != null) {
                %>
                <form action="MainController" method="POST">
                    <textarea rows="10" cols="200" id="editor" name="commentContent"></textarea><br>
                    <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>"/>
                    <input type="hidden" name="postID" value="<%=post.getPostID()%>"/>
                    <input class="button" type="submit" name="action" value="Comment"><br><br>
                </form>
                <%
                    }
                %>
            </div>
            <h5>Comment:</h5><br>
            <%
                List<CommentDTO> listComment = (List<CommentDTO>) request.getAttribute("LIST_COMMENT");
                if (listComment != null) {
                    if (!listComment.isEmpty()) {
                        for (CommentDTO list : listComment) {
            %>
            <div class="post-comment">
                <p id="userID"><%=list.getUserID()%></p>
                <p id="date"><%=list.getDate()%></p>
                <p id="comment"><%=list.getCommentContent()%><p><br>
            </div>
            <%
                        }
                    }
                }
            %>       
        </div>
        <div id="footer">

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