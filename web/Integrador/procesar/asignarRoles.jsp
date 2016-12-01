<%-- 
    Document   : asignarRoles
    Created on : 30/11/2016, 10:06:03 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  String user= request.getParameter("nombre_usuario");
  String rol = request.getParameter("roles");
  String[] roles= rol.split("\n");
  List<String> lista= Arrays.asList(roles);
  boolean exito=false;
  String mensaje="";
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  exito= gestor.actualizarRoles(user, lista);
  if(exito){
      mensaje= "1";
  }else{
      mensaje="2";
  }
%>
<%= mensaje %>