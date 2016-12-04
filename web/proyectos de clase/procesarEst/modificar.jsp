<%-- 
    Document   : relacionarProyecto
    Created on : 30/11/2016, 03:19:38 PM
    Author     : tuto2
--%>

<%@page import="academico.DTO.ProyectoDTO"%>
<%@page import="academico.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String id = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String keywords = request.getParameter("keywords");
    String descripcion = request.getParameter("descripcion");
    ProyectoDTO dto = new ProyectoDTO();
    dto.setDesc(descripcion);
    dto.setKeywords(keywords);
    dto.setProyecto_name(nombre);
   
    Facade fachada = new Facade();
    fachada.modificarProyecto(Integer.parseInt(id),dto);

%>
<%="1"%>