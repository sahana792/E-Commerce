<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Adding Product Page</title>
    <style>
        /* Page styling */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Container for the form */
        .container {
            background-color: white;
            padding: 10px 70px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 350px;
        }

        h1 {
            margin-bottom: 25px;
            color: #333;
        }

        /* Input fields styling */
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            box-sizing: border-box;
            transition: 0.3s;
        }

        input[type="text"]:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0,123,255,0.5);
        }

        label {
            display: block;
            text-align: left;
            margin-top: 10px;
            color: #444;
            font-weight: 500;
        }

        /* Buttons */
        button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px 25px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
            margin-top: 15px;
        }

        button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Back button (fixed top-left) */
        .top-left-btn {
            position: fixed;
            top: 70px;
            left: 20px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 8px 5px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.3s ease;
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
    
    <!-- Navigation Bar -->
     <nav>
        <div class="nav-left">
            <h2>Ecommerce</h2>
        </div>
        <div class="nav-right">
            <a href="graph.jsp">Home</a>
            <a href="add.jsp">Add</a>
            <a href="pview.jsp">View</a>
            <a href="Monthly.jsp">Income</a>
            <a href="alogout">Logout</a>
        </div>
    </nav>

    <!-- Back button -->
    <!---<button class="top-left-btn" onclick="window.location.href='graph.jsp'">Back</button>--->

    <!-- Form container -->
    <div class="container">
        <h1>Add Products</h1>
        <form action="addb" method="POST">
            <label>Product Name</label>
            <input type="text" placeholder="Enter name" name="name" required>

            <label>Quality</label>
            <input type="text" placeholder="Enter quality" name="quality" required>

            <label>Price</label>
            <input type="text" placeholder="Enter price" name="price" required>

            <label>Description</label>
            <input type="text" placeholder="Enter description" name="description" required>

            <button type="submit">Add Product</button>
        </form>
    </div>

</body>
</html>
