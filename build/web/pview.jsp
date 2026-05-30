<%@page import="database.dbconfig"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
     HttpSession hs = request.getSession();
     String aname = null;
     String apass = null;
     try {
         aname = hs.getAttribute("aname").toString();
         apass = hs.getAttribute("apass").toString();
         if(aname == null || apass == null || aname.equals("") || apass.equals("")) {
             out.println("<meta http-equiv='refresh' content='0;alogout' />");
         }
     } catch(Exception e) {
         out.println("<meta http-equiv='refresh' content='0;alogout' />");
     }
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product View Page</title>
    <style>
        /* Background and layout */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }

        /* Top buttons */
        .top-buttons {
            display: flex;
            justify-content: space-between;
            padding: 20px 40px;
        }

        .top-buttons button,
        .top-buttons a {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 15px;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .top-buttons button:hover,
        .top-buttons a:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Main heading */
        h1 {
            text-align: center;
            color: #333;
            margin-top: 70px;
            margin-bottom: 30px;
            font-size: 30px;
        }

        /* Table styling */
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
        }

        caption {
            font-weight: bold;
            font-size: 20px;
            color: #333;
            padding: 15px;
        }

        th, td {
            text-align: center;
            padding: 14px 10px;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Responsive design */
        @media screen and (max-width: 768px) {
            table {
                width: 95%;
            }
            th, td {
                font-size: 14px;
                padding: 10px;
            }
        }
        
        /* ===== Back button (top-left corner) ===== */
        .top-left-btn {
            position: fixed;
            top: 60px;
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

    <!-- Top Buttons -->
   <!---- <button class="top-left-btn" onclick="window.location.href='graph.jsp'">Back</button>
        <a href="alogout">Logout</a>
    </div>
----->
    <!-- Page Title -->
    

    <!-- Product Table -->
    <table>
        <h1>Product Database</h1>
        <thead>
            <tr>
                <th>SL.no</th>
                <th>Name</th>
                <th>Quality (Dozen)</th>
                <th>Price (Rs)</th>
                <th>Description</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    int slno = 0;
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = new dbconfig().getConnection();
                    Statement stat = con.createStatement();
                    ResultSet res = stat.executeQuery("SELECT * FROM product");
                    while (res.next()) {
                        slno++;
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
                <td><a href="prodel?id=<%= quality %>">Delete</a></td>
                <td><a href="update.jsp?id=<%= quality %>">Update</a></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='7'>Error: " + e + "</td></tr>");
                }
            %>
        </tbody>
    </table>

</body>
</html>
