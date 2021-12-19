<%-- 
    Document   : ListaDePaquetesVendidos
    Created on : 19 dic. 2021, 1:25:28
    Author     : DanielFernandoPosta
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paquete"%>
<%@page import="logica.ServicioTuristico"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTA DE PAQUETES VENDIDOS!</title>
    </head>
    <body>
        <%
            HttpSession misession = request.getSession();
            String usu = (String) misession.getAttribute("usuario");
            if (usu == null) {
                response.sendRedirect("Login.jsp");
            } else {
        %>
        <h1>LISTA DE PAQUETES VENDIDOS!</h1>

        <table border="1" width="1" cellspacing="1" cellpadding="1">
            <thead>
                <tr>
                    <th>ID Paquete</th>
                    <th>Costo</th>
                    <th>Nombre Del Servicio</th>
                    <th>Descripcion</th>
                    <th>Destino</th>
                    <th>Fecha Del Servicio</th>
                    <th>Nombre Del 2º Servicio</th>
                    <th>Descripcion Del 2º Servicio</th>
                    <th>Destino Del 2º Servicio</th>
                    <th>Fecha Del Servicio</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Controladora control = new Controladora();
                    List<Paquete> listaPaquete = control.traerPaquetes();
                    for (Paquete paquete : listaPaquete) {

                %>
                <tr>
                    <%                        
                    int id = paquete.getCodigo_paquete();
                    double costo = paquete.getCosto_paquete();
                    %>
                    <td><%=id%></td>
                    <td><%=costo%></td>

                    <%
                    List<ServicioTuristico> listaServ = paquete.getListaServicioTuristico();
                    for (ServicioTuristico serv : listaServ) {
                    %>

                    <%
                    String nombre = serv.getNombre();
                    String descripcion = serv.getDescripción_breve();
                    String destino = serv.getDestino_servicio();
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY");
                    Date fechaServ = serv.getFecha_servicio();
                    String fecha = sdf.format(fechaServ);
                    %>
                    <td><%=nombre%></td>
                    <td><%=descripcion%></td>
                    <td><%=destino%></td>
                    <td><%=fecha%></td>

                    <%}%>

            <form action="SvEliminarPaquete" method="POST">
                <input type="hidden" name="id" value="<%=id%>">
                <td> <button type="sumbit">Eliminar</button> </td>
            </form>

            <form action="SvModificarPaquete" method="POST">
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
