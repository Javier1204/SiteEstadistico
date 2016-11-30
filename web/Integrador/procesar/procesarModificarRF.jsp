<%-- 
    Document   : procesarModificarRF
    Created on : 28/11/2016, 11:23:29 AM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  String id= request.getParameter("id");
  String nombre = request.getParameter("nombre");
  String modulo = request.getParameter("modulo");
  String url = request.getParameter("url");
  String descripcion = request.getParameter("desc");
  boolean exito=false;
  String mensaje="";
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  exito = gestor.modificarRF(modulo, id, nombre, url);
  System.out.println(exito);
  if(exito){
      mensaje= "1";
  }else{
      mensaje="2";
  }
%>
<%= mensaje %>
