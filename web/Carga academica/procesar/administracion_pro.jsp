<%-- 
    Document   : administracion_pro
    Created on : 28/11/2016, 11:51:00 AM
    Author     : jesus
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CargaAcademica.Fachada.Fachada" %>
<%@page import="CargaAcademica.DTO.carga_ActAdministrativasDTO"%>

<%
    String cargo=request.getParameter("cargo");
    int hora_semana=Integer.parseInt(request.getParameter("horaSemanal"));
    String otra_act=request.getParameter("actividad");
    int hora_semana2=Integer.parseInt(request.getParameter("horaSemanal2"));
    
    Fachada f=new Fachada();
    carga_ActAdministrativasDTO dto=new carga_ActAdministrativasDTO();
    dto.setCargo(cargo);
    dto.setHoras_cargo(hora_semana);
    dto.setActividad(otra_act);
    dto.setHoras_act(hora_semana2);
    
    String r=f.registrarActAdministrativas(dto);
    request.getSession().setAttribute("respuesta_entidad", r);

response.sendRedirect("../administracion.jsp");
%>
