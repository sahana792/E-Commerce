import database.dbconfig;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class vdetaildb extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession hs = request.getSession();
        String uphono = null;
        String upass = null;

        try {
            uphono = hs.getAttribute("uphono").toString();
            upass = hs.getAttribute("upass").toString();

            if (uphono == null || upass == null || uphono.equals("") || upass.equals("")) {
                out.println("<meta http-equiv='refresh' content='0;ulogout' />");
                return;
            }
        } catch (Exception e) {
            out.println("<meta http-equiv='refresh' content='0;ulogout' />");
            return;
        }

        try {
            String productid = request.getParameter("id");
            String name = request.getParameter("name");
            String quality = request.getParameter("quality");
            String price = request.getParameter("price");
            int qun = Integer.parseInt(quality);

            // ✅ Get current date and time
            LocalDate currentDate = LocalDate.now();
            LocalTime currentTime = LocalTime.now();
            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
            String formattedTime = currentTime.format(timeFormatter);

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = new dbconfig().getConnection();
            Statement stat = con.createStatement();

            // ✅ Insert into details with date and time
            String sql = "INSERT INTO `details`(`phono`, `productid`, `name`, `quality`, `price`, `date`, `time`) " +
                         "VALUES ('" + uphono + "', '" + productid + "', '" + name + "', '" + quality + "', '" + price + "', '" + currentDate + "', '" + formattedTime + "')";
            stat.executeUpdate(sql);

            // ✅ Get old quantity from product table
            int oldqun = 0;
            Statement stat1 = con.createStatement();
            ResultSet res = stat1.executeQuery("SELECT `quality` FROM `product` WHERE `id`='" + productid + "'");
            if (res.next()) {
                oldqun = Integer.parseInt(res.getString("quality"));
            }

            int lastqun = oldqun - qun;

            // ✅ Update product quantity
            Statement stat2 = con.createStatement();
            stat2.executeUpdate("UPDATE `product` SET `quality`='" + lastqun + "' WHERE `id`='" + productid + "'");

            // ✅ Update user name (optional)
            Statement stat3 = con.createStatement();
            stat3.executeUpdate("UPDATE `user` SET `name`='" + name + "' WHERE `phono`='" + uphono + "'");

            out.print("<script>alert('Details updated successfully');</script>");
            out.println("<meta http-equiv='refresh' content='0;url=pbview.jsp' />");

            // ✅ Close resources
            res.close();
            stat.close();
            stat1.close();
            stat2.close();
            stat3.close();
            con.close();

        } catch (Exception e) {
            out.print("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles product detail insertions including date and time";
    }
}
