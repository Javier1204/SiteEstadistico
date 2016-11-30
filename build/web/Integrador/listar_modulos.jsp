<%-- 
    Document   : listar_modulos
    Created on : 6/10/2016, 04:06:56 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.RolDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  ICuenta cuenta= (ICuenta) session.getAttribute("usuario");
  List<ModuloDTO> modulos = cuenta.listarModulos();
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
        <div class="ufps-container ufps-fix-navbar-fixed">
            <div class="ufps-col-mobile-12 ufps-col-tablet-3">
                <h4>   <a href="#componentes">Componentes</a> </h4>
                <% for(ModuloDTO mod : modulos){ %>
                <ul>
                    <li>
                        <a href="<%= mod.getUrl() %>"><%= mod.getNombre()%></a>
                    </li>
                </ul>
                <% } %>
            </div>
            <div class="ufps-col-mobile-12 ufps-col-tablet-9" id="componentes">
                <% for(ModuloDTO mod : modulos){ %>
                <section>
                    <div id="titulo">
                        <h2><%=mod.getNombre()%></h2>
                        <p>
                            <%=mod.getDescripcion()%>
                        </p>
                    </div>    
                </section>
                <% } %>
            </div>
        </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>