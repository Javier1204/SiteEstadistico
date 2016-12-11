<%-- 
    Document   : procesarModificarRF
    Created on : 28/11/2016, 11:23:29 AM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String modulo = request.getParameter("modulo");
    String url = request.getParameter("url");
    boolean exito = false;
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    if (gestor.modificarRF(modulo, id, nombre, url)) {
%>
<h3 class="text-center">Se ha modificado el requerimiento</h3>
<%
} else {
%>
<h3 class="text-center">No se ha podido modificar el requerimiento</h3>
<%
    }


%>
