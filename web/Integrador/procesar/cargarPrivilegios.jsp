<%-- 
    Document   : cargarPrivilegios
    Created on : 30/11/2016, 09:04:51 PM
    Author     : javie
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.DTOs.PrivilegioDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  System.out.println("Entra");
  String user= request.getParameter("nombre_usuario");
  String mensaje="";
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  ArrayList<PrivilegioDTO> piv = new ArrayList<PrivilegioDTO>();
  
%>
<%= mensaje %>
