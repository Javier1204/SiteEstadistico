<%-- 
    Document   : convenios
    Created on : 5/10/2016, 05:50:46 PM
    Author     : JAVIER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Convenios - Ingenieria de Sistemas</title>

        <link href="img/favicon.ico" rel="shortcut icon"/>
        <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
        <meta charset="utf-8">
        <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Metaetiqueta para la correcta visualizaciÃ³n en dispositivos moviles-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--AÃ±ada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
        <link href="../../public/css/ufps.css" rel="stylesheet" type="text/css"/>
        <link href="css/ufps.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!--LibrerÃ­as para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!--Algunos componentes requieren el uso de la librerÃ­a en javascript-->

        <script src="js/jquery-3.1.0.min.js"></script>
        <script src="../../public/js/ufps.js" type="text/javascript"></script>
        <script src="../../public/js/ufps.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.min.js"></script>
       
    </head>
    <body>        
        <header>
            
            <center> <img id="banner" src="../../public/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header> 

        <div class="ufps-navbar ufps-container " id="menu" >
            <div class="ufps-container-fluid">
                <div class="ufps-navbar-brand">
                    <div class="ufps-btn-menu" onclick="toggleMenu('menu')">
                        <div class="ufps-btn-menu-bar"> </div>
                        <div class="ufps-btn-menu-bar"> </div>
                        <div class="ufps-btn-menu-bar"> </div>
                    </div>

                </div>
                <div class="ufps-navbar-left nav">
                    
                    <li><a href="../index.jsp" class="  ufps-navbar-btn  " >Home </a></li>
                    <li><a href="convenios.jsp"  class="ufps-navbar-btn  " >Convenios </a></li>
                    <li><a href="registrarActividad.jsp"  class="ufps-navbar-btn  " >Actividades </a></li>


                    </li>
                </div>
                

            </div>
        </div>

        <!--Contenido -->
        <div  class="ufps-container" id="contenido">





            
            <ul class="nav nav-pills nav-justified" id="navegacion-convenios">
                <li id="navegacion-li-convenios"><a href="#">Convenios Macro</a></li>
                <li id="navegacion-li-convenios"><a href="#">Convenios Especifico</a></li>
                <li id="navegacion-li-convenios"><a href="#">Convenios Interinstitucional</a></li>
                
            </ul>


            <div class="row">


                <div class="col-xs-12 col-md-4">
                    <div class="thumbnail">
                        <img src="img/banner-internacional.jpg" alt="imagen de evento">
                        <div class="caption">
                            <h3>Nombre Convenio</h3>
                            <p>Metadatos convenio</p>
                            <p><a href="#" class="btn ufps-btn" role="button">Ver convenio</a></p>
                        </div>
                    </div>

                </div>
                <div class="col-xs-12 col-md-4">
                    <div class="thumbnail">
                        <img src="img/banner-internacional.jpg" alt="imagen de evento">
                        <div class="caption">
                            <h3>Nombre Convenio</h3>
                            <p>Metadatos convenio</p>
                            <p><a href="#" class="btn ufps-btn" role="button">Ver convenio</a></p>
                        </div>
                    </div>

                </div>
                <div class="col-xs-12 col-md-4">
                    <div class="thumbnail">
                        <img src="img/banner-internacional.jpg" alt="imagen de evento">
                        <div class="caption">
                            <h3>Nombre Convenio</h3>
                            <p>Metadatos convenio</p>
                            <p><a href="#" class="btn ufps-btn" role="button">Ver convenio</a></p>
                        </div>
                    </div>


                </div>
            </div>
        </div>


        <div class="ufps-container ufps-footer ">
            <h5>Universidad Francisco de Paula Santander</h5>
            <h6>Programa Ingeniería de Sistemas<br>
                Desarrollador por: Francisco Javier Duarte García - Heiner Enrique Villamizar Molina</h6>
        </div>  
    </body>
</html>
