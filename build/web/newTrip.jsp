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
        <form action="addTrip">
            <h1>Nuevo Viaje</h1><br>
            Destino:<br>
            <input type="text" name="destination" value=""><br>
            Fecha:<br>
            <input type="text" name="date" value=""><br>
            Presupuesto:<br>
            <input type="text" name="budget" value=""><br>
            <%
                String uid = request.getAttribute("uid").toString();
                out.print("<input type=\"hidden\" name=\"userId\" value=\""+ uid +"\"><br>");
            %>
            <input type="submit" value="Guardar viaje">
        </form>
    </body>
</html>
