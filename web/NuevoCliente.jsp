<%-- 
    Document   : NuevoCliente
    Created on : 16 dic. 2021, 19:05:50
    Author     : DanielFernandoPosta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FORMULARIO PARA NUEVO CLIENTE</title>
    </head>
    <body>
        <%
            HttpSession misession = request.getSession();
            String usu = (String) misession.getAttribute("usuario");
            if (usu == null) {
                response.sendRedirect("Login.jsp");
            } else {
        %>
        
        <h1>FORMULARIO PARA NUEVO CLIENTE</h1>
        
        <form action="SvNuevoCliente" method="POST">
            
        <p <label>Nombre: </label> <input type="text" name="nombre"> </p>
        <p <label>Apellido: </label> <input type="text" name="apellido"> </p>
        <p <label>Direccion: </label> <input type="text" name="direccion"> </p>
        <p <label>DNI: </label><input type="text" name="dni"></p>
        <p <label>Fecha de nacimiento: </label><input type="date" name="fecha_nac"></p>
        <p <label>Nacionalidad: </label><input type="text" name="nacionalidad"></p>
        <p <label>Celular: </label><input type="text" name="celular"></p>
        <p <label>E-mail: </label><input type="text" name="email"></p>
        
        <button type="sumbit"> enviar</button>
        
        </form>
        <% } %>
    </body>
</html>
