/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import database.dbconfig;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class userlogindb extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String name=request.getParameter("name");
            String phono=request.getParameter("phono");
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            String cpass=request.getParameter("cpass");
           
           // out.print(name+" "+phono+" "+email+" "+pass+" "+cpass);
            
            if(pass.equals(cpass))
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=new dbconfig().getConnection();
                Statement stat=con.createStatement();
                stat.executeUpdate("INSERT INTO `user`(`name`, `phono`, `email`,`pass`) VALUES ('"+name+"','"+phono+"','"+email+"','"+pass+"')");
                out.print("<script>alert('Registered successfully')</script>"); 
                out.println("<meta http-equiv = \"refresh\" content = \"0;home.jsp\" />");
                
            }
            else
            {
                out.print("<script>alert('Confirm password doesnot match')</script>"); 
                out.println("<meta http-equiv = \"refresh\" content = \"0;userlogin.jsp\" />");
            } 
        
        }
        catch(Exception e)
        {
            out.print(e);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
