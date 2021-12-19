<%-- 
    Document   : ListaDeEmpleados
    Created on : 15 dic. 2021, 20:45:37
    Author     : DanielFernandoPosta
--%>

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
        <title>Lista De Empleados</title>
    </head>
    <body>
        <%
            HttpSession misession = request.getSession();
            String usu = (String) misession.getAttribute("usuario");
            if (usu == null) {
                response.sendRedirect("Login.jsp");
            } else {
        %>
        
        <h1>Lista De Empleados</h1>
        
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
                    <th>Cargo</th>
                    <th>Sueldo</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Controladora control = new Controladora();
                    List<Empleado> listaEmp = control.traerEmpleados();
                    for (Empleado emp : listaEmp) {
                   %>
                <tr>
                    <%
                    int id = emp.getId_empleado();
                    int idUsu = emp.getUsuario().getId_usuario();
                    String nombre = emp.getNombre();
                    String apellido = emp.getApellido();
                    String direccion = emp.getDirección();
                    String dni = emp.getDni();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); 
                    Date fechaNac = emp.getFecha_nac();
                    String fecha = sdf.format(fechaNac);
                    String nacionalidad = emp.getNacionalidad();
                    String celu = emp.getCelular();
                    String email = emp.getEmail();
                    String cargo = emp.getCargo();
                    String sueldo = String.valueOf(emp.getSueldo());
                    %>
                    
                    <td><%=nombre%></td>
                    <td><%=apellido%></td>
                    <td><%=direccion%></td>
                    <td><%=dni%></td>
                    <td><%=fecha%></td>                    
                    <td><%=nacionalidad%></td>
                    <td><%=celu%></td>
                    <td><%=email%></td>
                    <td><%=cargo%></td>
                    <td><%=sueldo%></td>
                    
                    <form action="SvEliminarEmpleado" method="POST">
                    <input type="hidden" name="id" value="<%=id%>">
                    <input type="hidden" name="idUsu" value="<%=idUsu%>">
                    <td> <button type="sumbit">Eliminar</button> </td>
                    </form>
                    
            
                    <form action="SvModificarEmpleado" method="POST">
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
