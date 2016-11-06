<%-- 
    Document   : RegistrarEmpresa_p
    Created on : 5/11/2016, 04:47:46 PM
    Author     : Usuario
--%>
<%@page import="Praticas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   
String nombreEmpresa=request.getParameter("nombres");
String NIT=request.getParameter("nit");
String sectorEmpresa=request.getParameter("actEmpresa");
String tipoAmbito=request.getParameter("tipoEmpresa");
String telefono =request.getParameter("telefono");
String direccion=request.getParameter("tipo");
Facade f = new Facade();
String r = f.registrarEmpresa(NIT, sectorEmpresa, nombreEmpresa, tipoAmbito, direccion, telefono);
request.getSession().setAttribute("respuesta_entidad", r);
%>

    
<%
response.sendRedirect("registro_empresas.jsp");

%>