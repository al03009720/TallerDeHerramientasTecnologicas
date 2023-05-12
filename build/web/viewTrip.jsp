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
    <body style="margin: 0 auto ;padding: 0; height:100vh">
        <div style="width: 100%; height:10%; background-color: #DDCCFC;">
            <div style="float:left;width: 10%; height:100%; color:black; justify-content: center">
                <form action="back">
                    <%
                    String uid = request.getAttribute("uid").toString();
                    out.print("<input type=\"hidden\" name=\"uid\" value=\""+ uid +"\">");
                    %>
                    <input style="width:50px; height:50px; margin-left: 25px; margin-top: 25px; cursor: pointer" alt="back" src="https://cdn.iconscout.com/icon/free/png-256/free-back-arrow-1767523-1502427.png" type="image">
                </form>
            </div>
            <div style="float:left;width: 90%; height:100%; color:black; justify-content: center">
                <h1 style="margin-left:35%;">Detalle de viaje</h1>
            </div>   
        </div>
        <div style="width:95%; margin:auto; ">
            <%
                Connection con = DatabaseConnection.initializeDatabase();
                uid = request.getAttribute("uid").toString();
                String tid = request.getAttribute("tid").toString();
                PreparedStatement ps = con.prepareStatement ("SELECT * FROM \"public\".\"Trips\" where \"id\" = " + tid);
                ResultSet rs = ps.executeQuery ();
                ResultSetMetaData rsmd = rs.getMetaData (); 
                String destination = "";
                String date = "";
                Double budget = 0.0;
                Double expenses = 0.0;
                con.close();
                while (rs.next ())
                {
                out.print("<div style=\"float:left; width: 60%\">");
                    out.print("<h1>Tu viaje a " + rs.getString(2) + " el " + rs.getString(6) +":</h1>");
                out.print("</div>");  
                out.print("<div style=\"float:left; width: 20%\">");
                    out.print("<form action=\"editTrip\">");
                        out.print("<input type=\"hidden\" name=\"destination\" value=\""+ destination +"\">");
                        out.print("<input type=\"hidden\" name=\"date\" value=\""+ date +"\">");
                        out.print("<input type=\"hidden\" name=\"budget\" value=\""+ budget +"\">");
                        out.print("<input type=\"hidden\" name=\"expenses\" value=\""+ expenses +"\">");
                        out.print("<input type=\"hidden\" name=\"uid\" value=\""+ uid +"\">");
                        out.print("<input type=\"hidden\" name=\"tid\" value=\""+ tid +"\">");
                        out.print("<input style=\"cursor: pointer; margin-top:25px; text-align: center; border-radius: 5px; width:80%; padding:6px; background-color: #7136BF; color:white; padding-left:15px; padding-right:15px; padding-left:5px; padding-left:5px\" type=\"submit\" value=\"Editar viaje\">");
                    out.print("</form>");
                out.print("</div>");
                out.print("<div style=\"float:left; width: 20%\">");
                    out.print("<form action=\"deleteTrip\">");
                        out.print("<input type=\"hidden\" name=\"uid\" value=\""+ uid +"\">");
                        out.print("<input type=\"hidden\" name=\"tid\" value=\""+ tid +"\">");
                        out.print("<input style=\"cursor: pointer; margin-top:25px; text-align: center; border-radius: 5px; width:80%; padding:6px; background-color: #E3655B; color:black; padding-left:15px; padding-right:15px; padding-left:5px; padding-left:5px\" type=\"submit\" value=\"Eliminar viaje\">");
                    out.print("</form>");
                out.print("</div>");
                
                out.print("<table border = \"1\" width = \"100%\">");
                destination = rs.getString(2);
                date = rs.getString(6);
                budget = rs.getDouble(3);
                expenses = rs.getDouble(4);
            out.print ("<tr>");
                out.print ("<th>Destino</th>");
                out.print ("<th>Fecha</th>");
                out.print ("<th>Presupuesto</th>");
                out.print ("<th>Gastos Actuales</th>");
                out.print ("<th>Presupuesto restante</th>");
                out.print ("<th>Porcentaje de presupuesto restante</th>");
            out.print ("</tr>");
                    out.print ("<tr>");
                    out.print ("<td style=\"padding-left:5px\">"+rs.getString(2)+"</td>");
                    out.print ("<td style=\"padding-left:5px\">"+rs.getString(6)+"</td>");
                    out.print ("<td style=\"padding-left:5px\">$"+rs.getDouble(3)+"</td>");
                    out.print ("<td style=\"padding-left:5px\">$"+rs.getDouble(4)+"</td>");
                    out.print ("<td style=\"padding-left:5px\">$"+(rs.getDouble(3) - rs.getDouble(4))+"</td>");
                    out.print ("<td style=\"padding-left:5px\">"+((1-rs.getDouble(4)/rs.getDouble(3))*100)+"%</td>");
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

            <div style="float:left; width: 80%">
                <h1>Tus gastos asociados a este viaje:</h1>
            </div>
            <div style="float:left; width: 20%">
                <form action="addExpense">
                    <%
                        out.print("<input type=\"hidden\" name=\"uid\" value=\""+ uid +"\">");
                        out.print("<input type=\"hidden\" name=\"tid\" value=\""+ tid +"\">");
                    %>
                    <input style="cursor: pointer; margin-top:25px; text-align: center; border-radius: 5px; width:80%; padding:6px; background-color: #7136BF; color:white; padding-left:15px; padding-right:15px; padding-left:5px; padding-left:5px" type="submit" value="Agregar gasto">
                </form>
            </div>
            <%
                out.print("<table border = \"1\" width = \"100%\">");
            %>
            <tr>     
                <th>Categoria</th>
                <th>Fecha</th>
                <th>Cantidad</th>
            </tr>
            <%
                while (rs2.next ())
                {
                    out.print ("<tr>");
                    out.print ("<td style=\"padding-left:5px\">"+rs2.getString(5)+"</td>");
                    out.print ("<td style=\"padding-left:5px\">"+rs2.getString(6)+"</td>");
                    out.print ("<td style=\"padding-left:5px\">$"+rs2.getDouble(4)+"</td>");
                    out.print ("</tr>");
                }
            %>
        </table>
        </div>
    </body>
</html>
