<%-- 
    Document   : Home
    Created on : Aug 25, 2021, 3:08:03 PM
    Author     : buili
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client Page</title>
    </head>
    <body>
        WellCome: <%= request.getAttribute("attname") %>
    </body>
</html>
