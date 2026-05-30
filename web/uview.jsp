<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="database.dbconfig"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Details</title>
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
    padding-top: 40px;
}

/* === Center Container === */
.center-container {
    background-color: white;
    padding: 40px 50px;
    border-radius: 15px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.25);
    text-align: center;
    min-width: 700px;
    max-width: 95%;
}

/* === Heading === */
h1 {
    color: #333;
    font-size: 28px;
    margin-bottom: 30px;
    text-transform: uppercase;
}

/* === Table Styling === */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
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

/* === Back Button Top Left === */
.top-left {
    position: absolute;
    top: 60px;
    left: 20px;
}

.top-left button {
    background-color: #444;
    font-size: 14px;
    padding: 8px 18px;
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

    </style>
</head>
<body>
<%
    HttpSession hs = request.getSession(false); // don't create new session
    String uphono = null;
    String upass = null;
    try {
        if (hs != null) {
            uphono = (String) hs.getAttribute("uphono");
            upass = (String) hs.getAttribute("upass");
        }
        if (uphono == null || upass == null || uphono.isEmpty() || upass.isEmpty()) {
            out.println("<meta http-equiv='refresh' content='0;url=ulogout.jsp' />");
        } else {
%>
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
 <div class="top-left">
        <form action="pbview.jsp" method="get">
            <button type="submit">Back</button>
        </form>
    </div>
<center>
<h1>User Details</h1>
<table border="2">
    <caption>User Information</caption>
    <thead>
        <tr>
            <th>SL.no</th>
            <th>Name</th>
            <th>Description</th>
            <th>Quantity</th>
            <th>Price </th>
            <th>Date</th>
            <th>Time</th>
            <th>Total Amount</th>
        </tr>
    </thead>
    <tbody>
<%
            int slno = 0;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = new dbconfig().getConnection();
            Statement stat = con.createStatement();
            ResultSet res = stat.executeQuery("SELECT * FROM `details` WHERE `phono`='" + uphono + "'");
            while (res.next()) {
                slno++;
                String productid = res.getString("productid");
                String quantity = res.getString("quality");
                String price = res.getString("price");
                
                // Handle date safely - retrieve as String instead of Date
                String date = "";
                try {
                    date = res.getString("date");
                    if (date == null || date.equals("0000-00-00")) {
                        date = "N/A";
                    }
                } catch (Exception ex) {
                    date = "N/A";
                }
                
                // Handle time safely
                String time = "";
                try {
                    time = res.getString("time");
                    if (time == null || time.isEmpty()) {
                        time = "N/A";
                    }
                } catch (Exception ex) {
                    time = "N/A";
                }
                
                int total = Integer.parseInt(quantity) * Integer.parseInt(price);
                Statement stat1 = con.createStatement();
                ResultSet res1 = stat1.executeQuery("SELECT * FROM `product` WHERE `id`='" + productid + "'");
                while (res1.next()) {
                    String pname = res1.getString("name");
                    String description = res1.getString("description");
                    out.println("<tr>");
                    out.println("<td>" + slno + "</td>");
                    out.println("<td>" + pname + "</td>");
                    out.println("<td>" + description + "</td>");
                    out.println("<td>" + quantity + "</td>");
                    out.println("<td>" + price + "</td>");
                    out.println("<td>" + date + "</td>");
                    out.println("<td>" + time + "</td>");
                    out.println("<td>" + total + "</td>");
                    out.println("</tr>");
                }
                res1.close();
                stat1.close();
            }
            res.close();
            stat.close();
            con.close();
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
    </tbody>
</table>
</center>
</body>
</html>