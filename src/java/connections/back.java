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
public class back extends HttpServlet {
    
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType ("text/html");
        String userid = request.getParameter("uid");
        request.setAttribute("uid",userid);
        request.getRequestDispatcher("./overviewView.jsp").forward(request,response);
    }
    
}
