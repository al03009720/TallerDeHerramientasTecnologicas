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
public class updateTrip extends HttpServlet {
    
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType ("text/html");
        String userid = request.getParameter("userId");
        String tripid = request.getParameter("tripId");
        String destino = request.getParameter("destination");
        String fecha = request.getParameter("date");
        String gastos = request.getParameter("expenses");
        String presupuesto = request.getParameter("budget");
        PrintWriter out = response.getWriter ();
        try
        {
            Connection con = DatabaseConnection.initializeDatabase();
            
            PreparedStatement ps = con.prepareStatement ("UPDATE \"public\".\"Trips\" SET id="+tripid+", destination=\'"+destino+"\', budget="+presupuesto+", \"totalExpenses\"="+gastos+",\"userdId\"="+userid+", date=\'"+fecha+"\' WHERE id="+tripid);
            Integer ei = ps.executeUpdate ();
            con.close();
            request.setAttribute("uid",userid);
            request.setAttribute("tid",tripid);
            request.getRequestDispatcher("./viewTrip.jsp").forward(request,response);
            out.close ();
        }
        catch (Exception e2)
        {
            out.print ("<div>Error connecting  ");
            out.print(e2);
            e2.printStackTrace();
            out.print ("</div>");
        }
    }
    
}
