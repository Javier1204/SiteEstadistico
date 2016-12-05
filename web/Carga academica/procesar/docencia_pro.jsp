<%-- 
    Document   : docencia_pro
    Created on : 30/11/2016, 04:38:27 PM
    Author     : estudiante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CargaAcademica.Fachada.Fachada" %>
<%@page import="CargaAcademica.DTO.carga_grupoDTO" %>
<!DOCTYPE html>
<%
    String codigo=request.getParameter("codigo");
    String []cod=codigo.split("-");
    
    String cod_f=cod[0];
    String grupo=request.getParameter("grupo");
    int horas_teo=Integer.parseInt(request.getParameter("teorico"));
    int horas_teoPra=Integer.parseInt(request.getParameter("teoricoPractico"));
    int horas_prac=Integer.parseInt(request.getParameter("practico"));
    int num_estudiantes=Integer.parseInt(request.getParameter("estudiantes"));
    
    Fachada f=new Fachada();
    carga_grupoDTO dto=new carga_grupoDTO();
    
    dto.setCod_asignatura(cod_f);
    dto.setGrupo(grupo);
    dto.setHoras_teo(horas_teo);
    dto.setHoras_prac(horas_prac);
    dto.setHoras_teoprac(horas_teoPra);
    dto.setNum_estu(num_estudiantes);
    
    String r=f.registrarDocencia(dto);
    
   response.sendRedirect("../docencia.jsp");
%>