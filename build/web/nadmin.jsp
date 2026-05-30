<%-- 
    Document   : nadmin
    Created on : 6 Oct, 2025, 5:46:39 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="index.html" method="get">
            <button type="submit">Back</button>
        </form>
    <center>
         <form action="nadmin" method="POST">
            <h1>Admin page</h1>
        <label>Admin name</label>
        <input type="text" placeholder="Enter name" name="name" required><br><br>
        <label>Password</label>
        <input type="pass" placeholder="Enter pass" name="pass" required><br><br>

        <input type="submit" value="LOGIN">
        </form>
        
        </center>
    </body>
</html>
