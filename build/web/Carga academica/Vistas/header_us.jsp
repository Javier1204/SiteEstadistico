
<%-- 
    Document   : header para proyecto carga docente
    Created on : 9/10/2016, 05:24:25 PM
    Author     : Victor Urbina 1150962
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Departamento de sistemas e Informática UFPS</title>
        <link href="../../public/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../public/css/styles.css" rel="stylesheet">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/default.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/highlight.min.js"></script>
        <script src="../../public/js/ufps.js"></script>

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>JSP Page</title>
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
                        <div class="ufps-btn-menu-bar"></div>
                    </div>
                    Carga Docentes
                </div>
                <div class="ufps-navbar-left">

                    <a href="../Vistas/Servicios.jsp" class="ufps-navbar-btn">Inicio</a>
                   
                    <div class="ufps-dropdown" id="dropdown4">
                        <button onclick="openDropdown('dropdown4')" class="ufps-dropdown-btn">
                            Docentes
                        </button>
                        <div class="ufps-dropdown-content">
                            <a href="../Vistas/infoPersonal.jsp" class="ufps-navbar-btn item">Información Personal</a>
                            <a href="../Vistas/docencia.jsp" class="ufps-navbar-btn item"> ActividadesDocencia</a>
                            <a href="../Vistas/investigacion.jsp" class="ufps-navbar-btn item">ActividadesInvestigación</a>
                            <a href="../Vistas/extension.jsp" class="ufps-navbar-btn item">ActividadesExtensión</a>
                            <a href="../Vistas/administracion.jsp" class="ufps-navbar-btn item">ActividadesAdministración</a>
                            <a href="../Vistas/otras.jsp" class="ufps-navbar-btn item">Otras Actividades</a>
                        </div>
                    </div> 
                    
                    <div class="ufps-dropdown" id="dropdown5">
                        <button onclick="openDropdown('dropdown5')" class="ufps-dropdown-btn">
                            Director
                        </button>
                        <div class="ufps-dropdown-content">
                             <a href="../Vistas/administrar.jsp" class="ufps-navbar-btn item">Administrar App</a>
                             <a href="../Vistas/observaciones.jsp" class="ufps-navbar-btn item">Observaciones</a>
                             <a href="../Vistas/consultas.jsp" class="ufps-navbar-btn item">Consultas</a>
                        </div>
                    </div> 
                    
                </div>
                <div class="ufps-navbar-right">
                    <div class="ufps-navbar-corporate">
                        <a href="" class="ufps-navbar-btn"> Administrador </a>
                    </div>
                </div>
            </div>
        </div>