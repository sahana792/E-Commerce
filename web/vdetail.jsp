<%@page import="database.dbconfig"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product Views</title>
</head>
<body>
<center>
    <h1>Product Views</h1>
    <table border="2">
        <caption>Purchased Information</caption>
        <thead>
            <tr>
                <th>SL.no</th>
                <th>Name</th>
                <th>Quality</th>
                <th>Price</th>
                <th>Date</th> <!-- New column -->
                <th>Time</td>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    int slno = 0;
                    String id = request.getParameter("id");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = new dbconfig().getConnection();
                    Statement stat = con.createStatement();
                    ResultSet res = stat.executeQuery("SELECT * FROM `details` WHERE `productid`='" + id + "'");

                    while (res.next()) {
                        slno++;
                        String name = res.getString("name");
                        String quality = res.getString("quality");
                        String price = res.getString("price");
                        String date = res.getString("date");
                        String time=res.getString("time");

                        out.println("<tr>");
                        out.println("<td>" + slno + "</td>");
                        out.println("<td>" + name + "</td>");
                        out.println("<td>" + quality + "</td>");
                        out.println("<td>" + price + "</td>");
                        out.println("<td>" + date + "</td>");
                        out.println("<td>" + time + "</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </tbody>
    </table>
</center>
</body>
</html>
