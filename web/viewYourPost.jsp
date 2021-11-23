<%@page import="group1.dao.RankDAO"%>
<%@page import="group1.dao.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <meta name="referrer" content="no-referrer">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>ViewPost Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">

        <script src="https://dl.dropboxusercontent.com/s/nvklmhq3kw4j9pq/jquerylasted.js?dl=0"></script>
    </head>
    <body>
        <div id="colorlib-page">
            <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
            <aside id="colorlib-aside" role="complementary" class="js-fullheight img" style="background-image: url(images/sidebar-bg.jpg);">
                <h1 id="colorlib-logo" class="mb-4"><a href="home.jsp">FPT Blog</a></h1><br>
                <nav id="colorlib-main-menu" role="navigation">
                    <ul>
                        <%
                            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                            if (loginUser != null) {
                        %>
                        <li><a href="MainController?action=Profile">Welcome: <%= loginUser.getUserName()%></a></li>
                        <li><a href="addPost.jsp">Create New Post</a></li>
                        <li><a href="notification.jsp">Notification</a></li>
                        <li ><a href="MainController?action=Logout">Logout</a></li>
                            <%
                                }
                                if (loginUser == null) {
                            %>
                        <li><a href="login.jsp" >Login</a></li>
                        <li><a href="createAccount.jsp" >Sign Up</a></li> 
                            <%
                                }
                            %>
                    </ul>
                </nav>
                <div class="colorlib-footer">  
                    <p class="pfooter">
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved</p>
                    <p class="pfooter">FPT Blog is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://www.facebook.com/nguyenduong971999/" target="_blank">Group 1</a> Class SE1504 of FPT University</p>

                </div>
            </aside> <!-- END COLORLIB-ASIDE -->  
            <div id="colorlib-main">
                <section class="ftco-section ftco-no-pt ftco-no-pb">
                    <div class="row d-flex no-gutters">
                        <div class="col-lg-8 px-md-5 py-5">
                            <div class="row">
                                <%
                                    PostDAO dao = new PostDAO();
                                    PostDTO post = (PostDTO) request.getAttribute("POST_VIEW");
                                    List<TagDTO> listTag = (List<TagDTO>) request.getAttribute("POST_TAGS");
                                    String image = (String) request.getAttribute("AUTHOR_IMAGE");
                                    String authorName = (String) request.getAttribute("AUTHOR_NAME");
                                    int authorRank = (int) request.getAttribute("AUTHOR_RANK");
                                %>
                                <%
                                    if ("Denied".equals(post.getStatus())) {
                                %>
                                <div class="alert" style=" padding: 20px;
                                     background-color: #f44336;
                                     color: white; width: 100%;">
                                    <strong>Denied!</strong> <br/> Mentor comment:
                                    <p> <%=post.getApproveComment()%></p>
                                    <a style="color: white;" href="MainController?action=EditPost&postID=<%=post.getPostID()%>" >>>Go to edit this post</a>
                                </div>
                                <%}%>
                                <h4 style="width: 100%;"><%=post.getTitle()%></h4><br>
                                 <div style="width: 100%;"><i class="icon-person"></i><%=authorName%>  |  <i class="icon-folder-o"></i>  <%=post.getCategory()%> |  <i class="icon-calendar"></i> <%=dao.splitDate(post.getDate())%></div><br>
                                <div style="width: 100%;"><%=post.getPostContent()%></div><br>
                                <div style="margin:0 0 0 0;" class="tag-widget post-tag-container mb-5 mt-5">
                                    <div class="tagcloud">
                                        <%
                                            for (TagDTO tag : listTag) {
                                        %>
                                        <a href="MainController?action=GetPostByTag&tagID=<%=tag.getTagID()%>" class="tag-cloud-link"><%=tag.getTagName()%></a>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div><br>                     
                                <div style="
                                     height: 250px;
                                     width: 100%;"class="about-author d-flex p-4 bg-light">
                                    <div class="bio mr-5">
                                        <img width="200" height="200" src="<%=image%>" alt="Image placeholder" class="img-fluid mb-4">
                                    </div>
                                    <div class="desc">
                                        <h3><i class="icon-person"></i>  <%=authorName%></h3>
                                        <% RankDAO rank = new RankDAO();
                                        %>
                                        <img style="border-radius:0;" width="80px" height="60px" src="<%=rank.getRankImage(authorRank)%>" alt=""/>
                                         <%
                                            PostDTO voted = (PostDTO) request.getAttribute("USER_VOTED");
                                            if (voted != null) {
                                        %>
                                        <h2><a href="MainController?action=Vote&postID=<%=post.getPostID()%>&vote=Voted">
                                                <span class="badge badge-success">Voted(<%=post.getVote()%>)</span>
                                            </a></h2>
                                            <%
                                            } else {
                                            %>
                                        <h2><a href="MainController?action=Vote&postID=<%=post.getPostID()%>&vote=Notyet">
                                                <span class="badge badge-success">Vote Post(<%=post.getVote()%>)</span>
                                            </a></h2>
                                            <%
                                                }
                                            %> 
                
                                    </div>
                                </div>
                                <div class="pt-5 mt-5">
                                    <h3 class="mb-5 font-weight-bold"><%=dao.getTotalComment(post.getPostID())%> Comments</h3>
                                    <ul class="comment-list">
                                        <%
                                            List<CommentDTO> listComment = (List<CommentDTO>) request.getAttribute("LIST_COMMENT");
                                            if (listComment
                                                    != null) {
                                                if (!listComment.isEmpty()) {
                                                    for (CommentDTO list : listComment) {
                                        %>
                                        <li class="comment">
                                            <div class="vcard bio">
                                                <img src="<%=UserDAO.getUserImageByID(list.getUserID())%>" alt="Image placeholder">
                                            </div>
                                            <div class="comment-body">
                                                <h3><%=UserDAO.getUserNameByID(list.getUserID())%></h3>
                                                <div class="meta"><%=dao.splitDate(list.getDate())%></div>
                                                <p><%=list.getCommentContent()%></p>
                                            </div>
                                        </li>
                                        <%
                                                    }
                                                }
                                            }
                                        %>  
                                    </ul>
                                    <!-- END comment-list -->

                                    <!-- START post comment -->
                                    <div class="comment-form-wrap pt-5">
                                        <%
                                            if (loginUser
                                                    != null) {
                                        %>
                                        <h3 class="mb-5">Leave a comment</h3>
                                        <form action="MainController" method="POST" class="p-3 p-md-4 bg-light">
                                            <div class="form-group">
                                                <label for="message">Message</label>
                                                <textarea id="message" rows="10" cols="100" name="commentContent" class="form-control"></textarea><br>
                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>"/>
                                                <input type="hidden" name="postID" value="<%=post.getPostID()%>"/>
                                                <input type="submit" name="action" value="Comment" class="btn py-3 px-4 btn-primary"><br>
                                            </div>

                                        </form>
                                        <%
                                            }
                                        %>
                                    </div> <!-- END post comment -->
                                </div>
                            </div>
                        </div><!-- END--> 
                        <div class="col-lg-4 sidebar ftco-animate bg-light pt-5">
                            <form action="MainController" method="Post">
                                <div class="sidebar-box"  style="text-align: center;">
                                    <div style="position: relative;">
                                        <img id="image" style="border-radius: 999px;"width="250" height="250" src="<%=loginUser.getImage()%>" alt="Image placeholder" class="mb-4">                                   
                                    </div>  
                                </div>
                                <div class="sidebar-box ftco-animate">
                                    <img style="display: block; margin-left: auto; margin-right:auto; " width="80px" height="60px" src="<%=rank.getRankImage(loginUser.getRankID())%>" alt=""/>
                                    <br/>
                                    <label style="margin-top: 5px;">Full Name</label><br/>
                                    <input type="text" name="userName" class="input" value="<%=loginUser.getUserName()%>"/><br/>
                                    <label>Email</label><br/>
                                    <input type="text" name="email" class="input" value="<%=loginUser.getEmail()%>"/><br/>
                                    <label>Phone Number</label><br/>
                                    <input type="text" name="phone" class="input" value="<%=loginUser.getPhone()%>"/><br/>
                                    <label>Avatar image</label><br/>
                                    <input type="file" accept="image/*">
                                    <input id="link" type="text" name="image" class="input" value="<%=loginUser.getImage()%>"/><br/>
                                    <label>Change Password</label><br/>
                                    <input type="password" name="newPassword" class="input" placeholder="New password..."/><br/>
                                    <input type="password" name="confirm" class="input" placeholder="Confirm new password..."/><br/>
                                    <input type="hidden" name="password" class="input" value="<%=loginUser.getPassword()%>"/>
                                    <input type="hidden" name="userID" class="input" value="<%=loginUser.getUserID()%>"/>
                                    <div style="text-align: center;">
                                        <input style="margin-bottom: 20px; margin-top: 20px;" class="btn py-3 px-4 btn-primary" type="submit" name="action" value="Save Changes">
                                    </div>
                                </div>
                            </form>
                        </div><!-- END COL --> 
                    </div>
                </section>
            </div><!-- END COL --> 
        </div>
    </div>
</section>
</div><!-- END COLORLIB-MAIN -->

</div><!-- END COLORLIB-PAGE -->

<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
<script>
                            $('document').ready(function () {
                                $('input[type=file]').on('change', function () {
                                    var $files = $(this).get(0).files;
                                    if ($files.length) {
                                        if ($files[0].size > $(this).data('max-size') * 1024) {
                                            console.log('Vui lòng chọn file có dung lượng nhỏ hơn!');
                                            return false;
                                        }

                                        console.log('Đang upload hình ảnh lên imgur...');
                                        var apiUrl = 'https://api.imgur.com/3/image';
                                        var apiKey = '7911328dd6c64c1';
                                        var settings = {
                                            async: false,
                                            crossDomain: true,
                                            processData: false,
                                            contentType: false,
                                            type: 'POST',
                                            url: apiUrl,
                                            headers: {
                                                Authorization: 'Client-ID ' + apiKey,
                                                Accept: 'application/json',
                                            },
                                            mimeType: 'multipart/form-data',
                                        };
                                        var formData = new FormData();
                                        formData.append('image', $files[0]);
                                        settings.data = formData;
                                        $.ajax(settings).done(function (response) {
                                            var obj = JSON.parse(response);
                                            document.getElementById("link").value = obj.data.link;
                                            document.getElementById("image").src = obj.data.link;
                                        });
                                    }
                                });
                            });
</script>
</body>
</html>