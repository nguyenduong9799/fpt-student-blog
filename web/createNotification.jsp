<%-- 
    Document   : createNofication.jsp
    Created on : Oct 13, 2021, 2:28:49 PM
    Author     : ACER
--%>

<%@page import="group1.dao.CategoryDAO"%>
<%@page import="group1.dto.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="group1.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="referrer" content="no-referrer">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="css/mentor.css" rel="stylesheet" type="text/css"/>
        <link href="css/addPost.css" rel="stylesheet" type="text/css"/>
        <link href="./Mentor_files/styles.css" rel="stylesheet">
        <script src="./Mentor_files/all.min.js.download" crossorigin="anonymous"></script>
        <!--sceditor-->
        <link rel="stylesheet" href="./minified/themes/default.min.css" id="theme-style" />
        <script src="./minified/sceditor.min.js"></script>
        <script src="minified/plugins/dragdrop.js" type="text/javascript"></script>
        <script src="./minified/icons/monocons.js"></script>
        <script src="./minified/formats/xhtml.js"></script>
        <script src="https://dl.dropboxusercontent.com/s/nvklmhq3kw4j9pq/jquerylasted.js?dl=0"></script>
        <title>Create Notification Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"MT".equals(loginUser.getRoleID())) {
                response.sendRedirect("LogoutController");
                return;
            } else {
        %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">

            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="mentor.jsp">FPT Blog</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><svg class="svg-inline--fa fa-bars fa-w-14" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z"></path></svg><!-- <i class="fas fa-bars"></i> Font Awesome fontawesome.com --></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="file:///D:/Study/SWP391/startbootstrap-sb-admin-gh-pages/index.html#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><svg class="svg-inline--fa fa-user fa-w-14 fa-fw" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="user" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M224 256c70.7 0 128-57.3 128-128S294.7 0 224 0 96 57.3 96 128s57.3 128 128 128zm89.6 32h-16.7c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16h-16.7C60.2 288 0 348.2 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-74.2-60.2-134.4-134.4-134.4z"></path></svg><!-- <i class="fas fa-user fa-fw"></i> Font Awesome fontawesome.com --></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="profile.jsp">Welcome: <%= loginUser.getUserName()%></a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="MainController?action=Logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link" href="createNotification.jsp">Create Notification</a>
                            <a class="nav-link" href="listNotification.jsp"><div class="sb-nav-link-icon"><svg class="svg-inline--fa fa-table fa-w-16" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V80c0-26.51-21.49-48-48-48zM224 416H64v-96h160v96zm0-160H64v-96h160v96zm224 160H288v-96h160v96zm0-160H288v-96h160v96z"></path></svg></div>
                                List Notification</a>
                            <a class="nav-link" href="mentor.jsp"><div class="sb-nav-link-icon"><svg class="svg-inline--fa fa-table fa-w-16" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V80c0-26.51-21.49-48-48-48zM224 416H64v-96h160v96zm0-160H64v-96h160v96zm224 160H288v-96h160v96zm0-160H288v-96h160v96z"></path></svg><!-- <i class="fas fa-table"></i> Font Awesome fontawesome.com --></div>
                                Waiting post</a>
                            <a class="nav-link" href="approvedPost.jsp"><div class="sb-nav-link-icon"><svg class="svg-inline--fa fa-table fa-w-16" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V80c0-26.51-21.49-48-48-48zM224 416H64v-96h160v96zm0-160H64v-96h160v96zm224 160H288v-96h160v96zm0-160H288v-96h160v96z"></path></svg><!-- <i class="fas fa-table"></i> Font Awesome fontawesome.com --></div>
                                Approved post</a>
                            <a class="nav-link" href="deniedPost.jsp"><div class="sb-nav-link-icon"><svg class="svg-inline--fa fa-table fa-w-16" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V80c0-26.51-21.49-48-48-48zM224 416H64v-96h160v96zm0-160H64v-96h160v96zm224 160H288v-96h160v96zm0-160H288v-96h160v96z"></path></svg><!-- <i class="fas fa-table"></i> Font Awesome fontawesome.com --></div>
                                Denied post</a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>Mentor of FPT Blog</div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <p></p>
                        <div class="card mb-4">
                            <div class="card-header">
                                <svg class="svg-inline--fa fa-table fa-w-16 me-1" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V80c0-26.51-21.49-48-48-48zM224 416H64v-96h160v96zm0-160H64v-96h160v96zm224 160H288v-96h160v96zm0-160H288v-96h160v96z"></path></svg><!-- <i class="fas fa-table me-1"></i> Font Awesome fontawesome.com -->
                                Create Notification
                            </div>
                            <div class="card-body">
                                <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
                                    <div class="dataTable-top">       
                                        <!--<div class="dataTable-search">
                                        <input class="dataTable-input" placeholder="Search..." type="text">
                                        </div>-->
                                    </div>
                                    <div class="dataTable-container">
                                        <form action="MainController" method="POST" accept-charset="UTF-8">
                                            <textarea style="margin-top: 20px;"id="title" rows="2" cols="55" type="text" name="title" required="" placeholder="Title of the post ..."></textarea><br>
                                            <div style="display: flex; margin-top: 20px;">
                                                <input style="margin-top: 10px;"type="file" accept="image/*">
                                                <input class="form-control" id="image-1" placeholder="Background Image Link" style="width: 100%;" type="text" name="imageBackgound" required="">
                                            </div><br>
                                            <!--Content-->
                                            <h2>Content of the notification</h2>           
                                            <textarea rows="20" cols="5" id="editor" name="postContent"></textarea><br>
                                            <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>">
                                            <input style="margin-bottom: 20px;"class="btn btn-primary" type="submit" name="action" value="Create Notification">
                                            <div hidden="">
                                                <label for="theme" >Theme:</label>
                                                <select id="theme" >
                                                    <option value="default">Default</option>
                                                    <!--<option value="defaultdark">Default dark</option>
                                                        <option value="modern">Modern</option>
                                                        <option value="office-toolbar">Office Toolbar</option>
                                                        <option value="office">Office</option>
                                                        <option value="square">Square</option>-->
                                                </select>
                                            </div>
                                        </form>  
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <%
            }
        %>
        <script src="./Mentor_files/bootstrap.bundle.min.js.download" crossorigin="anonymous"></script>
        <script src="./Mentor_files/scripts.js.download"></script>
        <script src="./Mentor_files/Chart.min.js.download" crossorigin="anonymous"></script>
        <script src="./Mentor_files/chart-area-demo.js.download"></script>
        <script src="./Mentor_files/chart-bar-demo.js.download"></script>
        <script src="./Mentor_files/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="./Mentor_files/datatables-simple-demo.js.download"></script>
        <script>
            var textarea = document.getElementById('editor');
//            sceditor.create(textarea, {
//                format: 'xhtml',
//                icons: 'monocons',
//                style: 'minified/themes/content/default.min.css'
//            });
            var themeInput = document.getElementById('theme');
            themeInput.onchange = function () {
                var theme = '../minified/themes/' + themeInput.value + '.min.css';

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
    </body>
</html>
