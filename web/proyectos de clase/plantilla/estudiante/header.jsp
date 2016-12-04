<%-- 
    Document   : header
    Created on : 1/11/2016, 02:03:40 PM
    Author     : tuto2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Proyectos de clase</title>
        <link href="../../public/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../public/css/styles.css" rel="stylesheet">
        <link href="../../public/css/ufps-estilo.css" rel="stylesheet">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/default.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/highlight.min.js"></script>
        <script src="../../public/js/ufps.js"></script>

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <header>
            <center> <img id="banner" src="../../public/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header>
        <div class="ufps-navbar ufps-navbar ufps-navbar-light" id="menuPrincipal">
            <div class="ufps-container">
                <div class="ufps-navbar-brand">
                    <div class="ufps-btn-menu" onclick="toggleMenu('menuPrincipal')">
                        <div class="ufps-btn-menu-bar"></div>
                        <div class="ufps-btn-menu-bar"></div>
                    </div>
                    Proyectos de clase
                </div>
                <div class="ufps-navbar-left">

                    <a href="inicio.jsp" class="ufps-navbar-btn">Home</a>
                    <a href="consultarProyectos.jsp"class="ufps-navbar-btn">Consultar proyectos</a>
                               
                </div>
                <div class="ufps-navbar-right">
                    <div class="ufps-navbar-corporate">
                        <a href="" class="ufps-navbar-btn"> Estudiante </a>
                    </div>
                </div>

            </div>
        </div>

