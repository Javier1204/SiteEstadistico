<%-- 
    Document   : procesarRegistroRol
    Created on : 26/11/2016, 02:57:27 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  String rol= request.getParameter("rol");
  String desc = request.getParameter("descripcion");
  String reqs = request.getParameter("reqs");
  boolean exito=false;
  String mensaje="";
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  exito = gestor.registrarRol(rol, desc);
  if(exito){
      mensaje= "1";
  }else{
      mensaje="2";
  }
%>
<%= mensaje %>