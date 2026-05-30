<%-- 
    Document   : buy
    Created on : 29 Sep, 2025, 6:27:19 PM
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
        <style>
            /* === Page Background === */
body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #74ebd5, #9face6);
    margin: 0;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 20px;
}

/* === Container for the form === */
.center-container {
    background-color: white;
    padding: 40px 50px;
    border-radius: 15px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.25);
    text-align: center;
    width: 400px;
    max-width: 90%;
}

/* === Heading === */
h1 {
    color: #333;
    font-size: 28px;
    margin-bottom: 25px;
    text-transform: uppercase;
}

/* === Labels === */
label {
    display: block;
    text-align: left;
    color: #555;
    font-weight: 500;
    margin-top: 15px;
    margin-bottom: 5px;
}

/* === Inputs === */
input[type="text"], 
input[type="number"] {
    width: 100%;
    padding: 10px;
    border: 1.5px solid #ccc;
    border-radius: 8px;
    margin-bottom: 10px;
    outline: none;
    transition: border-color 0.3s;
}

input[type="text"]:focus, 
input[type="number"]:focus {
    border-color: #6c63ff;
}

/* === Buttons === */
button, input[type="submit"] {
    background-color: #6c63ff;
    color: white;
    border: none;
    border-radius: 8px;
    padding: 12px 25px;
    font-size: 16px;
    cursor: pointer;
    margin-top: 20px;
    transition: background-color 0.3s, transform 0.2s;
}

button:hover, input[type="submit"]:hover {
    background-color: #5548d0;
    transform: scale(1.05);
}

/* === Back Button Top Left === */
.top-left {
    position: absolute;
    top: 50px;
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
         <%
            String id=request.getParameter("id");
               String name=null;
               String price=null;
               String quality=null;
              
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=new dbconfig().getConnection();
           Statement stat=con.createStatement();
           ResultSet res=stat.executeQuery("SELECT * FROM `product` where `id`='"+id+"'");
           while(res.next())
           {
               name=res.getString("name");
               price=res.getString("price");
               quality=res.getString("quality");
               
               //out.println("<tr><td>"+name+"</td><td>"+quality+"</td><td>"+price+"</td><td>"+description+"</td><td><a  href='prodel?id="+regno+"'>Delete</a></td><td><a href='update.jsp?id="+quality+"'>Update</a></td></tr>");
           }
                }
                catch(Exception e)
                {
                  out.println(e);
                }
        %>
    <center>
        
        <body>

    <div class="top-left">
        <form action="pbview.jsp" method="get">
            <button type="submit">Back</button>
        </form>
    </div>

    <div class="center-container">
        <h1>Buy Products</h1>
        <form action="cbuy.jsp?id=<%=id %>" method="POST">
            <label>Products</label>
            <input type="text" placeholder="Enter name" value="<%=name %>" name="name" required>

            <label>Price</label>
            <input type="text" placeholder="Enter price" value="<%=price %>" name="price" required>

            <label>Quality</label>
            <input type="number" placeholder="Enter quality" max="<%=quality %>" name="quality" required>

            <button type="submit">Buy</button>
        </form>
    </div>

</body>
</html>
