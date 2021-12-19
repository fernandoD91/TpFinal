<%-- 
    Document   : ConfirmacionDeNuevoPaquete
    Created on : 19 dic. 2021, 12:40:41
    Author     : DanielFernandoPosta
--%>

<%@page import="logica.ServicioTuristico"%>
<%@page import="logica.ServicioTuristico"%>
<%@page import="logica.Paquete"%>
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
        <h1>Felicidades compro un paquete</h1>
        <% HttpSession miSession = request.getSession();
                Controladora control = new Controladora();
                Paquete paquet = (Paquete) miSession.getAttribute("paquete");
                ServicioTuristico serv1 = paquet.getListaServicioTuristico().get(0);
                ServicioTuristico serv2 = paquet.getListaServicioTuristico().get(1);
                
            %>
            <p>Con las siguientes caracteristicas </p>
            <p <label>Descripcion </label> <input type="text" name="descripcion" value="<%=serv1.getDescripción_breve()%>"> </p>
            <!-- Destino del servicio -->
            <p <label>Destino </label> <input type="text" name="destino" value="<%=serv1.getDestino_servicio()%>"> </p>
            <!-- Costo del destino -->
            <p <label>Costo: </label><input type="text" name="costo" value="<%=serv1.getCosto_servicio()%>"></p>
            <p>El Segundo Servicio tiene las siguientes caracteristicas </p>
            <p <label>Descripcion </label> <input type="text" name="descripcion" value="<%=serv2.getDescripción_breve()%>"> </p>
            <!-- Destino del servicio -->
            <p <label>Destino </label> <input type="text" name="destino" value="<%=serv2.getDestino_servicio()%>"> </p>
            <!-- Costo del destino -->
            <p <label>Costo: </label><input type="text" name="costo" value="<%=serv2.getCosto_servicio()%>"></p>
            <p>Costo Del paquete Con el 10% de descuento es: </p>
            <p <label>Costo Total: </label><input type="text" name="costo" value="<%=paquet.getCosto_paquete()%>"></p>



        <br><br>
        <button type="sumbit"> <a href="Sistema.jsp">Volver a Sistema</a> </button>

        <% }%>
    </body>
</html>
