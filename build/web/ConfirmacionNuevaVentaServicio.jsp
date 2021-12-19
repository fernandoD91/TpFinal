<%-- 
    Document   : ConfirmacionNuevaVentaServicio
    Created on : 19 dic. 2021, 13:20:54
    Author     : DanielFernandoPosta
--%>

<%@page import="logica.ServicioTuristico"%>
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
        <h1>Felicidades Compraste un nuevo Servicio Turistico</h1>
        <% HttpSession miSession = request.getSession();
                Controladora control = new Controladora();
                ServicioTuristico serv1 = (ServicioTuristico) miSession.getAttribute("servicio");
            %>
            
            <p>Con las siguientes caracteristicas: </p>
            <p <label>Descripcion </label> <input type="text" name="descripcion" value="<%=serv1.getDescripción_breve()%>"> </p>
            <!-- Destino del servicio -->
            <p <label>Destino </label> <input type="text" name="destino" value="<%=serv1.getDestino_servicio()%>"> </p>
            <!-- Costo del destino -->
            <p <label>Costo: </label><input type="text" name="costo" value="<%=serv1.getCosto_servicio()%>"></p>
            <br><br>
            <button type="sumbit"> <a href="Sistema.jsp">Volver a Sistema</a> </button>
        
        
        <% }%>
    </body>
</html>
