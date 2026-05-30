<%-- 
    Document   : update
    Created on : 29 Sep, 2025, 5:40:02 PM
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
        <title>JSP Page</title>
    </head>
     <body>
        <h1>Update page</h1>
        <%
            String id=request.getParameter("id");
               String name=null;
               String quality=null;
               String price=null;
               String description=null;
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=new dbconfig().getConnection();
           Statement stat=con.createStatement();
           ResultSet res=stat.executeQuery("SELECT * FROM `product` where `quality`='"+id+"'");
           while(res.next())
           {
               name=res.getString("name");
               quality=res.getString("quality");
               price=res.getString("price");
               description=res.getString("description");
               //out.println("<tr><td>"+name+"</td><td>"+quality+"</td><td>"+price+"</td><td>"+description+"</td><td><a  href='prodel?id="+regno+"'>Delete</a></td><td><a href='update.jsp?id="+quality+"'>Update</a></td></tr>");
           }
                }
                catch(Exception e)
                {
                  out.println(e);
                }
        %>    
        <center>
        <form action="updatedb?id=<% out.print(id); %>" method="POST">
            <h1>Update Products</h1>
            <label>Products</label>
        <input type="text" placeholder="Enter name" value="<% out.print(name); %>"name="name" required><br><br>
        <label>Quality</label>
        <input type="text" placeholder="Enter quality" value="<% out.print(quality); %>"name="quality" required><br><br>
        <label>Price</label>
        <input type="text" placeholder="Enter price" value="<% out.print(price); %>"name="price" required><br><br>
        <label>Description</label>
        <input type="text" placeholder="Enter description" value="<% out.print(description); %>"name="description" required><br><br>
        <input type="submit" value="Submit">
        </form>
        <a href="add.jsp"></a>
        </center>
    </body>
</html>
