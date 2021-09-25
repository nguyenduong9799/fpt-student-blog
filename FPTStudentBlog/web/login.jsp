
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="./css/login.css">
    </head>
    <body>
        <div class="login">
            <h2>Please Login To Continue</h2>
            <form action="LoginController" method="POST">
                <input type="text" placeholder="user ID" name="userID"/><br/>
                <input type="password" placeholder="password" name="password"/><br/>
<<<<<<< Updated upstream
                <button type="submit" name="Login" value="Login">Login</button><br/>
                <button type="reset" value="Reset"/>Reset</button><br/>
=======
                <button type="submit" name="action" value="Login">Login</button><br/>
                <button type="reset" value="Reset">Reset</button><br/>
>>>>>>> Stashed changes
                <a href="createAccount.jsp">Sign Up</a><br/>
            </form>
        </div>
    </body>
</html>
 