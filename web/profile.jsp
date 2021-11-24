<%@page import="group1.dto.UserError"%>
<%@page import="group1.dto.RankDTO"%>
<%@page import="group1.dao.RankDAO"%>
<%@page import="group1.dao.UserDAO"%>
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
        <meta name="referrer" content="no-referrer">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/home.css">
        <title>Profile Page</title>
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
                        <li class="colorlib-active"><a href="MainController?action=Profile">Welcome: <%= loginUser.getUserName()%></a></li>
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
            </aside> <!-- END PAGE-ASIDE -->  

            <div id="colorlib-main"> <!-- START MAIN-PAGE -->
                <section class="ftco-section ftco-no-pt ftco-no-pb bg-light">
                    <div class="row d-flex no-gutters">
                        <div class="col-lg-8 px-md-5 py-5">
                            <%
                                PostDAO dao = new PostDAO();
                                List<PostDTO> list = (List<PostDTO>) request.getAttribute("LIST_POST_BY_USERID");
                                int totalPost = (int) request.getAttribute("TOTAL_POST_BY_USER");
                                if (list != null) {
                                    if (!list.isEmpty()) {
                                        for (PostDTO post : list) {
                            %>
                            <div class="contentPage">
                                <div class="blog-entry ftco-animate d-md-flex align-items-center" style="margin-bottom: 20px;">
                                    <div class="text p-4">
                                        <%
                                            if ("Approved".equals(post.getStatus())) {
                                        %>
                                        <span class="badge badge-success">Approved</span>
                                        <%
                                        } else if ("Denied".equals(post.getStatus())) {
                                        %>
                                        <span class="badge badge-danger">Denied</span>
                                        <%
                                        } else {
                                        %>
                                        <span class="badge badge-primary">Waiting</span>
                                        <%
                                            }
                                        %>
                                        <h3 class="mb-2"><a href="MainController?action=ViewYourPost&postID=<%=post.getPostID()%>" ><%=post.getTitle()%></a></h3>
                                        <div class="meta-wrap">
                                            <p class="meta">
                                                <span><i class="icon-folder-o mr-2"></i><%=post.getCategory()%></a></span><br>
                                                <span><i class="icon-calendar mr-2"></i><%=post.getDate().substring(0, 19)%></span><br>
                                                <span><i class="icon-comment2 mr-2"></i><%=dao.getTotalComment(post.getPostID())%> Comment</span>
                                            </p>
                                        </div>                                             
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            } else {
                            %>
                            <h2>You don't have any posts. Let's <a style="color: blue;" href="addPost.jsp">Create a new post.</a></h2>
                            <%
                                    }
                                }
                            %>
                            <!-- Hiên thị nút bấm -->
                            <div style=" display: flex;justify-content: center;"><ul style="margin-top: 15px;"id="pagination"></ul></div>
                        </div>
                        <div class="col-lg-4 sidebar ftco-animate bg-light pt-5">
                            <form action="MainController" method="Post" accept-charset="UTF-8">
                                <div class="sidebar-box"  style="text-align: center;">
                                    <div style="position: relative;">
                                        <img id="image" style="border-radius: 999px;"width="250" height="250" src="<%=loginUser.getImage()%>" alt="Image placeholder" class="mb-4">                                   
                                    </div>  
                                </div>
                                <div class="sidebar-box ftco-animate">
                                    <%
                                        RankDAO rank = new RankDAO();
                                        UserError errorString = (UserError) request.getAttribute("USER_ERROR");
                                        if (errorString == null) {
                                            errorString = new UserError();
                                        }
                                    %>
                                    <img style="display: block; margin-left: auto; margin-right:auto; " width="80px" height="60px" src="<%=rank.getRankImage(loginUser.getRankID())%>" alt=""/>
                                    <br/>
                                    <label style="margin-top: 5px;">Your total vote: <%=loginUser.getTotalVote()%> votes</label><br/>
                                    <label style="margin-top: 5px;">Full Name</label><br/>
                                    <input type="text" name="userName" class="input" value="<%=loginUser.getUserName()%>"/><br/><p style="color: red;"><%=errorString.getNameError()%></p>
                                    <label>Email</label><br/>
                                    <input type="text" name="email" class="input" value="<%=loginUser.getEmail()%>"/><br/>
                                    <label>Phone Number</label><br/>
                                    <input type="text" name="phone" class="input" value="<%=loginUser.getPhone()%>"/><br/>
                                    <label>Avatar image</label><br/>
                                    <input type="file" accept="image/*">
                                    <input id="link" type="text" name="image" class="input" value="<%=loginUser.getImage()%>"/><br/>
                                    <label>Change Password</label><br/>
                                    <input type="password" name="newPassword" class="input" placeholder="New password..."/><br/>
                                    <input type="password" name="confirm" class="input" placeholder="Confirm new password..."/><br/><p style="color: red;"><%=errorString.getConfirmError()%></p>
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
        <script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
        <!-- JS tạo nút bấm di chuyển trang start -->
        <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
        <!-- JS tạo nút bấm di chuyển trang end -->
        <script type="text/javascript">
                            $(function () {
                                var pageSize = 5; // Hiển thị 5 sản phẩm trên 1 trang
                                showPage = function (page) {
                                    $(".contentPage").hide();
                                    $(".contentPage").each(function (n) {
                                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                                            $(this).show();
                                    });
                                }
                                showPage(1);
                                ///** Cần truyền giá trị vào đây **///
                                var totalRows = <%=totalPost%>; // Tổng số sản phẩm hiển thị
                                var btnPage = 4; // Số nút bấm hiển thị di chuyển trang
                                var iTotalPages = Math.ceil(totalRows / pageSize);

                                var obj = $('#pagination').twbsPagination({
                                    totalPages: iTotalPages,
                                    visiblePages: btnPage,
                                    onPageClick: function (event, page) {
                                        console.info(page);
                                        showPage(page);
                                    }
                                });
                                console.info(obj.data());
                            });
        </script>
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
