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
        <meta charset="utf-8">
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
        <!-- Include the default theme -->
        <link rel="stylesheet" href="minified/themes/default.min.css" />
        <!-- Include the editors JS -->
        <script src="minified/sceditor.min.js"></script>
        <!-- Include the BBCode or XHTML formats -->
        <script src="minified/jquery.sceditor.xhtml.min.js" type="text/javascript"></script>
        <title>Create Post Page</title>
    </head>
    <body>
        <div id="colorlib-page">
            <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
            <aside id="colorlib-aside" role="complementary" class="js-fullheight img" style="background-image: url(images/sidebar-bg.jpg);">
                <h1 id="colorlib-logo" class="mb-4"><a href="home.jsp">fptblog</a></h1>
                <nav id="colorlib-main-menu" role="navigation">
                    <ul>
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="notification.jsp">Notification</a></li><br>
                            <%
                                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                if (loginUser != null) {
                            %>
                        <li><a href="profile.jsp">Welcome: <%= loginUser.getUserName()%></a></li>
                        <li class="colorlib-active"><a href="addPost.jsp">Create New Post</a></li>
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

                </div>
            </aside> <!-- END PAGE-ASIDE -->  

            <div id="colorlib-main"> <!-- START MAIN-PAGE -->
                <section class="ftco-section ftco-no-pt ftco-no-pb bg-light">
                    <div class="container px-0">
                        <div class="row no-gutters">
                            <form action="MainController" method="POST" accept-charset="UTF-8">
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
                                <input style="width: 90%;" type="text" name="tagList">
                                <!--Content-->
                                <h2>Content of the post</h2>           
                                <textarea rows="20" cols="5" id="editor" name="postContent"></textarea><br>
                                <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>">
                                <input class="button" type="submit" name="action" value="Submit Post">
                            </form>  

                        </div>
                    </div>
                </section>
            </div><!-- END COLORLIB-MAIN -->

        </div><!-- END COLORLIB-PAGE -->
        <script>
            var textarea = document.getElementById('editor');
            sceditor.create(textarea, {
                format: 'xhtml',
                style: 'minified/themes/content/default.min.css'
            });

        </script>
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
