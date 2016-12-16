<%-- 
    Document   : procesarAgregarRol
    Created on : 15/12/2016, 09:21:16 PM
    Author     : Lenovo
--%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String rol = request.getParameter("rol");
    String descripcion = request.getParameter("descripcion");
    IGestionUsuarios gu = GestionUsuario.getInstance();
    if (gu.registrarRol(rol, descripcion)) {
%>
<h3>El rol se ha agregado exitosamente</h3>
<%
    }else{
%>
<h3>No se ha podido agregar el rol</h3>
<%
}
%>
