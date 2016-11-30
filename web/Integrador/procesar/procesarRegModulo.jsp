<%-- 
    Document   : procesarRegModulo
    Created on : 26/11/2016, 12:22:59 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String nombre_mod= request.getParameter("nombre_mod");
   String descripcion= request.getParameter("descripcion");
   String url= request.getParameter("url");
   String mensaje="";
   IGestionUsuarios gestor = GestionUsuario.getInstance();
   boolean exito= gestor.registrarModulo(nombre_mod, descripcion, url);
   if(exito){
      mensaje= "1";
  }else{
      mensaje="2";
  }
%>
<%= mensaje %>