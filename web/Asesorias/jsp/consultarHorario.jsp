<%-- 
    Document   : consultarHorario
    Created on : 1/11/2016, 09:39:18 PM
    Author     : DiegoLeal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
<%
    String tipoConsulta = request.getParameter("tipoConsulta").toString();
    String consultaPor = request.getParameter("consultaPor").toString();
    String grupo = request.getParameter("grupo").toString();
    String entrada = new String(request.getParameter("entrada").getBytes("ISO-8859-1"), "UTF-8");

    System.out.println(tipoConsulta + " : " + consultaPor + " : " + grupo + " : " + entrada);
    String rta = "";
    String msg = "";
    if (tipoConsulta.equals("nombre")) {
        //Busca por nombre
        if (consultaPor.equals("docente")) {
            //Busca docente por nombre
            String rta1 = controlador.consultarDocenteNombre(entrada);
        } else {
            //Busca materia por nombre
            //String rta1 = controlador.consultarMateriaNombre(entrada);
        }
    } else {
        //Busca por codigo
        if (consultaPor.equals("docente")) {
            //Busca docente por codigo
        } else {
            //Busca materia por codigo
        }
    }
%>
