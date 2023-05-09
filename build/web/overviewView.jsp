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
                PreparedStatement ps = con.prepareStatement ("SELECT * FROM \"public\".\"Trips\" where \"userdId\" = " + uid);
                ResultSet rs = ps.executeQuery ();
                ResultSetMetaData rsmd = rs.getMetaData (); 
                con.close();
            %>

            <h1>Tus viajes:</h1>
            <%
                out.print("<table border = \"1\" width = \"100%\">");
            %>
            <tr>
                <th>Destino</th>
                <th>Fecha</th>
                <th>Presupuesto</th>
                <th>Gastos Actuales</th>
                <th>Presupuesto restante</th>
                <th>Ver detalle</th>
            </tr>
            <%
                while (rs.next ())
                {
                    out.print ("<form action=\"viewTrip\">");
                    out.print("<input type=\"hidden\" name=\"userId\" value=\""+ rs.getInt(5) +"\">");
                    out.print("<input type=\"hidden\" name=\"tripId\" value=\""+ rs.getInt(1) +"\">");
                    out.print ("<tr>");
                    out.print ("<td>"+rs.getString(2)+"</td>");
                    out.print ("<td>"+rs.getString(6)+"</td>");
                    out.print ("<td>"+rs.getDouble(3)+"</td>");
                    out.print ("<td>"+rs.getDouble(4)+"</td>");
                    out.print ("<td>"+((1-rs.getDouble(4)/rs.getDouble(3))*100)+"%</td>");
                    out.print ("<td><input type=\"submit\" value=\"Ver detalle\"></td>");
                    out.print ("</tr>");
                    out.print ("</form>");
                }
            %>
        </table>
        <form action="newTrip">
            <%
                out.print("<input type=\"hidden\" name=\"uid\" value=\""+ uid +"\"><br>");
            %>
            <input type="submit" value="Nuevo viaje">
        </form>
            
        <%
                Connection con2 = DatabaseConnection.initializeDatabase();
                uid = request.getAttribute("uid").toString();
                PreparedStatement ps2 = con2.prepareStatement ("SELECT * FROM \"public\".\"Expense\" where \"userId\" = " + uid);
                ResultSet rs2 = ps2.executeQuery ();
                ResultSetMetaData rsmd2 = rs2.getMetaData (); 
                con2.close();
            %>

            <h1>Tu historial de gastos:</h1>
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
