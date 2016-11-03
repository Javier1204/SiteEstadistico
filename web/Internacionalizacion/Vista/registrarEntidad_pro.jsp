<%-- 
    Document   : registrarEntidad_pro
    Created on : 29/10/2016, 04:02:31 PM
    Author     : HeinerV

esta clase es temporal 
--%>


<%@page import="internacionalizacion.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
String nombre=request.getParameter("nombre");
String representante=request.getParameter("representante");
String sector=request.getParameter("sector");
String ambito=request.getParameter("ambito");
String telefono =request.getParameter("telefono");
String tipo=request.getParameter("tipo");
int pais=Integer.parseInt(request.getParameter("pais"));
String nit=request.getParameter("nit");
Facade f = new Facade();
String r = f.registrarEntidad(nombre,representante,sector,ambito,tipo, telefono,pais,nit);
request.getSession().setAttribute("respuesta_entidad", r);
%>

    
<%
response.sendRedirect("registrarEntidad.jsp");

%>