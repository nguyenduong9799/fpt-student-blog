<%-- 
    Document   : createAccount
    Created on : Sep 22, 2021, 7:17:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CreateAccount Page</title>
        <link rel="stylesheet" href="./css/create.css">
    </head>
    <body>
         <jsp:useBean id="USER_ERROR" class="group1.dto.UserError">
            <jsp:setProperty name="USER_ERROR" property="userIDError" value="1234"/>
        </jsp:useBean>
        <div class="create">
            <h2>Create new user</h2>
            <form action="MainController" method="POST">
                <input type="text" placeholder="User ID" name="userID" required=""/><br/>
                ${requestScope.USER_ERROR.getUserIDError()}<br/>
                <input type="text" placeholder="Fullname" name="name" required=""/><br/>
                ${requestScope.USER_ERROR.getNameError()}<br/>
                <input type="password" placeholder="Password" name="password" required=""/><br/>
                ${requestScope.USER_ERROR.getConfirmError()}<br/>
                <input type="password" placeholder="Confirm Password" name="confirm" required=""/><br/>
                ${requestScope.USER_ERROR.getConfirmError()}<br/>
                <input type="text" placeholder="Phone Number" name="phone" required=""/><br/><br/>          
                <input type="text" placeholder="Email Address" name="email" required=""/><br/>
                <button type="submit" name="action" value="Create">Create</button><br/>
                <button type="reset" value="Reset">Reset</button><br/>
                ${requestScope.USER_ERROR.getMessageError()}
                <a href="login.jsp">Sign In</a><br/>
            </form> 
        </div>
    </body>
</html>
