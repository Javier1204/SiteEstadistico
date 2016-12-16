<%-- 
    Document   : procesarAgregarUsuario
    Created on : 15/12/2016, 07:47:39 PM
    Author     : Lenovo
--%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String codigo = request.getParameter("user");
    String pass = request.getParameter("pass");
    if (GestionUsuario.getInstance().registrarUsuario(codigo, pass)) {
%>
<h3>Se ha agregado exitosamente</h3>
<%
    }else{
%>
<h3>No se ha podido agregar</h3>
<%
}
%>
