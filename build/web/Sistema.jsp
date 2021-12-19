<%-- 
    Document   : sistema
    Created on : 15 dic. 2021, 14:09:31
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
        <%
            HttpSession misession = request.getSession();
            String usu = (String) misession.getAttribute("usuario");
            if (usu == null) {
                response.sendRedirect("Login.jsp");
            } else {
        %>

        <h1>Ingresaste Correctamente al sistema de ventas!</h1>
        
         <button type="sumbit"> <a href="VentaServicioTuristico.jsp">Nueva Venta: Servicio Turistico</a> </button>
         <button type="sumbit"> <a href="VentaDePaquete.jsp">Nueva Venta: Paquete</a> </button>
         <button type="sumbit"> <a href="ListaDeServiciosVendidos.jsp">Lista De Servicios Turisticos Vendidos</a> </button>
         <button type="sumbit"> <a href="ListaDePaquetesVendidos.jsp">Lista De Paquetes Vendidos</a> </button>
         <button type="sumbit"> <a href="NuevoCliente.jsp">Registrar Nuevo Cliente</a> </button>
         <button type="sumbit"> <a href="ListaDeClientes.jsp">Lista De Clientes</a> </button>
         <button type="sumbit"> <a href="ListaDeEmpleados.jsp">Lista De Empleados</a> </button>

        <% } %>
    </body>
</html>
