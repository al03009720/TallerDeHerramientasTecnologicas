/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package pages;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import connections.DatabaseConnection;

/**
 *
 * @author USER
 */
@WebServlet(name = "overview", urlPatterns = {"/overview"})
public class overview extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    public void seeDetail(HttpServletRequest request, HttpServletResponse response, String uid, String tid) throws ServletException, IOException{
        request.setAttribute("uid",uid);
        request.setAttribute("tid",tid);
        request.getRequestDispatcher("./tripDetail").forward(request,response);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet overview</title>");            
            out.println("</head>");
            out.println("<body>");
            try
            {
            Connection con = DatabaseConnection.initializeDatabase();
            String uid = request.getAttribute("uid").toString();
            PreparedStatement ps = con.prepareStatement ("SELECT * FROM \"public\".\"Trips\" where \"userdId\" = " + uid);
            ResultSet rs = ps.executeQuery ();
            ResultSetMetaData rsmd = rs.getMetaData ();
            con.close();
            
            out.println("<h1>Tus viajes:</h1><table><tr><th>Destino</th><th>Fecha</th><th>Presupuesto</th><th>Gastos Actuales</th><th>Presupuesto restante</th><th>Ver detalle</th></tr>");
            
            while (rs.next ())
            {
                out.print ("<tr>");
                out.print ("<td>"+rs.getString(2)+"</td>");
                out.print ("<td>"+rs.getString(6)+"</td>");
                out.print ("<td>"+rs.getDouble(3)+"</td>");
                out.print ("<td>"+rs.getDouble(4)+"</td>");
                out.print ("<td>"+((1-rs.getDouble(4)/rs.getDouble(3))*100)+"%</td>");
                out.print ("<td><button>detalle</button></td>");
                out.print ("</tr>>");
            }
            
            out.println("</body>");
            out.println("</html>");
            }
            catch (Exception e2){
            out.println("<div>DB error</div>");
            out.println("</body>");
            out.println("</html>");
            }
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
