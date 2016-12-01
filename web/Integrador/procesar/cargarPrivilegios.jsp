<%-- 
    Document   : cargarPrivilegios
    Created on : 30/11/2016, 09:04:51 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.DTOs.PrivilegioDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  System.out.println("Entra");
  String rol= request.getParameter("rol");
  String mensaje="";
  boolean exito=false;
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  PrivilegioDTO dto = gestor.cargarPrivilegio(rol);
  List<ModuloDTO> modulos = dto.getModulos();
  if (!modulos.isEmpty()) {
        exito = true;
    } else {
        mensaje = "2";
    }
    if (exito) {
%>
    
    

<% }else{ %>
<%= mensaje %>
<% } %>