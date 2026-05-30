<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Login</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 300px;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 30px;
            font-size: 24px;
        }

        label {
            display: block;
            text-align: left;
            font-weight: 500;
            margin-bottom: 5px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Back button on top-left */
        .top-left-btn {
            position: fixed;
            top: 20px;
            left: 20px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 8px 14px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .top-left-btn:hover {
            background-color: #d32f2f;
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

    <!-- Back Button -->
    <!----<button class="top-left-btn" onclick="window.location.href='index.html'">Back</button>
---->
    <!-- Centered Login Box -->
    <div class="container">
        <h1>Admin Login Page</h1>
        <form action="adminlogindb" method="POST">
            <label>User name</label>
            <input type="text" placeholder="Enter user name" name="name" required>

            <label>Password</label>
            <input type="password" placeholder="Enter password" name="pass" required>

            <button type="submit">Login</button>
        </form>
    </div>

</body>
</html>
