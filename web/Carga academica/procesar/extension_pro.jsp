<%-- 
    Document   : extension_pro
    Created on : 27/11/2016, 06:05:35 PM
    Author     : jesus
--%>


<%@page import="CargaAcademica.Fachada.Fachada" %>
<%@page import="CargaAcademica.DTO.carga_extensionDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  String nombre=request.getParameter("actividad");
  String responsabilidad=request.getParameter("responsabilidad");
  String unidad=request.getParameter("unidadInvestigativa");
  String programa=request.getParameter("beneficiario");
  String horas_ejecu=request.getParameter("ejecucion");
  String horas_progra=request.getParameter("programacion");
 
  Fachada f=new Fachada();
  carga_extensionDTO dto=new carga_extensionDTO();
 
  dto.setNombre(nombre);
  dto.setResponsabilidad(responsabilidad);
  dto.setUnidad(unidad);
  dto.setPrograma(programa);
  dto.setHoras_ejecu(Integer.parseInt(horas_ejecu));
  dto.setHoras_progra(Integer.parseInt(horas_progra));
  
  String r= f.registrarExtension(dto);
  request.getSession().setAttribute("respuesta_entidad", r);



response.sendRedirect("../extension.jsp");
%>