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
        <form action="createExpense">
            <h1>Nuevo Gasto</h1><br>
            categoria:<br>
            <input type="text" name="category" value=""><br>
            Fecha:<br>
            <input type="text" name="date" value=""><br>
            Cantidad gastada:<br>
            <input type="text" name="expense" value=""><br>
            <%
                String uid = request.getAttribute("uid").toString();
                out.print("<input type=\"hidden\" name=\"userId\" value=\""+ uid +"\">");
                String tid = request.getAttribute("tid").toString();
                out.print("<input type=\"hidden\" name=\"tripId\" value=\""+ tid +"\">");
            %>
            <input type="submit" value="Guardar viaje">
        </form>
    </body>
</html>
