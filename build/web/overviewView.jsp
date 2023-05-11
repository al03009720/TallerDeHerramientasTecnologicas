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
            <div style="float:left;width: 90%; height:100%; color:black; justify-content: center">
                <h1 style="margin-left:50%;">Manejador de viajes</h1>
            </div>
            <div style="float:left;width: 10%; height:100%; color:black; justify-content: center">
                <a href="./">
                    <div style="display: inline-block; margin-top: 15%; text-align: center; border-radius: 5px; width:80%; padding:6px; background-color: #7136BF; color:white; padding-left:15px; padding-right:15px; padding-left:5px; padding-left:5px">Log out</div>
                </a>
            </div>
            
        </div>
         <%
            Connection con = DatabaseConnection.initializeDatabase();
            String uid = request.getAttribute("uid").toString();
            PreparedStatement ps = con.prepareStatement ("SELECT * FROM \"public\".\"Trips\" where \"userdId\" = " + uid);
            ResultSet rs = ps.executeQuery ();
            ResultSetMetaData rsmd = rs.getMetaData (); 
            con.close();
        %>
        
        <%
            Connection con2 = DatabaseConnection.initializeDatabase();
            uid = request.getAttribute("uid").toString();
            PreparedStatement ps2 = con2.prepareStatement ("SELECT * FROM \"public\".\"Expense\" where \"userId\" = " + uid);
            ResultSet rs2 = ps2.executeQuery ();
            ResultSetMetaData rsmd2 = rs2.getMetaData (); 
            con2.close();
        %>
            
        <div style="width: 95%; height:90%; margin:auto">
            <div style="float:left; width:49%; height: 100%;">
                <div style="width: 100%; height:10%;">
                    <div style="float:left;width: 75%; height:100%; color:black; justify-content: center">
                        <h1 style="margin-left:50%;">Tus viajes:</h1>
                    </div>
                    <div style="float:left;width: 25%; height:100%; color:black; justify-content: center">
                        <form action="newTrip">
                            <%
                                out.print("<input type=\"hidden\" name=\"uid\" value=\""+ uid +"\">");
                            %>
                            <input style="cursor: pointer; display: inline-block; margin-top: 10%; text-align: center; border-radius: 5px; width:80%; padding:6px; background-color: #7136BF; color:white; padding-left:15px; padding-right:15px; padding-left:5px; padding-left:5px" type="submit" value="Nuevo viaje">
                        </form>
                    </div>

                </div>
                
                <%
                    out.print("<table border = \"1\" width = \"100%\">");
                %>
                <tr>
                    <th>Destino</th>
                    <th>Fecha</th>
                    <th>Presupuesto</th>
                    <th>Gastos Actuales</th>
                    <th>Ver detalle</th>
                </tr>
                <%
                    while (rs.next ())
                    {
                        out.print ("<form action=\"viewTrip\">");
                        out.print("<input type=\"hidden\" name=\"userId\" value=\""+ rs.getInt(5) +"\">");
                        out.print("<input type=\"hidden\" name=\"tripId\" value=\""+ rs.getInt(1) +"\">");
                        out.print ("<tr>");
                        out.print ("<td style=\"padding-left:5px\">"+rs.getString(2)+"</td>");
                        out.print ("<td style=\"padding-left:5px\">"+rs.getString(6)+"</td>");
                        out.print ("<td style=\"padding-left:5px\">$"+rs.getDouble(3)+"</td>");
                        out.print ("<td style=\"padding-left:5px\">$"+rs.getDouble(4)+"</td>");
                        out.print ("<td style=\"text-align:center\"><input style=\"cursor: pointer; text-align: center; width:100%; padding:6px; background-color: #DDCCFC; color:black; padding-left:15px; padding-right:15px; padding-left:5px; padding-left:5px\" type=\"submit\" value=\"Ver detalle\"></td>");
                        out.print ("</tr>");
                        out.print ("</form>");
                    }
                %>
            </table>
                
            </div>
            
            <div style="float:left; width:2%; height: 100%;">
                <div style="background-color: #DDCCFC; width: 1px; height: 100%; margin-left:50%;; ">
                    
                </div>
            </div>
            
            <div style="float:left; width:49%; height: 100%;">
                <div style="width: 100%; height:10%;">
                    <div style="float:left;width: 100%; height:100%; color:black; justify-content: center">
                        <h1 style="margin-left:35%;">Tu historial de gastos:</h1>
                    </div>
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
        </div>     
    </body>
</html>
