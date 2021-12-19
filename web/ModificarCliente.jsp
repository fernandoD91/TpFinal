<%-- 
    Document   : ModificarCliente
    Created on : 16 dic. 2021, 21:44:29
    Author     : DanielFernandoPosta
--%>

<%@page import="logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FORMULARIO DE MODIFICACION CLIENTE</title>
    </head>
    
    <body>
        <%
            HttpSession misession = request.getSession();
            String usu = (String) misession.getAttribute("usuario");
            if (usu == null) {
                response.sendRedirect("Login.jsp");
            } else {
        %>
        
        <h1>FORMULARIO DE MODIFICACION CLIENTE</h1>
        
        <form action="SvModificarCliente" method="GET">
            
        <% HttpSession miSession = request.getSession();
            Cliente clien = (Cliente) miSession.getAttribute("cliente");
        %>
            
        <p <label>Nombre: </label> <input type="text" name="nombre" value="<%=clien.getNombre()%>"> </p>
        <p <label>Apellido: </label> <input type="text" name="apellido" value="<%=clien.getApellido() %>"> </p>
        <p <label>Direccion: </label> <input type="text" name="direccion" value="<%=clien.getDirección() %>"> </p>
        <p <label>DNI: </label><input type="text" name="dni" value="<%=clien.getDni() %>"></p>
        <p <label>Fecha de nacimiento: </label><input type="date" name="fecha_nac" value="<%=clien.getFecha_nac() %>"></p>
        <p <label>Nacionalidad: </label><input type="text" name="nacionalidad" value="<%=clien.getNacionalidad() %>"></p>
        <p <label>Celular: </label><input type="text" name="celular" value="<%=clien.getCelular() %>"></p>
        <p <label>E-mail: </label><input type="text" name="email" value="<%=clien.getEmail() %>"></p>
        
        <input type="hidden" name="id" value="<%=clien.getId_cliente() %>">
        
        <button type="sumbit"> Modificar </button>
        
        </form>
        
        
        
        
        <% } %>
    </body>
</html>
