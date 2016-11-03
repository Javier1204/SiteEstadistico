<%-- 
    Document   : registrarActividad_pro
    Created on : 2/11/2016, 03:47:39 PM
    Author     : JAVIER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
String convenio = request.getParameter("convenio");
String nombre = request.getParameter("nombre");
String duracion = request.getParameter("duracion");
String creacion = request.getParameter("creacion");
String terminacion =request.getParameter("terminacion");
short semestre =Short.parseShort(request.getParameter("fechacreacion"));
String hora=request.getParameter("hora");
int entidad=Integer.parseInt(request.getParameter("entidad"));

%>
