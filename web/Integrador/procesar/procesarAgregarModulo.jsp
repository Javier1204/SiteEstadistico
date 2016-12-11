<%-- 
    Document   : procesarAgregarModulo
    Created on : 11/12/2016, 10:09:10 AM
    Author     : Lenovo
--%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String modulo = request.getParameter("modulo");
    String descripcion = request.getParameter("descripcion");
    String url = request.getParameter("url");
    IGestionUsuarios gu = GestionUsuario.getInstance();
    boolean e = gu.registrarModulo(modulo, descripcion, url);
    if (!e) {
%><h3>No se pudo agregar el modulo</h3><%
} else {
%><h3>El registro ha sido exitoso</h3><%
    }
%>
