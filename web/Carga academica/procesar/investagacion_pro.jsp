<%-- 
    Document   : investagacion_pro
    Created on : 27/11/2016, 03:57:15 PM
    Author     : jesus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CargaAcademica.Fachada.Fachada" %>
<%@page import="CargaAcademica.DTO.carga_investigacionDTO"%>

<%
    int cod_acta=Integer.parseInt(request.getParameter("acta"));
    String actividad=request.getParameter("actividades");
    String responsabilidad=request.getParameter("responsabilidad");
    String unidadInvestigativa=request.getParameter("unidadInvestigativa");
    String institucional=request.getParameter("institucional");
    int    horaSemanal=Integer.parseInt(request.getParameter("horaSemanal"));
    
    Fachada f=new Fachada();
    carga_investigacionDTO dto=new carga_investigacionDTO();
    dto.setCod_acta(cod_acta);
    dto.setNombre(actividad);
    dto.setResponsabilidad(responsabilidad);
    dto.setUnidad_investigativa(unidadInvestigativa);
    dto.setInstitucion(institucional);
    dto.setHoras_semana(horaSemanal);
    
    String r=f.registrarInvestigacion(dto);
     request.getSession().setAttribute("respuesta_investigacion",r);

response.sendRedirect("../investigacion.jsp");
%>