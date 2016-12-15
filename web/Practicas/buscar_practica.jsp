<%-- 
    Document   : buscar_practica
    Created on : 27/11/2016, 08:19:27 PM
    Author     : Usuario
--%>

<%@page import="Practicas.DTO.practicaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
   
String semestre=request.getParameter("semestre");
String anio=request.getParameter("anio");

Facade f = new Facade();

ArrayList<practicaDTO> r = f.obtenerPracticas_anio(semestre, anio);//corralo
request.getSession().setAttribute("respuesta_entidad", r);
%>

    
<%
response.sendRedirect("mostrar_practica.jsp");

%>
</html>
