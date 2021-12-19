<%-- 
    Document   : nuevoUsuario
    Created on : 15 dic. 2021, 14:10:18
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
        <h1>Formulario para nuevo empleado</h1>
        
        <form action="SvNuevoUsuario" method="POST">
            
        <p <label>Nombre: </label> <input type="text" name="nombre"> </p>
        <p <label>Apellido: </label> <input type="text" name="apellido"> </p>
        <p <label>Direccion: </label> <input type="text" name="direccion"> </p>
        <p <label>DNI: </label><input type="text" name="dni"></p>
        <p <label>Fecha de nacimiento: </label><input type="date" name="fecha_nac"></p>
        <p <label>Nacionalidad: </label><input type="text" name="nacionalidad"></p>
        <p <label>Celular: </label><input type="text" name="celular"></p>
        <p <label>E-mail: </label><input type="text" name="email"></p>
        <p <label>Cargo: </label><input type="text" name="cargo"></p>
        <p <label>Sueldo:</label><input type="text" name="sueldo"></p>
        <p <label>Nombre de usuario:</label><input type="text" name="nombreUsuario"></p>
        <p <label>Password: </label><input type="password" name="contrasenia"></p>
        
        <button type="sumbit"> enviar</button>
        
        </form>
        
        
    </body>
</html>
