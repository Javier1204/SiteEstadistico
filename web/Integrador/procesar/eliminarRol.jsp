<%-- 
    Document   : eliminarRol
    Created on : 29/11/2016, 05:00:27 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String rol= request.getParameter("rol");
  String desc = request.getParameter("descripcion");
  boolean exito=false;
  String mensaje="";
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  exito = gestor.eliminarRol(rol);
  System.out.println(exito);
  response.sendRedirect("../listarRoles.jsp");
%>
