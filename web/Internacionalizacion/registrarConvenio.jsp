<%@page import="Internacionalizacion.Modelo.DTO.Docente"%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="Internacionalizacion.Modelo.DTO.Entidad"%>
<%@page import="Internacionalizacion.Modelo.DTO.Entidad"%>
<%@page import="Internacionalizacion.Facade.Facade"%>
<%@page import="Internacionalizacion.Modelo.DTO.Convenio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Internacionalizacion.Controlador.ControladorConvenio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ICuenta cuenta = (ICuenta) session.getAttribute("usuario");
    if (cuenta == null) {

        response.sendRedirect("../Integrador/login.jsp");

    }

    Facade fachada = new Facade();
    Docente d = null;
    if (cuenta != null) {
        String codigo = cuenta.getUser();
        d = fachada.consultarDocente(codigo);
        if (!d.isHabilitado()) {

%>

<%            response.sendRedirect("index.jsp");
        }
    }
    //Convenio con = new Convenio();
    if (request.getSession().getAttribute("respuesta_actividad") != null) {

%>
<!--<div class="ufps-alert-green" center>
    <span class="ufps-close-alert-btn">x</span> Se registro Correctamente la actividad!.
</div>


    <script type="text/javascript">
    alert("Registro exitoso!");
    </script>-->
<%}
    request.getSession().setAttribute("respuesta_actividad", null);
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actividades Convenios</title>
        <link href="img/favicon.ico" rel="shortcut icon"/>
        <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
        <meta charset="utf-8">
        <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Metaetiqueta para la correcta visualizaciÃ³n en dispositivos moviles-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--AÃ±ada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
        <link href="css/csspropio.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/ufps.css" rel="stylesheet" type="text/css"/>


        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>


        <!--LibrerÃ­as para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!--Algunos componentes requieren el uso de la librerÃ­a en javascript-->
        <script src="js/moment.js" type="text/javascript"></script>
        <script src="js/jquery-3.1.1.js" type="text/javascript"></script>
        <script src="js/jquery-3.1.0.min.js"></script>
        <link href="css/datepicker.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="../public/js/ufps.js" type="text/javascript"></script>        
        <script src="../public/js/ufps.min.js" type="text/javascript"></script>
        <script src="js/formconvenio.js" type="text/javascript"></script>
        <script src="js/bootstrap-datepicker.js" type="text/javascript"></script>

    </head>
    <body>
        <jsp:include page="../plantilla/header.jsp"></jsp:include>



            <!--Contenido-->
            <div  class="ufps-container" style="" id="contenido">


                <div class="ufps-row">
                    <div class="col-md-2" style="padding-left: 0px;">

                        <ul class="nav nav-pills nav-stacked"><br>
                            <input type="button" id="registrarconvenio" class="ufps-btn-accordion" value="Registrar Convenio"><br><br>
                            <input type="button" id ="registrarentidad" class="ufps-btn-accordion" value="Registrar Entidad"><br><br>
                            <input type="button" id="consultarconvenios" class="ufps-btn-accordion" value="Consultar convenios"><br><br>
                            <input type="button" id="habilitarDocente" class="ufps-btn-accordion" value="Habilitar Docente"><br><br>
                            <input type="button" id="generarinforme" class="ufps-btn-accordion" value="Generar informe"><br><br>
                            <input type="button" id="subirinforme" class="ufps-btn-accordion" value="Subir Informe"><br><br>
                            <a href="generarexcel.jsp" type="button" class="ufps-btn-accordion" value="Generar Excel">Generar Excel</a>
                          
                            <input type="button" class="ufps-btn" value="Cerrar Sesión">
                            
                        </ul>

                    </div>
                    <div class="col-md-10">
                        <div id="destino">
                        <jsp:include page="registroconvenio.jsp"></jsp:include>
                    </div>
                </div>

                <br>


            </div>

        </div>


    </body>

    <!--Footer-->

    <div class="ufps-container ufps-footer " style="height: 70px">
        <h4 class="text-center">Universidad Francisco de Paula Santander</h4>
        <h4 class="text-center">Programa Ingeniería de Sistemas</h4>
        <h5>Desarrollador por: Francisco Javier Duarte García - Heiner Enrique Villamizar Molina</h5>
    </div>   

    <script>
        $(document).ready(function () {
            //$("#destino").load("#registroconvenio.jsp");
        });
    </script>
</html>
