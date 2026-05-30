<%-- 
    Document   : userlogin
    Created on : 26 Sep, 2025, 6:27:40 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Login Page</title>

    <style>
        /* === Page Layout === */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* === Card Container === */
        .login-box {
            background-color: white;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }

        /* === Heading === */
        h1 {
            color: #333;
            margin-bottom: 25px;
            font-size: 26px;
            text-transform: uppercase;
        }

        /* === Labels and Inputs === */
        label {
            display: block;
            text-align: left;
            font-weight: 500;
            color: #555;
            margin-bottom: 5px;
            margin-top: 10px;
        }

        input[type="text"], 
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1.5px solid #ccc;
            border-radius: 8px;
            margin-bottom: 10px;
            outline: none;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus, 
        input[type="password"]:focus {
            border-color: #007bff;
        }

        /* === Buttons === */
        button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 25px;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* === Back Button (top-left) === */
        .top-left {
            position: absolute;
            top: 20px;
            left: 20px;
        }

        .top-left button {
            background-color: #444;
            color: white;
            font-size: 14px;
            padding: 8px 18px;
        }

        .top-left button:hover {
            background-color: #222;
        }

        /* === Elogin Button === */
        .elogin-btn {
            background-color: #28a745;
        }

        .elogin-btn:hover {
            background-color: #1f7a33;
        }
         nav {
            width: 100%;
            background-color: #ffffff;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 10px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            border-radius: 0 0 15px 15px;
        }

        nav .nav-left h2 {
            color: #6c63ff;
            font-size: 26px;
            margin: 0;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        nav .nav-right a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            margin: 0 20px;
            font-size: 17px;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        nav .nav-right a:hover {
            color: #6c63ff;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
<nav>
        <div class="nav-left">
            <h2>Ecommerce</h2>
        </div>
        <div class="nav-right">
            <a href="index.html">Home</a>
            <a href="adminlogin.jsp">Admin</a>
            <a href="userlogin.jsp">User</a>
            
        </div>
    </nav>
    <!-- Back button -->
    <!----<div class="top-left">
        <form action="index.html" method="get">
            <button type="submit">Back</button>
        </form>
    </div>---->

    <!-- Login Box -->
    <div class="login-box">
        <form action="userlogindb" method="POST">
            <h1>User Login</h1>

            <label>User Name</label>
            <input type="text" placeholder="Enter name" name="name" required>

            <label>User Phone</label>
            <input type="text" placeholder="Enter phone number" name="phono" required>

            <label>User Email</label>
            <input type="text" placeholder="Enter email" name="email" required>

            <label>Password</label>
            <input type="password" placeholder="Enter password" name="pass" required>

            <label>Confirm Password</label>
            <input type="password" placeholder="Confirm password" name="cpass" required>

            <button type="submit">Login</button>
        </form>

        <br>
        <form action="elogin.jsp" method="get">
            <button class="elogin-btn" type="submit">Elogin</button>
        </form>
    </div>

</body>
</html>
