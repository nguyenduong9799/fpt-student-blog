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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>ViewPost Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">

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
    </head>
    <body>
        <div id="colorlib-page">
            <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
            <aside id="colorlib-aside" role="complementary" class="js-fullheight img" style="background-image: url(images/sidebar-bg.jpg);">
                <h1 id="colorlib-logo" class="mb-4"><a href="home.jsp">fpt blog</a></h1><br>
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
                    <div class="mb-4">
                        <h3>Send Feedback For System</h3>
                        <form action="#" class="colorlib-subscribe-form">
                            <div class="form-group d-flex">
                                <div class="icon"><span class="icon-paper-plane"></span></div>
                                <input type="text" class="form-control" placeholder="Enter Feedback Here">
                            </div>
                        </form>
                    </div>
                    <p class="pfooter">
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved</p>
                    <p class="pfooter">FPT Blog is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://www.facebook.com/nguyenduong971999/" target="_blank">Group 1</a> Class SE1504 of FPT University</p>

                </div>
            </aside> <!-- END COLORLIB-ASIDE -->  

            <div id="colorlib-main">
                <section class="ftco-section ftco-no-pt ftco-no-pb">
                    <div class="container px-0">
                        <div class="row d-flex no-gutters">
                            <div class="col-lg-9 px-md-5 py-5">
                                <div class="row">
                                    <%
                                        PostDAO dao = new PostDAO();
                                        PostDTO post = (PostDTO) request.getAttribute("POST_VIEW");
                                        List<TagDTO> listTag = (List<TagDTO>) request.getAttribute("POST_TAGS");
                                        String image = (String) request.getAttribute("AUTHOR_IMAGE");
                                        String authorName = (String) request.getAttribute("AUTHOR_NAME");
                                        int authorRank = (int) request.getAttribute("AUTHOR_RANK");
                                    %>
                                    <h1 class="mb-3"><%=post.getTitle()%></h1>
                                    <p><%=post.getPostContent()%></p>
                                    <div class="tag-widget post-tag-container mb-5 mt-5">
                                        <div class="tagcloud">
                                            <%
                                                for (TagDTO tag : listTag) {
                                            %>
                                            <a href="MainController?action=GetPostByTag&tagID=<%=tag.getTagID()%>" class="tag-cloud-link"><%=tag.getTagName()%></a>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>                     
                                    <div class="about-author d-flex p-4 bg-light">
                                        <div class="bio mr-5">
                                            <img width="200" height="200" src="images/person_1.jpg" alt="Image placeholder" class="img-fluid mb-4">
                                        </div>
                                        <div class="desc">
                                            <h3><i class="icon-person"></i>  <%=authorName%></h3>
                                            <p><i class="icon-folder-o"></i>  <%=post.getCategory()%>   <i class="icon-calendar"></i>  <%=dao.splitDate(post.getDate())%></p>
                                            <%
                                                PostDTO voted = (PostDTO) request.getAttribute("USER_VOTED");
                                                if (voted != null) {
                                            %>
                                            <h3><a href="MainController?action=Vote&postID=<%=post.getPostID()%>&vote=Voted">
                                                    <i class="icon-heart">  Voted(<%=post.getVote()%>)</i>
                                                </a></h3>
                                                <%
                                                } else {
                                                %>
                                            <h3><a href="MainController?action=Vote&postID=<%=post.getPostID()%>&vote=Notyet">
                                                    <i class="icon-heart">  Vote(<%=post.getVote()%>)</i>
                                                </a></h3>
                                                <%
                                                    }
                                                    if (authorRank == 1) {
                                                %>
                                            <img style="margin-left: 5px; box-shadow: 2px 4px green; " width="35px" height="30px" src="images/rank/bronze-rank.png" alt=""/>
                                            <%
                                            } else if (authorRank == 2) {
                                            %>
                                            <img style="margin-left: 5px; box-shadow: 2px 4px green;" width="35px" height="30px" src="images/rank/silver-rank.png" alt=""/>
                                            <%
                                            } else if (authorRank == 3) {
                                            %>
                                            <img style="margin-left: 5px; box-shadow: 2px 4px;" width="35px" height="30px" src="images/rank/gold-rank.png" alt=""/>
                                            <%
                                            } else if (authorRank == 4) {
                                            %>
                                            <img style="margin-left: 5px; box-shadow: 2px 4px;" width="35px" height="30px" src="images/rank/platinum-rank.png" alt=""/>
                                            <%
                                            } else if (authorRank == 5) {
                                            %>
                                            <img style="margin-left: 5px; box-shadow: 2px 4px;" width="35px" height="30px" src="images/rank/diamond-rank.png" alt=""/>
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
                                                if (listComment != null) {
                                                    if (!listComment.isEmpty()) {
                                                        for (CommentDTO list : listComment) {
                                            %>
                                            <li class="comment">
                                                <div class="vcard bio">
                                                    <img src="images/person_1.jpg" alt="Image placeholder">
                                                </div>
                                                <div class="comment-body">
                                                    <h3><%=list.getUserID()%></h3>
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
                                                if (loginUser != null) {
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

                                </div><!-- END--> 
                            </div>
                            <div class="col-lg-3 sidebar ftco-animate bg-light pt-5">
                                <div class="sidebar-box pt-md-4">
                                    <form action="#" class="search-form">
                                        <div class="form-group">
                                            <a href="search.jsp" class="icon icon-search"></a>
                                            <input type="text" class="form-control" placeholder="Search">
                                        </div>
                                    </form>
                                </div>
                                <div class="sidebar-box ftco-animate">
                                    <h3 class="sidebar-heading">Categories</h3>
                                    <c:if test="${sessionScope.LIST_CATEGORY == null}">
                                        <c:redirect url="HomeController"></c:redirect>
                                    </c:if>
                                    <ul class="categories">                                       
                                        <c:forEach items="${sessionScope.LIST_CATEGORY}" var="o">
                                            <li><a href="CategoryController?txtCategoryID=${o.categoryID}">${o.categoryName}</a></li>
                                            </c:forEach> 
                                    </ul>
                                </div>

                                <div class="sidebar-box ftco-animate">
                                    <h3 class="sidebar-heading">Popular Articles</h3>
                                    <div class="block-21 mb-4 d-flex">
                                        <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                                        <div class="text">
                                            <h3 class="heading"><a href="#">Even the all-powerful Pointing has no
                                                    control</a></h3>
                                            <div class="meta">
                                                <div><a href="#"><span class="icon-calendar"></span> Sept. 12, 2019</a>
                                                </div>
                                                <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
                                                <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="block-21 mb-4 d-flex">
                                        <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                                        <div class="text">
                                            <h3 class="heading"><a href="#">Even the all-powerful Pointing has no
                                                    control</a></h3>
                                            <div class="meta">
                                                <div><a href="#"><span class="icon-calendar"></span> Sept. 12, 2019</a>
                                                </div>
                                                <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
                                                <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="block-21 mb-4 d-flex">
                                        <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
                                        <div class="text">
                                            <h3 class="heading"><a href="#">Even the all-powerful Pointing has no
                                                    control</a></h3>
                                            <div class="meta">
                                                <div><a href="#"><span class="icon-calendar"></span> Sept. 12, 2019</a>
                                                </div>
                                                <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
                                                <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="sidebar-box ftco-animate">
                                    <h3 class="sidebar-heading">Popular Tag</h3>
                                    <c:if test="${sessionScope.LIST_TAG == null}">
                                        <c:redirect url="HomeController"></c:redirect>
                                    </c:if>
                                    <ul class="tagcloud">
                                        <c:forEach items="${sessionScope.LIST_TAG}" var="o">
                                            <a href="MainController?action=GetPostByTag&tagID=${o.tagID}">${o.tagName}</a>
                                        </c:forEach> 
                                    </ul>
                                </div>
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
    </body>
</html>