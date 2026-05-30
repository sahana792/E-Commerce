<%-- 
    Document   : contact
    Created on : 10 Oct, 2025
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contact Us</title>

    <style>
        /* ===== Global Styles ===== */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #9face6);
            color: #333;
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }

        /* ===== Navbar ===== */
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

        /* ===== Page Title ===== */
        h1 {
            font-size: 36px;
            color: #222;
            margin-top: 40px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            text-align: center;
        }

        /* ===== Contact Boxes ===== */
        .contact-box {
            background-color: #ffffff;
            width: 60%;
            margin: 25px auto;
            padding: 25px 30px;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .contact-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);
        }

        /* ===== Section Headings ===== */
        h2 {
            color: #6c63ff;
            font-size: 22px;
            margin-bottom: 8px;
            text-transform: capitalize;
        }

        /* ===== Paragraphs ===== */
        p {
            font-size: 18px;
            color: #555;
            line-height: 1.6;
            margin: 0;
        }

        /* ===== Responsive Design ===== */
        @media (max-width: 768px) {
            .contact-box {
                width: 85%;
                padding: 20px;
            }

            h1 {
                font-size: 28px;
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

    <!-- Page Heading -->
    <h1>Contact Us</h1>

    <!-- Contact Details -->
    <div class="contact-box">
        <h2>Address</h2>
        <p>This place is located in HSR Layout, Bangalore.</p>
    </div>

    <div class="contact-box">
        <h2>Contact Mail</h2>
        <p>ecommerce@gmail.com</p>
    </div>

    <div class="contact-box">
        <h2>Phone No</h2>
        <p>6576376375</p>
    </div>

</body>
</html>
