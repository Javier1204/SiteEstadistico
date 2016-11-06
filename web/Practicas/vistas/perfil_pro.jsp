<%-- 
    Document   : perfil_pro
    Created on : 5/11/2016, 04:52:28 PM
    Author     : Administrador
--%>


<%@page import="Practicas.DTO.perfilDTO"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    String nombre=request.getParameter("nombrePerfil");
    Facade f = new Facade();
    perfilDTO p= new perfilDTO();
    p.setNombre(nombre);
    int id = f.idperfilMaximo();
    p.setIdperfil(id+1);
    String r = f.RegistrarPerfil(p);
    request.getSession().setAttribute("respuesta_perfil", r);
%>

    
<%
response.sendRedirect("perfil.jsp");

%>