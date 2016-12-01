<%-- 
    Document   : procesarModUsuario
    Created on : 28/11/2016, 10:20:20 AM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  String user= request.getParameter("nombre_usuario");
  String pass = request.getParameter("password");
  boolean exito=false;
  String mensaje="";
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  boolean first = gestor.cambiarContrasena(user, pass);
  if(first){
      mensaje= "1";
  }else{
      mensaje="2";
  }
%>
<%= mensaje %>