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
public class createExpense extends HttpServlet {
    
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType ("text/html");
        String userid = request.getParameter("userId");
        String tripid = request.getParameter("tripId");
        String categoria = request.getParameter("category");
        String fecha = request.getParameter("date");
        String gasto = request.getParameter("expense");
        PrintWriter out = response.getWriter ();
        try
        {
            Connection con = DatabaseConnection.initializeDatabase();
            
            PreparedStatement qps = con.prepareStatement ("SELECT * FROM \"public\".\"Expense\"");
            ResultSet qrs = qps.executeQuery ();
            ResultSetMetaData qrsmd = qrs.getMetaData ();
            Integer qlength = 2;
            while(qrs.next ()){
                qlength++;
            }
            PreparedStatement tps = con.prepareStatement ("SELECT * FROM \"public\".\"Trips\" where id="+tripid);
            ResultSet trs = tps.executeQuery ();
            ResultSetMetaData trsmd = trs.getMetaData ();
            Double gastoTotal = 0.0;
            while(trs.next ()){
                gastoTotal = trs.getDouble(4) + Double.parseDouble(gasto);
            }
            
            PreparedStatement ups = con.prepareStatement ("UPDATE \"public\".\"Trips\" SET \"totalExpenses\"="+gastoTotal+" WHERE id="+tripid);
            Integer uei = ups.executeUpdate ();
            
            PreparedStatement ps = con.prepareStatement ("INSERT INTO \"public\".\"Expense\" (id,\"userId\",\"tripId\",amount,category,date) VALUES (" + qlength +","+ userid+ "," +tripid+ "," +gasto+",\'" +categoria+"\',\'" + fecha +"\')");
            Integer ei = ps.executeUpdate ();
            con.close();
            request.setAttribute("uid",userid);
            request.setAttribute("tid",tripid);
            request.getRequestDispatcher("/viewTrip.jsp").forward(request,response);
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
