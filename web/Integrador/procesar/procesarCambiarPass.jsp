<%-- 
    Document   : procesarCambiarPass
    Created on : 15/12/2016, 06:25:15 PM
    Author     : Lenovo
--%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String codigo = request.getParameter("user");
    String pass = request.getParameter("pass");
    System.out.println("entro a cambiar pass");
    IGestionUsuarios gu = GestionUsuario.getInstance();
    if (gu.cambiarContrasena(codigo, pass)) {
%>
<h3>Se ha cambiado exitosamente la contraseña</h3>
<%
    }else{
%>
<h3>No se ha podido cambiar la contraseña</h3>
<%
}
%>
