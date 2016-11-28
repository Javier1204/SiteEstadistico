<%-- 
    Document   : modificarRol
    Created on : 27/11/2016, 04:05:15 PM
    Author     : javie
--%>

<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.DTOs.RolDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    List<RolDTO> roles = gestor.listarRoles();
    System.out.println(roles);
%>   

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Departamento de sistemas e Informática UFPS</title>
        <link href="../public/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/ufps-estilo.css" rel="stylesheet">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/default.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/highlight.min.js"></script>
        <script src="../public/js/ufps.js"></script>

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <center> <img id="banner" src="../public/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header>
        <div class="ufps-navbar  ufps-navbar-light" id="menuPrincipal">
            <div class="ufps-container">
                <div class="ufps-navbar-brand">
                    <div class="ufps-btn-menu" onclick="toggleMenu('menuPrincipal')">
                        <div class="ufps-btn-menu-bar"></div>
                        <div class="ufps-btn-menu-bar"></div>
                        <div class="ufps-btn-menu-bar"></div>
                    </div>
                    Site Estadístico
                </div>
                <div class="ufps-navbar-left">          
                </div>
                <div class="ufps-navbar-right">
                    <div class="ufps-navbar-right">
                        <div class="ufps-navbar-corporate">
                            <a href="procesar/cerrarSesion.jsp" class="ufps-navbar-btn"> Cerrar sesion </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Contenido-->
        <div  class="ufps-container" id="contenido">
            <h1 class="text-center" style="text-align: center">Listado de roles</h1>
            <table class="ufps-table" cellspacing="0" width="100%">
                <thead>
                    <tr>

                        <th>Rol</th>
                        <th>DESCRIPCION</th>
                        <th>Priviegio</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (RolDTO dto : roles) {%>
                    <tr>
                        <td><center><%= dto.getRol()%></center></td>
                        <td><center><%= dto.getDescripcion()%></center></td>
                        <td>  Anything </td>
                </tr>
                <% }%>
                </tbody>
            </table>
        </div>         
        <jsp:include page="../plantilla/footer.jsp"></jsp:include>
