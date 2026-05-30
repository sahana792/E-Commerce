<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.dbconfig"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
    HttpSession hs = request.getSession();
    String aname = null;
    String apass = null;
    try {
        aname = hs.getAttribute("aname").toString();
        apass = hs.getAttribute("apass").toString();
        if (aname == null || apass == null || aname.equals("") || apass.equals("")) {
            out.println("<meta http-equiv='refresh' content='0;alogout' />");
        }
    } catch (Exception e) {
        out.println("<meta http-equiv='refresh' content='0;alogout' />");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    

    <style>
        /* General layout */
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
            justify-content: flex-start;
            align-items: center;
            padding: 60px 40px;
        }

        .top-buttons button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 10px 20px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .top-buttons button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Main heading */
        h1 {
            text-align: center;
            color: #333;
            font-size: 32px;
            margin-top: 80px;
            margin-bottom: 30px;
        }

        /* Filter form */
        form[action="Monthly.jsp"] {
            background: white;
            padding: 20px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            display: inline-block;
        }

        label {
            font-weight: 500;
            margin-right: 10px;
        }

        input[type="date"] {
            padding: 6px 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            margin-right: 10px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 8px 18px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Table design */
        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
        }

        caption {
            font-size: 20px;
            font-weight: bold;
            padding: 15px;
            color: #333;
        }

        th, td {
            text-align: center;
            padding: 14px;
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

        /* Total row styling */
        tfoot th {
            background-color: #f8f9fa;
            font-size: 18px;
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
            form[action="Monthly.jsp"] {
                width: 90%;
                text-align: center;
            }
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
    <!-- Back Button -->
    <!---<div class="top-buttons">
        <form action="graph.jsp" method="get">
            <button type="submit">Back</button>
        </form>
    </div>--->

    <!-- Title -->
    <h1>Monthly Income</h1>

    <!-- Filter Form -->
    <center>
        <form method="get" action="Monthly.jsp">
            <label>From: </label>
            <input type="date" name="fromDate">
            <label>To: </label>
            <input type="date" name="toDate">
            <input type="submit" value="Filter">
        </form>
    </center>

    <!-- Table -->
    <table>
        <caption>Products Purchased</caption>
        <thead>
            <tr>
                <th>SL.No</th>
                <th>Date</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price (Rs)</th>
            </tr>
        </thead>
        <tbody>
        <%
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");

            try {
                int slno = 0;
                double total = 0;

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = new dbconfig().getConnection();

                String query = "";
                PreparedStatement ps = null;

                if (fromDate != null && !fromDate.isEmpty() && toDate != null && !toDate.isEmpty()) {
                    query = "SELECT * FROM details WHERE DATE(date) BETWEEN ? AND ?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, fromDate);
                    ps.setString(2, toDate);
                } else if (fromDate != null && !fromDate.isEmpty()) {
                    query = "SELECT * FROM details WHERE DATE(date) = ?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, fromDate);
                } else if (toDate != null && !toDate.isEmpty()) {
                    query = "SELECT * FROM details WHERE DATE(date) = ?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, toDate);
                } else {
                    query = "SELECT * FROM details";
                    ps = con.prepareStatement(query);
                }

                ResultSet res = ps.executeQuery();
                while (res.next()) {
                    slno++;
                    String date = res.getString("date");
                    String name = res.getString("name");
                    String quality = res.getString("quality");
                    double price = res.getDouble("price");
                    total += price;

                    out.println("<tr>");
                    out.println("<td>" + slno + "</td>");
                    out.println("<td>" + date + "</td>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + quality + "</td>");
                    out.println("<td>" + price + "</td>");
                    out.println("</tr>");
                }

                out.println("<tfoot><tr><th colspan='4'>Total Amount</th><th>" + total + "</th></tr></tfoot>");

                res.close();
                ps.close();
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='5'>Error: " + e + "</td></tr>");
            }
        %>
        </tbody>
    </table>

</body>
</html>
