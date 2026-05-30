<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Portal</title>
    <style>
        /* ===== Full page style with background image ===== */
        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/Ecommerce image.webp') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            position: relative;
        }

        /* ===== Soft overlay for readability without fading image ===== */
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.08); /* very light overlay */
            z-index: 0;
        }

        /* ===== Container box (Admin Portal) ===== */
        .container {
            position: relative;
            z-index: 1; /* above overlay */
            background: rgba(255, 255, 255, 0.9);
            padding: 50px 60px;
            border-radius: 15px;
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }

        h1 {
            margin-bottom: 40px;
            color: #333;
        }

        /* ===== Buttons ===== */
        form button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px 30px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
            width: 200px;
        }

        form button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        form {
            margin-bottom: 20px;
        }

        /* ===== Back button (top-left corner) ===== */
        .top-left-btn {
            position: fixed;
            top: 20px;
            left: 20px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 8px 15px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.3s ease;
            z-index: 2;
        }

        .top-left-btn:hover {
            background-color: #d32f2f;
        }

        /* ===== Navigation Bar ===== */
        nav {
            width: 100%;
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 1px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 3;
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
    <!-- Back Button -->
    <button class="top-left-btn" onclick="window.location.href='adminlogin.jsp'">Back</button>

    <!-- Navigation Bar -->
    <nav>
        <div class="nav-left">
            <h2>Ecommerce</h2>
        </div>
        <div class="nav-right">
            <a href="graph.jsp">Home</a>
            <a href="adminlogin.jsp">Admin</a>
            <a href="userlogin.jsp">User</a>
        </div>
    </nav>

    <!-- Admin Portal Box -->
    <div class="container">
        <h1>Admin Portal</h1>

        <form action="add.jsp" method="get">
            <button type="submit">Add Products</button>
        </form>

        <form action="pview.jsp" method="get">
            <button type="submit">View Products</button>
        </form>

        <form action="Monthly.jsp" method="get">
            <button type="submit">Monthly Income</button>
        </form>

        <form action="graph.jsp" method="get">
            <button type="submit">Income Graph</button>
        </form>
    </div>
</body>
</html>
