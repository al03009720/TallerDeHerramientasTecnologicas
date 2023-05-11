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
    <body style="margin: 0 ;padding: 0">
        <form action="addTrip">
            <div style="float:left; width:30%; height: 100vh;">
                <img style="width:50px; height:50px; margin-left: 25px; margin-top: 25px; cursor: pointer" onclick="history.back()" src="https://cdn.iconscout.com/icon/free/png-256/free-back-arrow-1767523-1502427.png" alt="Back">
                <div style=" width:50%; margin:auto; margin-top:40%">
                    <h1>Nuevo Viaje</h1>
                    <span>Destino:</span>:<br>
                    <input type="text" name="destination" value="" style=" width:95%; margin-bottom: 24px; padding:6px;"><br>
                    <span>Fecha:</span><br>
                    <input type="text" name="date" value="" style=" width:95%; margin-bottom: 24px; padding:6px;"><br>
                    <span>Presupuesto:</span><br>
                    <input type="text" name="budget" value="" style=" width:95%; margin-bottom: 24px; padding:6px;"><br>
                    <%
                        String uid = request.getAttribute("uid").toString();
                        out.print("<input type=\"hidden\" name=\"userId\" value=\""+ uid +"\"><br>");
                    %>
                    <input type="submit" value="Guardar viaje" style="cursor: pointer; text-align: center; border-radius: 5px; width:100%; padding:6px; background-color: #7136BF; color:white; padding-left:15px; padding-right:15px; padding-left:5px; padding-left:5px">
                </div>
            </div>
            <div style="float:left; width:70%; height: 100vh; background-color: #DDCCFC;">
                <img style="margin-top:7%;margin-left:25%; width:50%" src="https://freesvg.org/img/air6.png" alt="Manejador de viaticos">
            </div>
        </form>
    </body>
</html>
