<%-- 
    Document   : ModificarServicio
    Created on : 18 dic. 2021, 21:12:30
    Author     : DanielFernandoPosta
--%>

<%@page import="java.util.Date"%>
<%@page import="logica.Venta"%>
<%@page import="logica.Paquete"%>
<%@page import="logica.Empleado"%>
<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page import="logica.ServicioTuristico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession misession = request.getSession();
            String usu = (String) misession.getAttribute("usuario");
            if (usu == null) {
                response.sendRedirect("Login.jsp");
            } else {
        %>

        <h1>MODIFICAR SERVICIO</h1>

        <form action="SvModificarServicio" method="GET">

            <% HttpSession miSession = request.getSession();
                Controladora control = new Controladora();
                ServicioTuristico serv = (ServicioTuristico) miSession.getAttribute("servicio");
            %>

            <!-- Elegimos el servicio --->
            <label for="serv">Nombre Del Servicio:</label>
            <select name="servicios">
                <option value="hotel por noche">Hotel por noche/s</option>
                <option value="alquiler Auto">Alquiler de auto</option>
                <option value="Pasaje de Colecivos">Pasajes de colectivo</option>
                <option value="pasaje de Avion">Pasajes de avión</option>
                <option value="pasaje de Tren">Pasajes de tren</option>
                <option value="excursion">Excursiones</option>
                <option value="entrada a Eventos">Entradas a Eventos</option>
            </select>

            <!-- Describimos  el servicio -->
            <p <label>Descripcion </label> <input type="text" name="descripcion" value="<%=serv.getDescripción_breve()%>"> </p>
            <!-- Destino del servicio -->
            <p <label>Destino </label> <input type="text" name="destino" value="<%=serv.getDestino_servicio()%>"> </p>
            <!-- Costo del destino -->
            <p <label>Costo: </label><input type="text" name="costo" value="<%=serv.getCosto_servicio()%>"></p>
            <!-- fecha en la cual se cumplira el sevicio -->
            <p <label>Fecha Del Servicio: </label><input type="date" name="fechaServicio"></p>
            <!-- fecha en la que se efectuo la venta -->
            <p <label>Fecha de Venta: </label><input type="date" name="fechaVenta"></p>

            <!-- medio de pago -->
            <label for="serv">Medios de Pago</label>
            <select name="medioPago" >
                <option value="efectivo">Efectivo</option>
                <option value="tarjeDebito">Tarjeta de Debito</option>
                <option value="tarjetaCredito">Tarjeta de Credito</option>
                <option value="monederoVirtual">Monedero Virtual</option>
                <option value="transferencia">Transferencia</option>
            </select>
            <br><br>

            <label>Cliente: </label>
            <select name="cliente" >
                <%
                    List<Cliente> listaCliente = control.traerClientes();
                    for (Cliente cliente : listaCliente) {

                        String nombre = cliente.getNombre();
                        String apellido = cliente.getApellido();
                        String dni = cliente.getDni();
                        int idClient = cliente.getId_cliente();

                %>

                <option value="<%= idClient%>">   <%=nombre%> <%=apellido%> DNI: <%=dni%> ID: <%=idClient%>  </option>
                <% } %>
            </select>
            <br><br>

            <label>Empleado: </label>
            <select name="empleado" >
                <%
                    List<Empleado> listaEmp = control.traerEmpleados();
                    for (Empleado emp : listaEmp) {

                        String nombre = emp.getNombre();
                        String apellido = emp.getApellido();
                        String dni = emp.getDni();
                        int id = emp.getId_empleado();
                %>

                <option value="<%=id%>"> <%=nombre%> <%=apellido%> DNI: <%=dni%> ID: <%=id%>  </option>
                <% }%>
            </select>

            <br><br>
            <input type="hidden" name="id" value="<%=serv.getCodigo_servicio()%>">
            <button type="sumbit"> Modificar </button>
            <br><br>
            <button type="sumbit"> <a href="Sistema.jsp">Volver a Sistema</a> </button>

            <% }%>
    </body>
</html>
