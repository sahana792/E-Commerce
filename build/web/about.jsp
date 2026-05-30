<%-- 
    Document   : about
    Created on : 10 Oct, 2025, 5:56:07 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* ===== General Page Styling ===== */
body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #74ebd5, #9face6);
    color: #333;
    margin: 0;
    padding: 0;
}

/* ===== Centered Container ===== */
center {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh; /* Full screen height */
    text-align: center;
}

/* ===== Main Heading ===== */
h1 {
    color: #2c3e50;
    font-size: 42px;
    margin-bottom: 10px;
    text-transform: uppercase;
    letter-spacing: 2px;
}

/* ===== Sub Heading ===== */
h2 {
    color: #2c3e50;
    font-size: 28px;
    margin-bottom: 20px;
}

/* ===== Paragraph Styling ===== */
p {
    font-size: 18px;
    color: #555;
    max-width: 600px;
    line-height: 1.6;
    margin-bottom: 10px;
}

/* ===== Optional Hover Effect for Fun ===== */
p:hover {
    color: #000;
    transition: 0.3s ease;
}
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
            border-radius: 6px;
        }

        .top-left button:hover {
            background-color: #222;
        }
        /* === Navbar === */
        nav {
            width: 100%;
            background-color: #333;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .nav-left h2 {
            color: #fff;
            margin: 0;
            font-size: 22px;
            letter-spacing: 1px;
        }

        .nav-right a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-right a:hover {
            color: #ffcc00;
        }
        </style>
    </head>
    <body>
        <!---<div class="top-left">
        <form action="home.jsp" method="get">
            <button type="submit">Back</button>
        </form>
    </div>---->
         <nav>
        <div class="nav-left">
            <h2>Ecommerce</h2>
        </div>
        <div class="nav-right">
            <a href="home.jsp">Home</a>
            <a href="about.jsp">About</a>
            <a href="contact.jsp">Contact Us</a>
            <a href="ulogout">Logout</a>
        </div>
    </nav>
    <center>
        <h1>About us</h1>
        <h2>E-Commerce</h2>
        <p>This website is launch to buy the products</p>
        <p>This branch is located in banglore</p>
    </center>
    </body>
</html>
