<%-- 
    Document   : observaciones_pro
    Created on : 1/12/2016, 10:10:50 AM
    Author     : Edna helen
--%>

<%@page import="CargaAcademica.DTO.observacionesDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="CargaAcademica.Fachada.Fachada" %>
<%
    
   String observacion=request.getParameter("observacion");
   String opcion=request.getParameter("opcion");
   String tipo=request.getParameter("tipo");
   //aca va el codigo del docente
   String codigo= "";  
   int aprobado=0;
   if(opcion.equalsIgnoreCase("Aprobar")){
       aprobado=1;
   }
   
   
   observacionesDTO dto= new observacionesDTO();
   dto.setActividad(tipo);
   dto.setComentario(observacion);
   dto.setAprobado(aprobado);
   Fachada f=new Fachada();
   String r=f.registrarObservacion(dto);
  

  response.sendRedirect("../observaciones.jsp");
%>
