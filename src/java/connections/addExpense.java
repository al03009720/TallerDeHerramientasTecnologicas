/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connections;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import connections.DatabaseConnection;

/**
 *
 * @author USER
 */
public class addExpense extends HttpServlet {
    
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType ("text/html");
        String uid = request.getParameter("uid");
        request.setAttribute("uid",uid);
        String tid = request.getParameter("tid");
        request.setAttribute("tid",tid);
        request.getRequestDispatcher("./newExpense.jsp").forward(request,response);
    }
    
}
