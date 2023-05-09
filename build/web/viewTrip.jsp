<%-- 
    Document   : overview
    Created on : 9 may 2023, 1:28:10
    Author     : USER
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "connections.DatabaseConnection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
                Connection con = DatabaseConnection.initializeDatabase();
                String uid = request.getAttribute("uid").toString();
                String tid = request.getAttribute("tid").toString();
                PreparedStatement ps = con.prepareStatement ("SELECT * FROM \"public\".\"Trips\" where \"id\" = " + tid);
                ResultSet rs = ps.executeQuery ();
                ResultSetMetaData rsmd = rs.getMetaData (); 
                con.close();
                while (rs.next ())
                {
                out.print("<h1>Tu viaje a " + rs.getString(2) + " el " + rs.getString(6) +":</h1>");
                   
                out.print("<table border = \"1\" width = \"100%\">");
                
            out.print ("<tr>");
                out.print ("<th>Destino</th>");
                out.print ("<th>Fecha</th>");
                out.print ("<th>Presupuesto</th>");
                out.print ("<th>Gastos Actuales</th>");
                out.print ("<th>Presupuesto restante</th>");
            out.print ("</tr>");
                    out.print ("<tr>");
                    out.print ("<td>"+rs.getString(2)+"</td>");
                    out.print ("<td>"+rs.getString(6)+"</td>");
                    out.print ("<td>"+rs.getDouble(3)+"</td>");
                    out.print ("<td>"+rs.getDouble(4)+"</td>");
                    out.print ("<td>"+((1-rs.getDouble(4)/rs.getDouble(3))*100)+"%</td>");
                    out.print ("</tr>");
                }
            %>
        </table>
            <%
                Connection con2 = DatabaseConnection.initializeDatabase();
                PreparedStatement ps2 = con2.prepareStatement ("SELECT * FROM \"public\".\"Expense\" where \"tripId\" = " + tid + " AND \"userId\" = " + uid);
                ResultSet rs2 = ps2.executeQuery ();
                ResultSetMetaData rsmd2 = rs2.getMetaData (); 
                con2.close();
            %>

            <h1>Tus gastos asociados a este viaje:</h1>
            <%
                out.print("<table border = \"1\" width = \"100%\">");
            %>
            <tr>
                <th>Cantidad</th>
                <th>Categoria</th>
                <th>Fecha</th>
            </tr>
            <%
                while (rs2.next ())
                {
                    out.print ("<tr>");
                    out.print ("<td>"+rs2.getDouble(4)+"</td>");
                    out.print ("<td>"+rs2.getString(5)+"</td>");
                    out.print ("<td>"+rs2.getString(6)+"</td>");
                    out.print ("</tr>");
                }
            %>
        </table>
    </body>
</html>
