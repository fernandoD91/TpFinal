<%-- 
    Document   : ListaDeClientes
    Created on : 16 dic. 2021, 19:43:15
    Author     : DanielFernandoPosta
--%>

<%@page import="logica.Cliente"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Empleado"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista De Clientes</title>
    </head>
    <body>
        <%
            HttpSession misession = request.getSession();
            String usu = (String) misession.getAttribute("usuario");
            if (usu == null) {
                response.sendRedirect("Login.jsp");
            } else {
        %>
        
        <h1>Lista De Clientes</h1>
        
        <table border="1" width="1" cellspacing="1">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Direccion</th>
                    <th>DNI</th>
                    <th>Fecha De Nacimiento</th>
                    <th>Nacionalidad</th>
                    <th>Celular</th>
                    <th>E-mail</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Controladora control = new Controladora();
                    List<Cliente> listaCliente = control.traerClientes();
                    for (Cliente cliente : listaCliente) {
                   %>
                <tr>
                    <%
                    int id = cliente.getId_cliente();
                    String nombre = cliente.getNombre();
                    String apellido = cliente.getApellido();
                    String direccion = cliente.getDirección();
                    String dni = cliente.getDni();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); 
                    Date fechaNac = cliente.getFecha_nac();
                    String fecha = sdf.format(fechaNac);
                    String nacionalidad = cliente.getNacionalidad();
                    String celu = cliente.getCelular();
                    String email = cliente.getEmail();
                    %>
                    
                    <td><%=nombre%></td>
                    <td><%=apellido%></td>
                    <td><%=direccion%></td>
                    <td><%=dni%></td>
                    <td><%=fecha%></td>                    
                    <td><%=nacionalidad%></td>
                    <td><%=celu%></td>
                    <td><%=email%></td>
                    
                    <form action="SvEliminarCliente" method="POST">
                    <input type="hidden" name="id" value="<%=id%>">
                    <td> <button type="sumbit">Eliminar</button> </td>
                    </form>
                    
            
                    <form action="SvModificarCliente" method="POST">
                    <input type="hidden" name="id" value="<%=id%>">
                    <td> <button type="sumbit">Modificar</button> </td>
                    </form>
                    </form>
                </tr>
                <% } %>
            </tbody>
        </table>
            
            
            <button type="sumbit"> <a href="Sistema.jsp">Volver a Sistema</a> </button>
        
        <% } %>
    </body>
</html>
