<%-- 
    Document   : procesarReg
    Created on : 26/11/2016, 08:46:55 AM
    Author     : javie
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  System.out.println("Entra");
  String user= request.getParameter("nombre_usuario");
  String pass = request.getParameter("password");
  String rol = request.getParameter("roles");
  String[] roles= rol.split("\n");
  List<String> lista= Arrays.asList(roles);
  boolean exito=false;
  String mensaje="";
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  boolean first = gestor.registrarUsuario(user, pass);
  ICuenta usuario = gestor.loggearUsuario(user, pass);
  if(first){
      List<String> list = gestor.asignarRoles(usuario, lista);
      if(list.size()==0){
          exito= true;
      }
  }
  if(exito){
      mensaje= "1";
  }else{
      mensaje="2";
  }
%>
<%= mensaje %>