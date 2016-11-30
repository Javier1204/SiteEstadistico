<%-- 
    Document   : procesarModificarRol
    Created on : 29/11/2016, 04:21:15 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  String rol= request.getParameter("rol");
  String desc = request.getParameter("descripcion");
  boolean exito=false;
  String mensaje="";
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  exito = gestor.modificarRol(rol, desc);
  if(exito){
      mensaje= "1";
  }else{
      mensaje="2";
  }
%>
<%= mensaje %>