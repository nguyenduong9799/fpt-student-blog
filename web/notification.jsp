
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
        <title>Notification Page</title>
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

    </head>
    <body>
        <div id="colorlib-page">
            <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
            <aside id="colorlib-aside" role="complementary" class="js-fullheight img" style="background-image: url(images/sidebar-bg.jpg);">
                <h1 id="colorlib-logo" class="mb-4"><a href="home.jsp">fptblog</a></h1>
                <nav id="colorlib-main-menu" role="navigation">
                    <ul>
                        <li ><a href="home.jsp">Home</a></li>
                        <li class="colorlib-active"><a href="notification.jsp">Notification</a></li><br>
                            <%
                                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                if (loginUser != null) {
                            %>
                        <li><a href="MainController?action=Profile">Welcome: <%= loginUser.getUserName()%></a></li>
                        <li><a href="addPost.jsp">Create New Post</a></li>
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
                        <div class="row d-flex no-gutters">
                            <div class="col-lg-8 px-md-5 py-5">
                                <%
                                    PostDAO dao = new PostDAO();
                                    int total = dao.getTotalNotification();
                                    List<PostDTO> list = dao.getNotification();
                                    if (list != null) {
                                        if (!list.isEmpty()) {
                                            for (PostDTO post : list) {
                                %>

                                <div class="blog-entry ftco-animate contentPage">
                                    <div class="text p-4">
                                        <h3 class="mb-2"><a href="MainController?action=ViewPost&postID=<%=post.getPostID()%>"><%=post.getTitle()%></a></h3>
                                        <div class="meta-wrap">
                                            <p class="meta">
                                                <span><i class="icon-folder-o mr-2"></i><%=post.getCategory()%></a></span><br>
                                                <span><i class="icon-calendar mr-2"></i><%=dao.splitDate(post.getDate())%></span><br>
                                                <span><i class="icon-comment2 mr-2"></i><%=dao.getTotalComment(post.getPostID())%> Comments</span>
                                            </p>
                                        </div>
                                        <p class="mb-4"><%=post.getUserID()%></p>
                                        <p><a href="MainController?action=ViewPost&postID=<%=post.getPostID()%>" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
                                    </div>
                                </div>
                                <%
                                            }
                                        }
                                    }
                                %>
                                <!-- Hiên thị nút bấm -->
                                <ul id="pagination"></ul>
                            </div>
                            <div class="col-lg-4 sidebar ftco-animate bg-light pt-5">
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
        
        <script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
        <!-- JS tạo nút bấm di chuyển trang start -->
        <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
        <!-- JS tạo nút bấm di chuyển trang end -->
        <script type="text/javascript">
            $(function () {
                var pageSize = 5; // Hiển thị 6 sản phẩm trên 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** Cần truyền giá trị vào đây **///
                var totalRows = <%=total%>; // Tổng số sản phẩm hiển thị
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
    </body>
</html>