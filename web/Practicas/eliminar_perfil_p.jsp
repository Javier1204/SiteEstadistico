<%-- 
    Document   : eliminar_perfil_p
    Created on : 25/11/2016, 11:25:35 PM
    Author     : Usuario
--%>

<%@page import="Practicas.DTO.perfilDTO"%>
<%@page import="Practicas.DTO.empresaDTO"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   

int id=Integer.parseInt(request.getParameter("id"));

Facade f = new Facade();
perfilDTO p= new perfilDTO();

p.setIdperfil(id);

String r = f.eliminarPerfil(id);//corralo
request.getSession().setAttribute("respuesta_eliminar_perfil", r);
%>

    
<%
response.sendRedirect("perfil.jsp");

%>