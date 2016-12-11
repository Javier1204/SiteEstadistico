<%-- 
    Document   : principal
    Created on : 08-dic-2016, 19:31:58
    Author     : carlos
--%>

<%@page import="Integrador.DTO.InformeDTO"%>
<%@page import="Integrador.Servicio.SrvInforme"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<jsp:include page="../plantilla/header.jsp"></jsp:include>
<!-- Owl Carousel Assets -->        
    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css"/>
    <link href="css/owl.theme.css" rel="stylesheet" type="text/css"/>
    <!-- Prettify -->
    <link href="css/prettify.css" rel="stylesheet" type="text/css"/>
<div id="total">

     

    <div  class="ufps-container" id="contenido">
        
        <div class="col-md-3">
            
        </div>
        
        
        <br>
        <br>
        <div class="panel-heading" style=" text-align: right;"><a style="text-decoration:none; color: white;" href="listar_publicaciones.jsp"><img src="../public/img/integrador/visualizar.png"  height="30px" width="30px" title="Visualizar informes" style="margin-right: 20px;">Visualizar informes</a></div>
        <!--Carrousel-->
       
        <div id="owl-demo" class="col-md-9">

            <div class="item"> 
                <img src="../public/img/integrador/1.png" height="180px" width="356px" alt=""/>
            </div>           
            <div class="item"> 
                <img src="../public/img/integrador/2.jpg" height="180px" width="356px" alt=""/>
            </div>
            <div class="item">
                <img src="../public/img/integrador/3.png" height="180px" width="356px" alt=""/>
            </div>
             <div class="item">
                <img src="../public/img/integrador/4.jpg" height="180px" width="356px" alt=""/>
            </div>
             <div class="item">
                <img src="../public/img/integrador/5.jpg" height="180px" width="356px" alt=""/>
            </div>
                


        </div>

        <!Fin carousel-->
        <!-- Paneles -->
        <hr style="height: 2px; background: #d61117; margin-left: 0%">
        <div class="row" id="paneles">
            <div class="col-xs-12 col-md-4"> 
                <div class="panel" id="panel1">
                    <div class="panel-heading" style="text-align: center"><Strong>SITE ESTADISTICO</strong></div>
                            <div class="panel-body text-justify"><h5>
                      Site estadistico es desarrollado por los estudiantes de la materia de integrador III del programa 
                      de ingenieria de sistemas y tiene como objetvo ofrecer los serivicios de administracion de los modulo de internacionalizacion,
                      actividades academicas, carga academica, grupo asesorias, practicas, proyectos academicos, proyectos de grupos de investigacion
                      y semilleros con el fin de ofrecer un apoyo a nivel de gestion en las diferentes actividades que lleva a cabo  el programa de ingenieria de sistemas.
                                    
                        </h5></div>
                </div>
            </div>
            <div class="col-xs-12 col-md-4"> 
                <div class="panel" id="panel2">
                    <div class="panel-heading" style="text-align: center"><strong>MISION</strong></div>
                    <div class="panel-body text-justify"><h5>El Programa de Ingeniería de Sistemas de la UFPS está comprometido en la formación integral de profesionales competentes en el Desarrollo y Gestión de Sistemas de Información, caracterizados por una sólida fundamentación en las áreas de las ciencias de la computación e informática, enmarcado en un Proyecto Educativo fundamentado en el mejoramiento continuo de los procesos de docencia, investigación y extensión; basados en los principios de excelencia académica, con responsabilidad y compromiso con los procesos de transformación de la región y del país; contando con docentes de calidad con altas cualidades personales y profesionales, con una adecuada infraestructura física y tecnológica.</h5></div>
                </div>
            </div>
            <div class="col-xs-12 col-md-4"> 
                <div class="panel" id="panel3">
                    <div class="panel-heading" style="text-align: center"><strong>VISION</strong></div>
                    <div class="panel-body text-justify"><h5>El Programa de Ingeniería de Sistemas proyecta para el 2017 continuar siendo un programa acreditado de alta calidad, manteniendo los procesos de mejoramiento continuo, líder en la formación de Ingenieros de Sistemas competentes en el desarrollo y Gestión de Sistemas de Información, comprometidos con el desarrollo tecnológico de la región y del país, afrontando las situaciones cambiantes del medio, respondiendo a los retos que presenta el uso masivo de las Tecnologías de Información y Comunicación. Apoyados en una estructura curricular flexible, con un equipo administrativo idóneo, con docentes de calidad con altas cualidades personales y profesionales, con una adecuada infraestructura física y tecnológica.</h5></div>
                </div>
            </div>
        </div>

       

    </div>



<script src="js/jquery-3.1.1.js" type="text/javascript"></script>
<script src="js/owl.carousel.js" type="text/javascript"></script>


<script>
    $(document).ready(function () {
        $("#owl-demo").owlCarousel({
            autoPlay: 3000,
            items: 3,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [979, 3]
        });

    });
</script>
    
    
 </div>    
<jsp:include page="../plantilla/footer.jsp"></jsp:include>
</body>
</html>