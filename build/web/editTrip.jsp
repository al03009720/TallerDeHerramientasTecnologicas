<%-- 
    Document   : newTrip
    Created on : 9 may 2023, 0:41:07
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
        <form action="updateTrip">
            <%
                String uid = request.getAttribute("uid").toString();
                String tid = request.getAttribute("tid").toString();
                String destino = request.getAttribute("destination").toString();
                String fecha = request.getAttribute("date").toString();
                String presupuesto = request.getAttribute("budget").toString();
                String gastos = request.getAttribute("expenses").toString();
                out.print("<input type=\"hidden\" name=\"userId\" value=\""+ uid +"\"><br>");
                out.print("<input type=\"hidden\" name=\"tripId\" value=\""+ tid +"\"><br>");
                out.print("<input type=\"hidden\" name=\"expenses\" value=\""+ gastos +"\"><br>");
            %>
            <h1>Editar Viaje</h1><br>
            Destino:<br>
            <%out.print("<input type=\"text\" name=\"destination\" value=\""+ destino +"\"><br>");%>
            Fecha:<br>
            <%out.print("<input type=\"text\" name=\"date\" value=\""+ fecha +"\"><br>");%>
            Presupuesto:<br>
            <%out.print("<input type=\"text\" name=\"budget\" value=\""+ presupuesto +"\"><br>");%>
            <input type="submit" value="Actualizar viaje">
        </form>
    </body>
</html>
