<%-- 
    Document   : eliminar_practica_p
    Created on : 27/11/2016, 10:41:56 PM
    Author     : Usuario
--%>

<%@page import="Practicas.DTO.practicaDTO"%>
<%@page import="Practicas.DTO.empresaDTO"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   

int idpractica=Integer.parseInt(request.getParameter("idpractica"));

Facade f = new Facade();
practicaDTO p= new practicaDTO();

p.setIdpractica(idpractica);

String r = f.eliminarPractica(idpractica);//corralo
request.getSession().setAttribute("respuesta_eliminar_practica", r);
%>

    
<%
response.sendRedirect("mostrar_practica.jsp");

%>