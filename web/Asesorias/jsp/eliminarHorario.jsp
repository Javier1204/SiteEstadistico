<%-- 
    Document   : eliminarHorario
    Created on : 13/12/2016, 03:31:28 PM
    Author     : DiegoLeal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
<%
    String id = request.getParameter("id").toString();
    
    String rta = facade.eliminarHorario(id);
    System.out.println("Elimino la asesoria: " + rta);
    out.print(rta);
%>
