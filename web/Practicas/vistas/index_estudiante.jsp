<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.DTO.perfil_estudianteDTO"%>
<%@page import="Practicas.DTO.perfilDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Practicas.Facade.Facade" %>
<%@page import="Practicas.DTO.estudianteDTO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Prácticas</title
        <link href="../estilos/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link href="../estilos/css/ufps.css" rel="stylesheet">
         <link href="../estilos/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/default.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/highlight.min.js"></script>
        <script src="../estilos/js/ufps.js"></script>
        <script src="../estilos/js/bootstrap.js"></script>
        <script src="../estilos/js/bootstrap.min.js"></script>
    </head>
    <body>
        
        <header>
            <center> <img id="banner" src="../estilos/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header>
       
            <div class="ufps-navbar ufps-container " id="menu"  center>
             <div class="ufps-container-fluid">
                 <div class="ufps-navbar-brand">
                     <div class="ufps-btn-menu" onclick="toggleMenu('menu')">
                         <div class="ufps-btn-menu-bar"> </div>
                         <div class="ufps-btn-menu-bar"> </div>
                         <div class="ufps-btn-menu-bar"> </div>
                         <div class="ufps-btn-menu-bar"> </div>
 
                     </div>
         </div>             
                      <div class="ufps-navbar-left nav"><li><a href="registro_estudiante.jsp" class="  ufps-navbar-btn  " >Registro </a></li> </div>
 
                
             </div>
        </div>
        
        <div  class="ufps-container" id="contenido">
        <fieldset>
            <center>
                <h1>Modulo de practicas </h1>
                <h2>- Site Estadistico - </h2>
                <h3>Universidad Francisco de Paula Santander</h3>
            </center>
            <BR>
        <div class="row">
            
            <div class="col-xs-12 col-md-4">
                <div class="ufps-img-thumbnail">
                    <img src="../img/editar.png" alt="imagen de evento" >
                    <div class="caption">
                        <p><a href="editar_perfil_estudiante.jsp" class="btn ufps-btn" role="button">Editar perfil</a></p>
                    </div>
                </div>
             </div>

             <div class="col-xs-12 col-md-4">
                <div class="ufps-img-thumbnail">
                    <img src="../img/enviar.png" alt="imagen de evento">
                    <div class="caption">
                        <p><a href="informes.jsp" class="btn ufps-btn" role="button">Enviar Informes</a></p>
                    </div>
                </div>
             </div>
  
        </div>
            </fieldset>
        </div>
        
    </body>
    <BR><BR><BR>
    <footer>
         <div class="ufps-container ufps-footer">
            <center><h5 class="text-center">Universidad Francisco de Paula Santander</h5>
                <h6 class="text-center">Programa Ingeniería de Sistemas<br>
                Desarrollador por estudiantes de Seminario Integrador III</h6>
                <h5> 2016</h5>
             </center>
        </div> 
    </footer>
</html>
