<%-- 
    Document   : otras_pro
    Created on : 16/12/2016, 01:57:09 AM
    Author     : Edna helen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CargaAcademica.Fachada.Fachada" %>
<%@page import="CargaAcademica.DTO.carga_otraDTO" %>
<!DOCTYPE html>
<%
   String nombre=request.getParameter("actividad");
   int horas=Integer.parseInt(request.getParameter("horas"));
   String codigoDoc=request.getParameter("codigodoc");
   
   Fachada f=new Fachada();
   carga_otraDTO dto=new carga_otraDTO();
   dto.setNombre(nombre);
   dto.setHoras(horas);
 
   
   f.registrarOtrasActividades(dto, codigoDoc);
   
   response.sendRedirect("../otras.jsp");
%>