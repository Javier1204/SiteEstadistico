<%-- 
    Document   : validarIdRF
    Created on : 26/11/2016, 01:21:51 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String id= request.getParameter("id");
  String modulo= request.getParameter("modulo");
  IGestionUsuarios gestor = GestionUsuario.getInstance();
%>