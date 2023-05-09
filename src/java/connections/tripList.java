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
public class tripList extends HttpServlet {
    
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType ("text/html");
        String username = request.getParameter("user");
        String password = request.getParameter("pswd");
        Boolean found = false;
        PrintWriter out = response.getWriter ();
        try
        {
            Connection con = DatabaseConnection.initializeDatabase();
            try
            {
                PreparedStatement ps = con.prepareStatement ("SELECT * FROM \"public\".\"Users\"");
                ResultSet rs = ps.executeQuery ();
                ResultSetMetaData rsmd = rs.getMetaData ();
                con.close();
                while (rs.next ())
                {
                    out.print ("<div>");
                     out.print (rs.getString (2) + " " + username + " " + rs.getString(3) + " " + password);
                     out.print (rs.getString (2).equals(username) && rs.getString(3).equals(password));
                    out.print ("</div>");
                    if(rs.getString (2).equals(username) && rs.getString(3).equals(password)){
                        found = true;
                        request.setAttribute("uid",rs.getInt(1));
                        request.getRequestDispatcher("./overviewView.jsp").forward(request,response);
                    }
                }
                if(!found){
                    out.print ("<div> User not found   ");
                    out.print ("</div>");
                }
            }
            catch (Exception e2)
            {
                out.print ("<div>Error   ");
                out.print(e2);
                e2.printStackTrace();
                out.print ("</div>");
            }
            finally
            {
                out.close ();
            }
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
