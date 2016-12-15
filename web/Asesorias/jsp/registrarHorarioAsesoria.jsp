<%-- 
    Document   : registrarHorarioAsesoria
    Created on : 13/12/2016, 03:45:35 PM
    Author     : DiegoLeal
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
<%
    String dia = request.getParameter("dia").toString();
    String horaInicio = request.getParameter("horaInicio").toString();
    String horaFin = request.getParameter("horaFin").toString();
    
    ICuenta cuenta = (ICuenta) session.getAttribute("usuario");
    String codDoc = cuenta.getNombre();
    String rta = facade.registrarHorario(dia, horaInicio, horaFin, codDoc);
    
    System.out.println("rta de registrar:: " + rta);
%>
