<%-- 
    Document   : ModificarPaquete
    Created on : 19 dic. 2021, 4:39:31
    Author     : DanielFernandoPosta
--%>

<%@page import="logica.ServicioTuristico"%>
<%@page import="logica.Empleado"%>
<%@page import="logica.Paquete"%>
<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
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
        <h1>MODIFICAR EL PAQUETE!</h1>
        
        <form action="SvModificarPaquete" method="GET">
            <% HttpSession miSession = request.getSession();
                Controladora control = new Controladora();
                Paquete paquet = (Paquete) miSession.getAttribute("paquete");
                ServicioTuristico serv1 = paquet.getListaServicioTuristico().get(0);
                ServicioTuristico serv2 = paquet.getListaServicioTuristico().get(1);
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
            <p <label>Descripcion </label> <input type="text" name="descripcion" value="<%=serv1.getDescripción_breve()%>"> </p>
            <!-- Destino del servicio -->
            <p <label>Destino </label> <input type="text" name="destino" value="<%=serv1.getDestino_servicio()%>"> </p>
            <!-- Costo del destino -->
            <p <label>Costo: </label><input type="text" name="costo" value="<%=serv1.getCosto_servicio()%>"></p>
            
            
            <!-- Elegimos el SEGUNDO servicio --->
            <p>ELIJA EL SEGUNDO SERVICIO, LA SUMA DEL COSTO TOTAL TENDRA UN 10% DE DESCUENTO</p>
            <label for="serv">Nombre Del Servicio:</label>
            <select name="servicios2">
                <option value="hotel por noche">Hotel por noche/s</option>
                <option value="alquiler Auto">Alquiler de auto</option>
                <option value="Pasaje de Colecivos">Pasajes de colectivo</option>
                <option value="pasaje de Avion">Pasajes de avión</option>
                <option value="pasaje de Tren">Pasajes de tren</option>
                <option value="excursion">Excursiones</option>
                <option value="entrada a Eventos">Entradas a Eventos</option>
            </select>
            <!-- Describimos  el servicio -->
            <p <label>Descripcion </label> <input type="text" name="descripcion2" value="<%=serv2.getDescripción_breve()%>"> </p>
            <!-- Destino del servicio -->
            <p <label>Destino </label> <input type="text" name="destino2" value="<%=serv2.getDestino_servicio()%>"> </p>
            <!-- Costo del destino -->
            <p <label>Costo: </label><input type="text" name="costo2" value="<%=serv2.getCosto_servicio()%>"></p>
            
            
            <!-- fecha en la cual se cumplira el sevicio -->
            <p <label>Fecha Del Servicio: </label><input type="date" name="fechaServicio" ></p>
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
                
                <option value="<%= idClient %>">   <%=nombre%> <%=apellido%> DNI: <%=dni%> ID: <%=idClient%>  </option>
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
                <% } %>
            </select>
            
            <br><br>
            <input type="hidden" name="id" value="<%=paquet.getCodigo_paquete()%>">
            <button type="sumbit"> Modificar</button>
        </form>       
            <br><br>
            <button type="sumbit"> <a href="Sistema.jsp">Volver a Sistema</a> </button>

        <% }%>
    </body>
</html>
