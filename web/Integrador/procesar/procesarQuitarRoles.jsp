<%-- 
    Document   : procesarQuitarRoles
    Created on : 4/12/2016, 09:01:24 PM
    Author     : Lenovo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.DTOs.RequerimientosFDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.DTOs.PrivilegioDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%
    request.setCharacterEncoding("UTF-8");
    String roles = request.getParameter("roles");
    String usuario = request.getParameter("usuario");
    String rolesL[]=roles.split("-");
    ArrayList<String> lista=new ArrayList<String>();
    for(String rol:rolesL){
        lista.add(rol);
    }
    IGestionUsuarios gestionUsuarios=GestionUsuario.getInstance();
    gestionUsuarios.quitarRoles(usuario, lista);
%>