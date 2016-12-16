<%-- 
    Document   : index
    Created on : 23/11/2016, 09:17:57 PM
    Author     : WILSON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
    <meta charset="utf-8">
    <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Metaetiqueta para la correcta visualización en dispositivos moviles-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0">
    <title>Departamento de sistemas e Informática UFPS</title>
    <!--Añada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
    <link href="vistas/css/ufps.min.css" rel="stylesheet">
    <link href="vistas/css/styles.css" rel="stylesheet">
    <link href="vistas/css/bootstrap.min.css" rel="stylesheet">
    <link href="vistas/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="vistas/css/bootstrap.css" rel="stylesheet">
    <link href="vistas/css/metisMenu.min.css" rel="stylesheet">
    <link href="vistas/fonts/glyphicons-halflings-regular.svg" rel="stylesheet">
    <link href="vistas/css/jquery.datetimepicker.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="vistas/css/bootstrap3.3.7.min.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="vistas/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="vistas/css/buttons.bootstrap.min.css" rel="stylesheet">
    
    <!--uso de ajax para recargar segmento-->
   <script type='text/javascript' src="vistas/js/jquery1.8.3.min.js"></script>
   <script type="text/javascript">
  $(document).ready(function() {
    $("#Reporte_Actividad").click(function(event) {
      $("#divRecargable").load('vistas/formularios/reporeactividad.jsp');
    });
  });
</script>

<script type="text/javascript">
  $(document).ready(function() {
    $("#Reporte_Estudiante").click(function(event) {
      $("#divRecargable").load('vistas/formularios/reporeestudia.jsp');
    });
  });
</script>
<script type="text/javascript">
  $(document).ready(function() {
    $("#Reporte_Semestre").click(function(event) {
      $("#divRecargable").load('vistas/formularios/reporesemestrr.jsp');
    });
  });
</script>
<script type="text/javascript">
  $(document).ready(function() {
    $("#Registrar_Ponente").click(function(event) {
      $("#divRecargable").load('vistas/formularios/formRegistro_Ponente.jsp');
    });
  });
</script>

<script type="text/javascript">
  $(document).ready(function() {
    $("#Registrar_Actividad").click(function(event) {
      $("#divRecargable").load('vistas/formularios/formRegistro_Actividad.jsp');
    });
  });
</script>
<script type="text/javascript">
  $(document).ready(function() {
    $("#Registrar_Asistencia").click(function(event) {
      $("#divRecargable").load('vistas/formularios/formRegistro_Asistencias.jsp');
    });
  });
</script>
</head>  
<body>
    <!--header-->
    <header>            
         
         <jsp:include page="../plantilla/header.jsp"/>
         
    </header>  
                   
        <!--Contenido-->
         <br>
         <!--acordeon-->
    <div class="ufps-row" >
           <div class="ufps-col-mobile-12 ufps-col-netbook-3" > 

          <div class="ufps-accordion">

              <button class="ufps-btn-accordion btn-danger">REGISTRAR</button>
             <div class="ufps-accordion-panel">                    
                     <button type="button" class="btn btn-default btn-lg" value="Registrar Actividad" id="Registrar_Actividad">
                    <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Registrar Actividad
                    </button>
                    <br>
                     <button type="button" class="btn btn-default btn-lg" value="Registrar Asistencia" id="Registrar_Asistencia">
                    <span class="glyphicon glyphicon-check" aria-hidden="true"></span> Registrar Asistencia
                    </button>
                    <br>
                    <button type="button" class="btn btn-default btn-lg" value="Registrar Ponente" id="Registrar_Ponente">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Registrar Ponente
                    </button>
             </div>
              
               <button class="ufps-btn-accordion btn-danger">REPORTES</button>
             <div class="ufps-accordion-panel">
                    <button type="button" class="btn btn-default btn-lg" value="Reporte Actividad" id="Reporte_Actividad">
                    <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span> Reporte de Actividad
                    </button>
                    <br>
                    <button type="button" class="btn btn-default btn-lg" value="Reporte Semestre" id="Reporte_Semestre">
                    <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Reporte de Semestre
                    </button>
                    <br>
                    <button type="button" class="btn btn-default btn-lg" value="Reporte Estudiante" id="Reporte_Estudiante">
                    <span class="glyphicon glyphicon-education" aria-hidden="true"></span> Reporte de Estudiante
                    </button>
             </div>
          </div> 
              <br>
              <!--modal-->
             <center>
             <button class="ufps-btn" onclick="openModal('modal')">Importante</button>
           <div id="modal" class="ufps-modal">
            <div class="ufps-modal-content">
             <div class="ufps-modal-header-red">
               <span class="ufps-modal-close">×</span>
                 <h2>Recomendación</h2>
             </div>
             <div class="ufps-modal-body">
            <p>Para agregar una actividad:</p>
            <p> debe estar registrado el ponente o el encargado, si no lo está  primero
                registrelo en la seccion  ponente, click en registrar </p>
             </div>
             <div class="ufps-modal-footer">
            <h3> Si ya esta registrado haga caso omiso a este mensaje</h3>
             </div>
            </div>
           </div> 
           </div>
           </center>

              <!--formulario de recargable-->

        <div id="divRecargable" class="ufps-col-mobile-12 ufps-col-netbook-9" > 
                  <!--Aqui voy a colocar esta seccion para ver imagenes que corran dinamicamente-->
                  <center>
               <form id="bienvenida">
             <img src="vistas/img/bienvenida.jpg" class="img-responsive img-circle" alt="Responsive image" width="67%" > 
             </form>
             </center>
             </div>


    </div >
         <!--footer-->
         
        <div class="ufps-container ufps-footer ">
        <h3>Universidad Francisco de Paula Santander</h3>
        <p>Programa Ingeniería de Sistemas</p>
        </div>  

    <!--Algunos componentes requieren el uso de la librería en javascript-->
    <script src="vistas/js/ufps.min.js"></script>
    <script src="vistas/js/jquery-2.1.1.js"></script>
     
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="vistas/js/funciones.js"></script>
    
    <script src="vistas/js/jquery.datetimepicker.full.js"></script>
    <script type="text/javascript" src="vistas/js/jszip.min.js"></script>
<script type="text/javascript" src="vistas/js/pdfmake.min.js"></script>
<script type="text/javascript" src="vistas/js/pdfmakefonts.min.js"></script>
<script type="text/javascript" src="vistas/js/dataTables.min.js"></script>
<script type="text/javascript" src="vistas/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="vistas/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="vistas/js/buttons.bootstrap.min.js"></script>
<script type="text/javascript" src="vistas/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="vistas/js/buttons.print.min.js"></script>

</body>
</html>