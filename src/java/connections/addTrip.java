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
public class addTrip extends HttpServlet {
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType ("text/html");
        String userid = request.getParameter("userId");
        String destino = request.getParameter("destination");
        String fecha = request.getParameter("date");
        String presupuesto = request.getParameter("budget");
        PrintWriter out = response.getWriter ();
        try
        {
            Connection con = DatabaseConnection.initializeDatabase();
            
            PreparedStatement qps = con.prepareStatement ("SELECT * FROM \"public\".\"Trips\"");
            ResultSet qrs = qps.executeQuery ();
            ResultSetMetaData qrsmd = qrs.getMetaData ();
            Integer qlength = 2;
            while(qrs.next ()){
                qlength++;
            }
            PreparedStatement ps = con.prepareStatement ("INSERT INTO \"public\".\"Trips\" (id,date,destination,budget,\"totalExpenses\",\"userdId\") VALUES (" + qlength + ",\'" + fecha + "\',\'"+destino+"\',"+ presupuesto + ",0,"+ userid +")");
            Integer ei = ps.executeUpdate ();
            con.close();
            out.close ();
            request.getRequestDispatcher("./overviewView.jsp").forward(request,response);
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
