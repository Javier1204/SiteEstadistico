<%-- 
    Document   : header
    Created on : 6/10/2016, 03:48:21 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Departamento de sistemas e Informática UFPS</title>
        <link href="../public/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/ufps.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/ufps-estilo.css" rel="stylesheet">
        <link href="../public/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/default.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/highlight.min.js"></script>
        <script src="../public/js/ufps.js"></script>

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>JSP Page</title>
    </head>
    <%
        ICuenta cuenta = null;
        boolean b = false;
        List<ModuloDTO> modulos = null;
        if (session.getAttribute("usuario") == null) {
            b = true;

        } else {
            cuenta = (ICuenta) session.getAttribute("usuario");
            modulos = cuenta.listarModulos();
        }

    %>
    <body>
        <header>
            <center> <img id="banner" src="../public/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header>
        <div class="ufps-navbar ufps-navbar ufps-navbar-light" id="menuPrincipal">
            <div class="ufps-container">
                <div class="ufps-navbar-brand">
                    <div class="ufps-btn-menu" onclick="toggleMenu('menuPrincipal')">
                        <div class="ufps-btn-menu-bar"></div>
                        <div class="ufps-btn-menu-bar"></div>
                        <div class="ufps-btn-menu-bar"></div>
                    </div>
                    <a href="../Integrador/listar_modulos.jsp">Site Estadístico</a>
                </div>
                <div class="ufps-navbar-left">
                    <% if (modulos != null) { %>
                    <div class="ufps-dropdown" id="dropdown4">
                        <button onclick="openDropdown('dropdown4')" class="ufps-dropdown-btn">Modulos</button>
                        <div class="ufps-dropdown-content">
                            <%for (ModuloDTO mod : modulos) {
                            %>
                            <a href="<%=mod.getUrl()%>"> <%= mod.getNombre()%></a>
                             <a href="#" onclick="ModuloPrimerSemestre();"> Primer Semestre </a>
                            <%
                                }
                            %>
                        </div>
                    </div>    
                    <%
                        }
                    %>
                </div>
                <div class="ufps-navbar-right">
                    <div class="ufps-navbar-corporate">
                        <% if (b) { %>
                        <a href="../Integrador/login.jsp" class="ufps-navbar-btn"> Iniciar sesión </a>
                        <% } else {

                        %>
                        <a href="../Integrador/listar_modulos.jsp" class="ufps-navbar-btn"> <%= cuenta.getNombre()%></a>
                        <a href="../Integrador/procesar/cerrarSesion.jsp" class="ufps-navbar-btn"> Cerrar sesión</a>
                        <% }%>
                    </div>
                </div>

            </div>
        </div>
