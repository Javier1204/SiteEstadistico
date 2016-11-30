<%-- 
    Document   : eliminarUsuario
    Created on : 29/11/2016, 04:59:56 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String user= request.getParameter("nombre_usuario");
  String pass = request.getParameter("password");
  boolean exito=false;
  String mensaje="";
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  boolean first = gestor.eliminarUsuario(user);
  System.out.println(first);
  response.sendRedirect("../listarUsuario.jsp");
%>