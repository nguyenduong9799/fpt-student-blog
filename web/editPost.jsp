<%-- 
    Document   : addPost
    Created on : Sep 28, 2021, 5:04:33 PM
    Author     : ACER
--%>

<%@page import="group1.dto.PostDTO"%>
<%@page import="group1.dto.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="group1.dao.CategoryDAO"%>
<%@page import="group1.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="referrer" content="no-referrer">
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
        <!--sceditor-->
        <link rel="stylesheet" href="./minified/themes/default.min.css" id="theme-style" />
        <script src="./minified/sceditor.min.js"></script>
        <script src="minified/plugins/dragdrop.js" type="text/javascript"></script>
        <script src="./minified/icons/monocons.js"></script>
        <script src="./minified/formats/xhtml.js"></script>
        <script src="https://dl.dropboxusercontent.com/s/nvklmhq3kw4j9pq/jquerylasted.js?dl=0"></script>
        
        <title>Create Post Page</title>
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
                        <li class="colorlib-active"><a href="addPost.jsp">Create New Post</a></li>
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
                        <h3>Send Feedback For FPT Blog</h3>
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
            </aside> <!-- END PAGE-ASIDE -->  

            <div id="colorlib-main"> <!-- START MAIN-PAGE -->
                <section class="ftco-section ftco-no-pt ftco-no-pb bg-light">
                    <div class="container px-0">
                        <div class="row no-gutters">
                            <form action="MainController" method="POST" accept-charset="UTF-8">
                                <div class="col-lg-12 px-md-5 py-5">
                                    <%
                                        PostDTO post = (PostDTO) request.getAttribute("POST_VIEW");
                                    %>
                                    <textarea style="margin-top: 20px;" class="form-control" rows="2" cols="55" type="text" name="title" required=""><%=post.getTitle()%></textarea><br>   

                                    <!--Category-->       
                                    <select class="select" name="category">
                                        <option selected value="<%=post.getCategory()%>"><%=post.getCategory()%></option>
                                        <%
                                            String tag = (String) request.getAttribute("POST_TAGS");
                                            ArrayList<CategoryDTO> listCate = CategoryDAO.getAllCategory();
                                            if (listCate != null) {
                                                if (!listCate.isEmpty()) {
                                                    for (CategoryDTO category : listCate) {
                                        %>
                                        <option class="option" value="<%=category.getCategoryName()%>"><%=category.getCategoryName()%></option>
                                        <%
                                                    }
                                                }
                                            }
                                        %>
                                    </select>
                                    <input class="form-control" placeholder="Tag" style="width: 100%;" type="text" name="tagList" value="<%=tag%>"><br>
                                     <div style="display: flex;">
                                        <input style="margin-top: 10px;"type="file" accept="image/*">
                                        <input class="form-control" id="image-1" placeholder="Background Image Link" style="width: 100%;" type="text" name="imageBackgound" required="" value="<%=post.getImage()%>">
                                    </div><br><br>
                                    <!--Content-->
                                    <h3 class="mb-5">Content of the post...</h3>
                                    <textarea rows="20" cols="5" id="editor" name="postContent"><%=post.getPostContent()%></textarea><br>
                                    <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>">
                                    <input type="hidden" name="postID" value="<%=post.getPostID()%>">
                                    <input style="margin-bottom: 20px;" class="btn py-3 px-4 btn-primary" type="submit" name="action" value="Submit Post Again">
                                    <div hidden="">
                                        <label for="theme" >Theme:</label>
                                        <select id="theme" >
                                            <option value="default">Default</option>
                                            <!--                                    <option value="defaultdark">Default dark</option>
                                                                                    <option value="modern">Modern</option>
                                                                                    <option value="office-toolbar">Office Toolbar</option>
                                                                                    <option value="office">Office</option>
                                                                                    <option value="square">Square</option>-->
                                        </select>
                                    </div>
                                </div>                                 
                            </form>  
                        </div>
                    </div>
                </section>
            </div><!-- END COLORLIB-MAIN -->

        </div><!-- END COLORLIB-PAGE -->
        <script>
            var textarea = document.getElementById('editor');
            //            sceditor.create(textarea, {
            //                format: 'xhtml',
            //                icons: 'monocons',
            //                style: 'minified/themes/content/default.min.css'
            //            });
            var themeInput = document.getElementById('theme');
            themeInput.onchange = function () {
                var theme = 'minified/themes/' + themeInput.value + '.min.css';

                document.getElementById('theme-style').href = theme;
            };
            function imgurUpload(file) {
                var headers = new Headers({
                    'Authorization': 'Client-ID 7911328dd6c64c1'
                });

                var form = new FormData();
                form.append('image', file);

                return fetch('https://api.imgur.com/3/image', {
                    method: 'post',
                    headers: headers,
                    body: form
                }).then(function (response) {
                    return response.json();
                }).then(function (result) {
                    if (result.success) {
                        if (document.getElementById("image-1").value == "") {
                            document.getElementById("image-1").value = result.data.link;
                        }
                        console.log(result.data.link);
                        return result.data.link;
                    }

                    throw 'Upload error';
                });
            }

            var dragdropOptions = {
                allowedTypes: ['image/jpeg', 'image/png'],

                handleFile: function (file, createPlaceholder) {
                    var placeholder = createPlaceholder();

                    imgurUpload(file).then(function (url) {
                        // Replace the placeholder with the image HTML
                        placeholder.insert('<img src=\'' + url + '\' />');
                    }).catch(function () {
                        // Error so remove the placeholder
                        placeholder.cancel();

                        alert('Problem uploading image to imgur.');
                    });
                }
            };
            sceditor.create(textarea, {
                // Enable the drag and drop plugin
                plugins: 'dragdrop',
                // Set the drag and drop plugin options
                dragdrop: dragdropOptions,

                // Rest of SCEditor options
                format: 'xhmtl',
                icons: 'monocons',
                autofocus: true,
                style: 'minified/themes/content/default.min.css'
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
                            document.getElementById("image-1").value = obj.data.link;
                        });
                    }
                });
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
