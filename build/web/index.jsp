<%-- 
    Document   : index
    Created on : 8 may 2023, 0:41:34
    Author     : USER
--%>
<%@page import="java.util.Enumeration"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="margin: 0 ;padding: 0">
        <form action="login">
            <div style="float:left; width:30%; height: 100vh;">
                <div style=" width:50%; margin:auto; margin-top:50%">
                    <h1>Log In</h1>
                    <span>Usuario</span>:<br>
                    <input type="text" name="user" value="" style=" width:95%; margin-bottom: 24px; padding:6px;"><br>
                    <span>Contraseña:</span><br>
                    <input type="text" name="pswd" value="" style=" width:95%; margin-bottom: 24px; padding:6px;"><br>
                    <input type="submit" value="Log In" style="text-align: center; border-radius: 5px; width:100%; padding:6px; background-color: #7136BF; color:white; padding-left:15px; padding-right:15px; padding-left:5px; padding-left:5px">
                </div>
            </div>
            <div style="float:left; width:70%; height: 100vh; background-color: #DDCCFC;">
                <img style="margin-top:7%;margin-left:25%; width:50%" src="https://cdn.iconscout.com/icon/free/png-256/free-bill-3155195-2630864.png" alt="Manejador de viaticos">
            </div>
        </form>
    </body>
</html>
