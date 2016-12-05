<%-- 
    Document   : editarGrupo
    Created on : Nov 4, 2016, 6:06:32 AM
    Author     : Administrator
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="gruposinvestigacion.dto.Grupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="gruposinvestigacion.fachada.Fachade" id="fachada" scope="session"/>

<%
    String codigoColciencias = request.getParameter("codigoColciencias");
    String nombre = request.getParameter("nombre");
    String sigla = request.getParameter("sigla");
    int codigoLineaDeInvestigacion = Integer.parseInt(request.getParameter("codigoLinea"));
    String director = request.getParameter("director");
    String codirector = request.getParameter("codirector");
    String correo = request.getParameter("correo");
    String ubicacion = request.getParameter("ubicacion");
    String anioCreacion = request.getParameter("anioCreacion");
    long telefono = Long.parseLong(request.getParameter("telefono"));

    try {
        Grupo grupo = new Grupo(codigoColciencias, codigoLineaDeInvestigacion, nombre, sigla, director, codirector, anioCreacion, correo, ubicacion, telefono);
        fachada.editarGrupo(grupo);
%>
<%="Datos Modificados Correctamente."%>
<%
} catch (SQLException e) {
%>
<%="Error." + e.getMessage()%>
<%
} catch (Exception e) {
%>
<%="Error." + e.getMessage()%>
<%
    }
%>