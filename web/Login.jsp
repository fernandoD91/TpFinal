<%-- 
    Document   : index
    Created on : 8 dic. 2021, 23:46:04
    Author     : DanielFernandoPosta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Debes Loguearte para continuar</h1>

        <form action="SvUsuario" method="POST">

            <p <label>Usuario: </label> <input type="text" name="usuario"> </p>
            <p <label>Password: </label> <input type="password" name="contrasenia"> </p>

            <button type="sumbit"> enviar</button>
            <button type="sumbit"> <a href="NuevoUsuario.jsp">Nuevo Usuario</a> </button>
        </form>


    </body>
</html>
