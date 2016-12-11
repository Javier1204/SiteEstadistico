<%-- 
    Document   : procesarCrearRF
    Created on : 7/12/2016, 11:13:48 PM
    Author     : Lenovo
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     request.setCharacterEncoding("UTF-8");
     String modulo=request.getParameter("modulo");
     String id=request.getParameter("id");
     String nombre=request.getParameter("nombre");
     String url=request.getParameter("url");
     IGestionUsuarios gu=GestionUsuario.getInstance();
     boolean exito=gu.registrarRF(modulo, id, nombre, url);
     if(exito){
         %>
         <h2>registro exitoso</h2><%
     }else{
%><h2>No se puedo registrar el Requerimiento</h2><%
}
%>
