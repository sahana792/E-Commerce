<%-- 
    Document   : pbview
    Created on : 29 Sep, 2025, 6:22:10 PM
    Author     : user
--%>

<%@page import="database.dbconfig"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product View</title>
    <style>
        /* === Page Background === */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #9face6);
            margin: 0;
            min-height: 100vh;
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
            position: fixed; /* make navbar stay at top */
            top: 0;
            left: 0;
            z-index: 1000;
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
            margin: 0 10px;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-right a:hover {
            color: #ffcc00;
        }

        /* === Main Content === */
        .content {
            margin-top: 100px; /* space below fixed navbar */
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 30px;
            text-transform: uppercase;
        }

        /* === Table Styling === */
        table {
            width: 80%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 6px 18px rgba(0,0,0,0.2);
        }

        table caption {
            caption-side: top;
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #6c63ff;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: center;
        }

        table th {
            background-color: #6c63ff;
            color: white;
            font-weight: 600;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tr:hover {
            background-color: #e0e0ff;
            transition: background-color 0.3s ease;
        }

        /* === Buttons === */
        button, a.button-link {
            background-color: #6c63ff;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 25px;
            font-size: 15px;
            cursor: pointer;
            margin: 8px;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s, transform 0.2s;
        }

        button:hover, a.button-link:hover {
            background-color: #5548d0;
            transform: scale(1.05);
        }

        /* === Back Button === */
        .top-left {
            position: fixed;
            top: 80px;
            left: 20px;
            z-index: 100;
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
    </style>
</head>
<body>
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

    <!---<div class="top-left">
        <form action="home.jsp" method="get">
            <button type="submit">Back</button>
        </form>
    </div>--->

    <div class="content">
        <h1>Product Views</h1>
        <table>
            <caption>Products Information</caption>
            <thead>
                <tr>
                    <th>SL.no</th>
                    <th>Name</th>
                    <th>Quality (Dozen)</th>
                    <th>Price (Rs)</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        int slno = 0;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = new dbconfig().getConnection();
                        Statement stat = con.createStatement();
                        ResultSet res = stat.executeQuery("SELECT * FROM `product`");
                        while (res.next()) {
                            slno++;
                            String id = res.getString("id");
                            String name = res.getString("name");
                            String quality = res.getString("quality");
                            String price = res.getString("price");
                            String description = res.getString("description");
                %>
                <tr>
                    <td><%= slno %></td>
                    <td><%= name %></td>
                    <td><%= quality %></td>
                    <td><%= price %></td>
                    <td><%= description %></td>
                    <td><a class="button-link" href="buy.jsp?id=<%= id %>">Buy</a></td>
                </tr>
                <%
                        }
                        res.close();
                        stat.close();
                        con.close();
                    } catch (Exception e) {
                        out.println("<tr><td colspan='6'>Error: " + e + "</td></tr>");
                    }
                %>
            </tbody>
        </table>

        <form action="uview.jsp" method="get">
            <button type="submit">Show</button>
        </form>
    </div>
</body>
</html>
