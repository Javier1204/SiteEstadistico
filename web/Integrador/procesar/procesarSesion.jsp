<%-- 
    Document   : procesarSesion
    Created on : 14/10/2016, 03:03:18 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String user = request.getParameter("nombre_usuario");
    String password = request.getParameter("password");
    System.out.println("llega");
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    ICuenta cuenta = gestor.loggearUsuario(user, password);
    String mensaje = "";
    if (cuenta!=null) {
        System.out.println("Entro");
        session.setAttribute("usuario", cuenta);
        session.setMaxInactiveInterval(1 * 60 * 60);
        mensaje = "1";
    } else {

        mensaje = "Datos incorrectos";
    }
%>
<%=mensaje%>