<%-- 
    Document   : principal
    Created on : 3/10/2016, 04:29:47 PM
    Author     : JAVIER
--%>

<%@page import="Internacionalizacion.Modelo.DTO.Docente"%>
<%@page import="Internacionalizacion.Facade.Facade"%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingenieria de sistemas</title>

    <a href="img/favicon.ico"></a>
    <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
    <meta charset="utf-8">
    <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Metaetiqueta para la correcta visualizaciÃ³n en dispositivos moviles-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--AÃ±ada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
    <!--<link href="Vista/css/ufps.css" rel="stylesheet" type="text/css"/>-->        
    <!--<link href="Vista/css/styles.css" rel="stylesheet" type="text/css"/>-->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="../public/css/ufps.css" rel="stylesheet" type="text/css"/>
    <link href="../public/css/ufps-estilo.css" rel="stylesheet" type="text/css"/>    

    <link href="css/bootstrapTheme.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">

    <!-- Owl Carousel Assets -->        
    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css"/>
    <link href="css/owl.theme.css" rel="stylesheet" type="text/css"/>
    <!-- Prettify -->
    <link href="css/prettify.css" rel="stylesheet" type="text/css"/>
    <!--Librerías para compatibilidad con versiones antiguas de Internet Explorer-->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!--Algunos componentes requieren el uso de la librerÃ­a en javascript-->

    <script src="../../public/js/ufps.js" type="text/javascript"></script>
    <script src="../../public/js/ufps.min.js" type="text/javascript"></script>
    <script src="../../public/js/ufps.min.js" type="text/javascript"></script>


</head>
<body>
    <jsp:include page="../plantilla/header.jsp"></jsp:include>
    <!--
    <header>
        <center> <img id="banner" src="../public/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
    </header>  
    

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
                <li><a href="Vista/registrarActividad.jsp"  class="ufps-navbar-btn  " >Actividades </a></li>
                <li><a href="Vista/registrarEntidad.jsp"  class="ufps-navbar-btn  " >Registro Entidad </a></li>
                <li><a href="Vista/registrarConvenio.jsp"  class="ufps-navbar-btn  " >Registro Convenio</a></li>
                <li><a href="Vista/consultarConvenios.jsp"  class="ufps-navbar-btn  " >Consultar Convenios</a></li>

                
            </div>
            <div class="ufps-navbar-right nav">
                <li> <a href="" class="ufps-navbar-btn "><span class="glyphicon glyphicon-user"></span> Iniciar Sesión </a></li>

            </div>

        </div>
    </div>
    -->
    <!--Contenido-->
    
    

    <div  class="ufps-container" id="contenido">
        
        <div class="col-md-3"><a href="registrarConvenio.jsp" class="ufps-btn" style="font-size: 16px">Gestionar Convenios</a>
    <a href="registrarActividad.jsp" class="ufps-btn" style="font-size: 16px">Gestionar Actividades</a>
        </div>
         
        <!--Carrousel-->
       
        <div id="owl-demo" class="col-md-9">

            <div class="item"> 
                <img src="img/Banner_120_2016.png" alt=""/>
            </div>           
            <div class="item"> 
                <img src="img/Banner_124_2016_2.png" alt=""/>
            </div>
            <div class="item">
                <img src="img/Banner_127_2016.png" alt=""/>
            </div>
            <div class="item">
                <img src="img/Banner_131_2016.png" alt=""/>
            </div>    
            <div class="item">
                <img src="img/Banner_153_2016.png" alt=""/>
            </div>    
            <div class="item">
                <img src="img/Banner_165_2016.png" alt=""/>
            </div>    


        </div>

        <!Fin carousel-->
        <!-- Paneles -->
        <hr style="height: 2px; background: #d61117; margin-left: 0%">
        <div class="row" id="paneles">
            <div class="col-xs-12 col-md-4"> 
                <div class="panel" id="panel1">
                    <div class="panel-heading" style="text-align: center"><Strong>CONVENIOS</strong></div>
                    <div class="panel-body text-justify"><h5>La Universidad como apoyo a su Política de Internacionalización busca desarrollar el ámbito de cooperación conjunta con reconocidas instituciones extranjeras mediante la suscripción de convenios encaminados al intercambio de la comunidad universitaria en general. Una vez definidas las áreas de colaboración se formalizarán los convenios de cooperación académica internacional, según sea el caso.</h5></div>
                </div>
            </div>
            <div class="col-xs-12 col-md-4"> 
                <div class="panel" id="panel2">
                    <div class="panel-heading" style="text-align: center"><strong>MOVILIDAD ESTUDIANTIL</strong></div>
                    <div class="panel-body text-justify"><h5>La Universidad Francisco de Paula Santander entre sus objetivos contempla la proyección internacional, y la movilidad académica es considerada como factor determinante para el logro del mismo; mediante la movilidad la comunidad estudiantil podrá participar en actividades académicas durante un periodo de tiempo determinado, como estudiante siendo aceptado previamente en una institución reconocida podrá desarrollar su práctica profesional, pasantía o intercambio; participar en eventos académicos o cursos cortos e incluso adelantar labores de gestión institucional.</h5></div>
                </div>
            </div>
            <div class="col-xs-12 col-md-4"> 
                <div class="panel" id="panel3">
                    <div class="panel-heading" style="text-align: center"><strong>OFICINA INTERNACIONAL SISTEMAS</strong></div>
                    <div class="panel-body text-justify"><h5>La oficina de Relaciones Internacionales de la Universidad Francisco de Paula Santander, ha optado por realizar acciones y establecer contactos pertinentes que favorezcan el desarrollo y cristalicen la Política de Internacionalización, mediante la búsqueda, suscripción y mantenimiento de vínculos de cooperación con instituciones del exterior, que permitan instaurar programas de interés común para estudiantes, docentes e investigadores.</h5></div>
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
        <h4 class="text-center">Universidad Francisco de Paula Santander</h4>
        <h4 class="text-center">Programa Ingeniería de Sistemas</h4>
        <h5>Desarrollador por: Francisco Javier Duarte García - Heiner Enrique Villamizar Molina</h5>

    </div>   
</body>

<script src="js/jquery-3.1.1.js" type="text/javascript"></script>
<script src="js/owl.carousel.js" type="text/javascript"></script>


<script>
    $(document).ready(function () {
        $("#owl-demo").owlCarousel({
            autoPlay: 3000,
            items: 2,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [979, 3]
        });

    });
</script>

<script src="js/bootstrap-collapse.js"></script>
<script src="js/bootstrap-transition.js"></script>
<script src="js/bootstrap-tab.js"></script>
<script src="js/google-code-prettify/prettify.js"></script>   
<script src="js/application.js"></script>

</html>
