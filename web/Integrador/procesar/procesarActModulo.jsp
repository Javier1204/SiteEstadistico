<%-- 
    Document   : procesarActModulo
    Created on : 28/11/2016, 10:43:36 AM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String nombre_mod = request.getParameter("nombre_mod");
    String descripcion = request.getParameter("descripcion");
    String url = request.getParameter("url");
    String mensaje = "";
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    boolean exito = gestor.modificarModulo(nombre_mod, descripcion, url);
    if (exito) {
        System.out.print("entro");
%>
        <div class="ufps-alert ufps-alert-green">
            <span class="ufps-close-alert-btn">x</span> Modificación exitosa
        </div>
<%
    mensaje = "1";
} else {
    mensaje = "2";
    
%>
        <div class="ufps-alert">
            <span class="ufps-close-alert-btn">x</span> No se pudo modificar, intente mas tarde
        </div>
<%
    }
%>

<div style="display:none;"><%= mensaje%></div>