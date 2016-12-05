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
    <link href="css/ufps.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/jquery.datetimepicker.min.css" rel="stylesheet">
    

 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.bootstrap.min.css"/>
    
    <!--uso de ajax para recargar segmento-->
   <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
   <script type="text/javascript">
  $(document).ready(function() {
    $("#Registrar_Ponente").click(function(event) {
      $("#divRecargable").load('formularios/formRegistro_Ponente.jsp');
    });
    $("#Reporte_Actividad").click(function(event) {
      $("#divRecargable").load('formularios/reporeactividad.jsp');
    });
    $("#Reporte_Semestre").click(function(event) {
      $("#divRecargable").load('formularios/reporesemestrr.jsp');
    });
    $("#Reporte_Estudiante").click(function(event) {
      $("#divRecargable").load('formularios/reporeestudia.jsp');
    });
  });
</script>

<script type="text/javascript">
  $(document).ready(function() {
    $("#Registrar_Actividad").click(function(event) {
      $("#divRecargable").load('formularios/formRegistro_Actividad.jsp');
    });
  });
</script>
<script type="text/javascript">
  $(document).ready(function() {
    $("#Registrar_Asistencia").click(function(event) {
      $("#divRecargable").load('formularios/formRegistro_Asistencias.jsp');
    });
  });
</script>
</head>  
<body>
    <!--header-->
    <header>
            <img src="img/Banner-superior.png" alt="imagen" width="100%"></img>
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
             <img src="img/bienvenida.jpg" class="img-responsive img-circle" alt="Responsive image" width="67%" > 
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
    <script src="js/ufps.min.js"></script>
    <script src="js/jquery-2.1.1.js"></script>
     
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/funciones.js"></script>
    
    <script src="js/jquery.datetimepicker.full.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>

</body>
</html>