<%-- 
    Document   : eliminarUsuario
    Created on : 29/11/2016, 04:59:56 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = request.getParameter("user");
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    if (gestor.eliminarUsuario(user)) {
%>
<h3>Se ha eliminado el usuario</h3>
<%
    }else{
%>
<h3>No se ha podido eliminar el usuario</h3>
<%
    }
%>