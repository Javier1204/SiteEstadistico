<%-- 
    Document   : eliminarModulo
    Created on : 29/11/2016, 05:00:41 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
   String nombre_mod= request.getParameter("nombre");
   String descripcion= request.getParameter("descripcion");
   String url= request.getParameter("url");
   String mensaje="";
   IGestionUsuarios gestor = GestionUsuario.getInstance();
   boolean exito= gestor.eliminarModulo(nombre_mod);
   System.out.println(exito);
   response.sendRedirect("../listar_actModulos.jsp");
%>
