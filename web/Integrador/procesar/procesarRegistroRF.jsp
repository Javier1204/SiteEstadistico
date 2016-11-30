<%-- 
    Document   : procesarRegistroRF
    Created on : 26/11/2016, 01:34:05 PM
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
  exito = gestor.registrarRF(modulo, id, nombre, url);
  if(exito){
      mensaje= "1";
  }else{
      mensaje="2";
  }
%>
<%= mensaje %>
