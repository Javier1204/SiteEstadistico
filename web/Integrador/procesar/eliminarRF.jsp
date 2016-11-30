<%-- 
    Document   : eliminarRF
    Created on : 29/11/2016, 05:00:15 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String id= request.getParameter("id");
  String nombre = request.getParameter("nombre");
  String modulo = request.getParameter("modulo");
  String url = request.getParameter("url");
  String descripcion = request.getParameter("desc");
  boolean exito=false;
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  gestor.eliminarRF(modulo, id);
  System.out.println(exito);
  response.sendRedirect("../listarRF.jsp");
%>