<%-- 
    Document   : home
    Created on : 26 Sep, 2025, 7:11:38 PM
    Author     : user
--%>
<%
    HttpSession hs = request.getSession();
    String uphono = null;
    String upass = null;
    try {
        uphono = hs.getAttribute("uphono").toString();
        upass = hs.getAttribute("upass").toString();
        if (uphono == null || upass == null || uphono.equals("") || upass.equals("")) {
            out.println("<meta http-equiv='refresh' content='0;ulogout' />");
        }
    } catch (Exception e) {
        out.println("<meta http-equiv='refresh' content='0;ulogout' />");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Home</title>

    <style>
        /* === Page Background === */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #9face6);
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
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

        /* === Main Container === */
        .center-container {
            background-color: white;
            padding: 50px 60px;
            border-radius: 15px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.25);
            text-align: center;
            min-width: 350px;
            margin-top: 80px;
        }

        h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 30px;
            text-transform: uppercase;
        }

        /* === Buttons === */
        button {
            background-color: #6c63ff;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px 25px;
            font-size: 16px;
            cursor: pointer;
            margin: 10px;
            transition: background-color 0.3s, transform 0.2s;
        }

        button:hover {
            background-color: #5548d0;
            transform: scale(1.05);
        }

        /* === Logout Link === */
        a.logout-link {
            display: inline-block;
            margin-top: 20px;
            color: #ff4d4d;
            font-weight: bold;
            text-decoration: none;
            transition: color 0.3s;
        }

        a.logout-link:hover {
            color: #ff1a1a;
        }

        /* === Responsive Navbar === */
        @media (max-width: 600px) {
            nav {
                flex-direction: column;
                align-items: flex-start;
                padding: 15px;
            }
            .nav-right {
                margin-top: 10px;
            }
            .nav-right a {
                display: block;
                margin: 8px 0;
            }
        }
    </style>
</head>

<body>

    <!-- Navigation Bar -->
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

    <!-- Main Section -->
    <div class="center-container">
        <h1>Welcome to Ecommerce Website</h1>

        <form action="pbview.jsp" method="get">
            <button type="submit">View Products</button>
        </form>
    </div>

</body>
</html>
