<%-- 
    Document   : ModificarPersona
    Created on : 16 dic. 2021, 17:42:40
    Author     : DanielFernandoPosta
--%>

<%@page import="logica.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar persona</title>
    </head>
    
    <body>
        <%
            HttpSession misession = request.getSession();
            String usu = (String) misession.getAttribute("usuario");
            if (usu == null) {
                response.sendRedirect("Login.jsp");
            } else {
        %>
        
        <h1>Modificar Empleado</h1>
        
        <form action="SvModificarEmpleado" method="GET">
            
        <% HttpSession miSession = request.getSession();
            Empleado emp = (Empleado) miSession.getAttribute("empleado");
        %>
            
        <p <label>Nombre: </label> <input type="text" name="nombre" value="<%=emp.getNombre()%>"> </p>
        <p <label>Apellido: </label> <input type="text" name="apellido" value="<%=emp.getApellido() %>"> </p>
        <p <label>Direccion: </label> <input type="text" name="direccion" value="<%=emp.getDirección() %>"> </p>
        <p <label>DNI: </label><input type="text" name="dni" value="<%=emp.getDni() %>"></p>
        <p <label>Fecha de nacimiento: </label><input type="date" name="fecha_nac" value="<%=emp.getFecha_nac() %>"></p>
        <p <label>Nacionalidad: </label><input type="text" name="nacionalidad" value="<%=emp.getNacionalidad() %>"></p>
        <p <label>Celular: </label><input type="text" name="celular" value="<%=emp.getCelular() %>"></p>
        <p <label>E-mail: </label><input type="text" name="email" value="<%=emp.getEmail() %>"></p>
        <p <label>Cargo: </label><input type="text" name="cargo" value="<%=emp.getCargo() %>"></p>
        <p <label>Sueldo:</label><input type="text" name="sueldo" value="<%=emp.getSueldo() %>"></p>
        <p <label>Nombre de usuario:</label><input type="text" name="nombreUsuario" value="<%=emp.getUsuario().getUsuario() %>"></p>
        <p <label>Password: </label><input type="password" name="contrasenia" value="<%=emp.getUsuario().getContrasenia() %>"></p>
        
        <input type="hidden" name="id" value="<%=emp.getId_empleado()%>">
        <input type="hidden" name="idUsu" value="<%=emp.getUsuario().getUsuario() %>">
        <button type="sumbit"> Modificar </button>
        
        </form>
        
        
        
        
        <% } %>
    </body>
</html>
