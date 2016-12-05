<%-- 
    Document   : registrarGrupo
    Created on : Nov 4, 2016, 5:54:19 AM
    Author     : Administrator
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="gruposinvestigacion.fachada.AdminFachade" id="adminFachade" scope="session"/>

<%
    String codigoColciencias = request.getParameter("codigoColciencias");
    String nombre = request.getParameter("nombre");
    String sigla = request.getParameter("sigla");
    long iddirector = Long.parseLong(request.getParameter("director"));
    String correo = request.getParameter("correo");
    String ubicacion = request.getParameter("ubicacion");
    int anioCreacion = Integer.parseInt(request.getParameter("anioCreacion"));
    long telefono = Long.parseLong(request.getParameter("telefono"));

    Date fechaCreacion = new Date(anioCreacion, 1, 1);
    
%>
<%="Hola" %>