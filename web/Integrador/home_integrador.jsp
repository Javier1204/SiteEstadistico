<%-- 
    Document   : home_integrador
    Created on : 14-nov-2016, 17:13:11
    Author     : carlos
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  ICuenta exito=  (ICuenta) session.getAttribute("usuario");
  
  if( exito !=null && !exito.containRol("administrador")){
  response.sendRedirect("login.jsp");
  }

%>   

<!DOCTYPE html>
<html>
    <head>
           <script src="js/ajax.js"></script>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Departamento de sistemas e Informática UFPS</title>
        <link href="../public/css/ufps.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/ufps-estilo.css" rel="stylesheet">
        <script src="../public/js/ufps.js"></script>
        <script src="js/ajax.js"></script>
          <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
          <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
          <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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
                    <a href="GestionPublicaciones" class="ufps-navbar-btn">Home</a>
                   <a href="listar_modulos.jsp" class="ufps-navbar-btn">Administración</a>

                </div>
                <div class="ufps-navbar-right">
                    <div class="ufps-navbar-corporate">
                     
                        <a href="procesar/cerrarSesion.jsp" class="ufps-navbar-btn"> Cerrar sesion </a>
               
                    </div>
                </div>

            </div>
        </div>
        <div class="contenidopublicacionhome">
            <center><h2><b>Bienvenido al modulo de administracion de publicaciones</b></h2></center>
            <div id="contenidohome">
               <button  class="ufps-btn ufps-btn-light"  onclick="abrirVentana()">Crear publicación</button>
              
                
                <table id="tablapublicacion">
                    <tr>
                       <th>Fecha</th>
                        <th>Nombre</th>
                        <th>Acciones</th>
                    </tr>
                      <tr>
                        <td>11/11/2016</td>
                        <td>Proceso docencia noviembre</td>
                        <td><img src="../public/img/integrador/visualizar.png"  height="30px" width="30px" title="modificar publicacion" style="margin-right: 20px;"> <img src="../public/img/integrador/eliminar.png"  height="30px" width="30px" title="eliminar publicacion" style="margin-right: 20px;"></td>
                    </tr>
                      <tr>
                        <td>11/11/2016</td>
                        <td>Proyectos semilleros</td>
                        <td><img src="../public/img/integrador/visualizar.png"  height="30px" width="30px" title="modificar publicacion" style="margin-right: 20px;"> <img src="../public/img/integrador/eliminar.png"  height="30px" width="30px" title="eliminar publicacion" style="margin-right: 20px;"></td>
                    </tr>
                     <tr>
                        <td>11/11/2016</td>
                        <td>Articulos grupo GIDIS</td>
                        <td><img src="../public/img/integrador/visualizar.png"  height="30px" width="30px" title="modificar publicacion" style="margin-right: 20px;"> <img src="../public/img/integrador/eliminar.png"  height="30px" width="30px" title="eliminar publicacion" style="margin-right: 20px;"></td>
                    </tr>
                </table>
            </div>

        </div>

         <jsp:include page="../plantilla/footer.jsp"></jsp:include>
    </body>
</html>
