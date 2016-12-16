<%-- 
    Document   : registrar_estudiante_pro
    Created on : 16/12/2016, 01:13:08 PM
    Author     : Jordan
--%>

<%@page import="java.util.Date"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String codigo= request.getParameter("codigoEst");
    String direccion = request.getParameter("dirEst");
    String email = request.getParameter("emailEst");
    String telefono = request.getParameter("telEst");
    
    
    
    Facade f= new Facade();
    f.registrarEstudiante(codigo, direccion, email, telefono);



%>

<%
response.sendRedirect("registro_estudiante.jsp?codigo="+codigo);

%>    