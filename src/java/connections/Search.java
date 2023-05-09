package connections;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import connections.DatabaseConnection;

public class Search extends HttpServlet
{
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType ("text/html");
        PrintWriter out = response.getWriter ();
        try
        {
            Connection con = DatabaseConnection.initializeDatabase();
            try
            {
                PreparedStatement ps = con.prepareStatement ("SELECT * FROM \"public\".\"Users\"");
                out.print("<div>test</div>");
                out.print ("<table width=50% border=1>");
                out.print ("<caption>User Details:</caption>");
                ResultSet rs = ps.executeQuery ();

                /* Printing column names */
                out.print ("</br></br>");
                ResultSetMetaData rsmd = rs.getMetaData ();
                int total = rsmd.getColumnCount ();

                out.print ("<tr>");
                for (int i = 1; i <= total; i++)
             {
                 out.print ("<th>" + rsmd.getColumnName (i) + "</th>");
             }
                out.print ("</tr>");

                /* Printing result */
                while (rs.next ())
             {
                 out.print ("<tr><td>" + rs.getInt (1) + "</td><td>" +  rs.getString (2) + " </td><td>" + rs.getString (3) + "</td></tr>");
             }
                out.print ("</table>");
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