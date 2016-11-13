<%-- 
    Document   : login
    Created on : 14/10/2016, 03:03:01 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <script src="js/ajax.js"></script>
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
                    <a href="listar_publicaciones.jsp" class="ufps-navbar-btn">Home</a>


                </div>
                <div class="ufps-navbar-right">
                    <div class="ufps-navbar-corporate">

                    </div>
                </div>

            </div>
        </div>
        <div class="contenidologin">
            <center><h2>Iniciar sesión</h2></center>
            <form method="post" action="javascript:ingresar()" name="login" class="form" id="login">
                <center> <label>Ingresa tus datos para iniciar sesión</label></center>
                <input type="text" name="nombre_usuario" id="nombre_usuario" placeholder="Nombre de usuario" class="ufps-input ufps-red" />
                <input type="password" name="contraseña" id="password" placeholder="Contraseña" class="ufps-input ufps-red" />
                <select class="ufps-input ufps_red" id="tipo" >
                    <option selected >
                        No seleccion
                    </option>
                    <option>
                        administrador
                    </option>                  
                    <option>
                        docente
                    </option>
                    <option>
                        coordinador
                    </option>
                    <option>
                        estudiante
                    </option>
                    <option>
                        director de semilleros
                    </option>
                </select>
                <input type="submit" class="ufps-btn ufps-btn-light" name="ingresar" id="ingresar" value="Ingresar" />
                <label id="divError"> </label>
            </form>
        </div>

        <jsp:include page="../plantilla/footer.jsp"></jsp:include>
    </body>
</html>