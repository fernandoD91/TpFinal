<%-- 
    Document   : ListaDeServiciosVendidos
    Created on : 18 dic. 2021, 17:21:38
    Author     : DanielFernandoPosta
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.ServicioTuristico"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTA DE SERVICIOS VENDIDOS</title>
    </head>
    <body>
        <%
            HttpSession misession = request.getSession();
            String usu = (String) misession.getAttribute("usuario");
            if (usu == null) {
                response.sendRedirect("Login.jsp");
            } else {
        %>
        <h1>LISTA DE SERVICIOS VENDIDOS</h1>
        
        <table border="5" width="1" cellspacing="1" cellpadding="20">
            <thead>
                <tr>
                    <th>Nombre Del Servicio</th>
                    <th>Descripcion</th>
                    <th>Destino</th>
                    <th>Costo</th>
                    <th>Fecha Del Servicio</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Controladora control = new Controladora();
                    List<ServicioTuristico> listaServ = control.traerServiciosTuristicos();
                    for (ServicioTuristico serv : listaServ) {
                        if (!serv.getListaPaquete().isEmpty()) {
                                continue;
                            }
                %>
                <tr>
                    <%
                    int id = serv.getCodigo_servicio();
                    String nombre = serv.getNombre();
                    String descripcion = serv.getDescripción_breve();
                    String destino = serv.getDestino_servicio();
                    double costo = serv.getCosto_servicio();
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY"); 
                    Date fechaNac = serv.getFecha_servicio();
                    String fecha = sdf.format(fechaNac);
                    %>
                    <td><%=nombre%></td>
                    <td><%=descripcion%></td>
                    <td><%=destino%></td>
                    <td><%=costo%></td>
                    <td><%=fecha%></td>
                    
                     <form action="SvEliminarServicio" method="POST">
                    <input type="hidden" name="id" value="<%=id%>">
                    <td> <button type="sumbit">Eliminar</button> </td>
                    </form>
                    
                    <form action="SvModificarServicio" method="POST">
                    <input type="hidden" name="id" value="<%=id%>">
                    <td> <button type="sumbit">Modificar</button> </td>
                    </form>
                    
                </tr>
                <% } %>
            </tbody>
        </table>
            <br><br>
            <button type="sumbit"> <a href="Sistema.jsp">Volver a Sistema</a> </button>
        <% }%>
    </body>
</html>
