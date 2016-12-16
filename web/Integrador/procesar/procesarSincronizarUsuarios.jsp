<%-- 
    Document   : procesarSincronizarUsuarios
    Created on : 15/12/2016, 07:22:32 PM
    Author     : Lenovo
--%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    IGestionUsuarios gu=GestionUsuario.getInstance();
    gu.sincronizarUsuarios();
%>
<h3>Se han sincronizado los estudaintes y docentes en el sistema</h3>
