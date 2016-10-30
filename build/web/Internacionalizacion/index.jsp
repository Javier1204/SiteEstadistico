<%-- 
    Document   : principal
    Created on : 3/10/2016, 04:29:47 PM
    Author     : JAVIER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingenieria de sistemas</title>

        <a href="Vista/img/favicon.ico"></a>
        <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
        <meta charset="utf-8">
        <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Metaetiqueta para la correcta visualizaciÃ³n en dispositivos moviles-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--AÃ±ada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
        <link href="Vista/css/ufps.css" rel="stylesheet" type="text/css"/>        
        <link href="Vista/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="Vista/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!--Librerías para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!--Algunos componentes requieren el uso de la librerÃ­a en javascript-->
        <script src="Vista/js/jquery.min.js" type="text/javascript"></script>
        

        <script src="../../public/js/ufps.js" type="text/javascript"></script>
        <script src="../../public/js/ufps.min.js" type="text/javascript"></script>
        <script src="../../public/js/ufps.min.js" type="text/javascript"></script>
        <script src="Vista/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="Vista/js/bootstrap.js" type="text/javascript"></script>

    </head>
    <body>
        
        <header>
            <center> <img id="banner" src="../public/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header>  
        <!--Menu-->

        <div class="ufps-navbar-light ufps-container " id="menu" >
            <div class="ufps-container-fluid">
                <div class="ufps-navbar-brand">
                    <div class="ufps-btn-menu" onclick="toggleMenu('menu')">
                        <div class="ufps-btn-menu-bar"> </div>
                        <div class="ufps-btn-menu-bar"> </div>
                        <div class="ufps-btn-menu-bar"> </div>
                    </div>

                </div>
                <div class="ufps-navbar-left nav">
                    
                    <li><a href="" class="ufps-navbar-btn" >Home </a></li>
                    <li><a href="Vista/convenios.jsp"  class="ufps-navbar-btn  " >Convenios </a></li>
                    <li><a href="Vista/actividades.jsp"  class="ufps-navbar-btn  " >Actividades </a></li>
                    <li><a href="Vista/registrarEntidad.jsp"  class="ufps-navbar-btn  " >Registro Entidad </a></li>
                    <li><a href="Vista/registrarConvenio.jsp"  class="ufps-navbar-btn  " >Registro Convenio</a></li>


                    </li>
                </div>
                <div class="ufps-navbar-right nav">
                    <li> <a href="" class="ufps-navbar-btn "><span class="glyphicon glyphicon-user"></span> Iniciar Sesión </a></li>

                </div>

            </div>
        </div>

        <!--Contenido-->


        <div  class="ufps-container" id="contenido">

            <!--Carrousel-->
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        
                        <center><img src="Vista/img/Banner_120_2016.png" alt="Chania"></center>

                        <div class="carousel-caption">
                            <div class="animated fadeInDown">
                                <h3 class="h3-responsive"></h3>
                                <p></p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <center><img src="Vista/img/Banner_124_2016_2.png" alt="Chania"></center>
                    </div>

                    <div class="item">
                        <center><img src="Vista/img/Banner_127_2016.png" alt="Flower"></center>
                    </div>

                    <div class="item">
                        <center><img src="Vista/img/Banner_131_2016.png" alt="Flower"></center>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <!-- Paneles -->
            <div class="row" id="paneles">
                <div class="col-xs-12 col-md-4"> 
                    <div class="panel" id="panel1">
                        <div class="panel-heading">Convenios</div>
                        <div class="panel-body text-justify">La Universidad como apoyo a su Política de Internacionalización busca desarrollar el ámbito de cooperación conjunta con reconocidas instituciones extranjeras mediante la suscripción de convenios encaminados al intercambio de la comunidad universitaria en general. Una vez definidas las áreas de colaboración se formalizarán los convenios de cooperación académica internacional, según sea el caso.</div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-4"> 
                    <div class="panel" id="panel2">
                        <div class="panel-heading">Movilidad Estudiantil</div>
                        <div class="panel-body text-justify">La Universidad Francisco de Paula Santander entre sus objetivos contempla la proyección internacional, y la movilidad académica es considerada como factor determinante para el logro del mismo; mediante la movilidad la comunidad estudiantil podrá participar en actividades académicas durante un periodo de tiempo determinado, como estudiante siendo aceptado previamente en una institución reconocida podrá desarrollar su práctica profesional, pasantía o intercambio; participar en eventos académicos o cursos cortos e incluso adelantar labores de gestión institucional.</div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-4"> 
                    <div class="panel" id="panel3">
                        <div class="panel-heading">Oficina Intenacional Ing Sistemas</div>
                        <div class="panel-body text-justify">La oficina de Relaciones Internacionales de la Universidad Francisco de Paula Santander, ha optado por realizar acciones y establecer contactos pertinentes que favorezcan el desarrollo y cristalicen la Política de Internacionalización, mediante la búsqueda, suscripción y mantenimiento de vínculos de cooperación con instituciones del exterior, que permitan instaurar programas de interés común para estudiantes, docentes e investigadores.</div>
                    </div>
                </div>
            </div>

            <div class="ufps-modal" id="iniciosesion">

                <div class="ufps-modal-header-red">
                    <h3>LOGIN</h3>
                </div>
                <div class="ufps-modal-body">

                    Usuario: <input type="text" name="usuario">
                    Contraseña: <input type="password" name="password">

                </div>
                <h1>modal</h1>
            </div>

        </div>

        <div class="ufps-container ufps-footer ">
            <h5 class="text-center">Universidad Francisco de Paula Santander</h5>
            <h6 class="text-center">Programa Ingeniería de Sistemas<br>
                Desarrollador por: Francisco Javier Duarte García - Heiner Enrique Villamizar Molina</h6>


        </div>   
    </body>
    
</html>
