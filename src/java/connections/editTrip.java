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
public class editTrip extends HttpServlet {
    
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType ("text/html");
        String uid = request.getParameter("uid");
        request.setAttribute("uid",uid);
        String tid = request.getParameter("tid");
        request.setAttribute("tid",tid);
        String destino = request.getParameter("destination");
        request.setAttribute("destination",destino);
        String fecha = request.getParameter("date");
        request.setAttribute("date",fecha);
        String presupuesto = request.getParameter("budget");
        request.setAttribute("budget",presupuesto);
        String gastos = request.getParameter("expenses");
        request.setAttribute("expenses",gastos);
        request.getRequestDispatcher("./editTrip.jsp").forward(request,response);
    }
    
}
