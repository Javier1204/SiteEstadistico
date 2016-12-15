<%-- 
    Document   : header
    Created on : 6/10/2016, 03:48:21 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Departamento de sistemas e Informática UFPS</title>
        <link href="../public/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/styles.css" rel="stylesheet">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/default.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/highlight.min.js"></script>
        <script src="../public/js/jquery-2.1.1.js"></script>
        <script src="../public/js/ufps.js"></script>

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>JSP Page</title>
    </head>
 <header>
            <center> <img id="banner" src="../public/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header>
        <div class="ufps-navbar ufps-navbar ufps-navbar-light" id="menuPrincipal">
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
                    <div class="ufps-dropdown" id="dropdown4">
                        <button onclick="openDropdown('dropdown4')" class="ufps-dropdown-btn">Componentes</button>
                        <div class="ufps-dropdown-content">
                        
                            <a href="#" onclick="ModuloPrimerSemestre();"> Primer Semestre </a>
                        </div>
                    </div>            
                </div>
                
                <div class="ufps-navbar-right">
                    <div class="ufps-navbar-corporate">
                        <a href="" class="ufps-navbar-btn"> Administrador </a>
                    </div>
                </div>

            </div>
        </div>
        <div id="mostrarcontenido" >
            
            

    













<!DOCTYPE html>


<html>


<!-- Mirrored from webapplayers.com/inspinia_admin-v2.5/dashboard_4.html


 <link href="../EstudiantesdeprimerSemestre/css/bootstrap.min.css" rel="stylesheet">






by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Apr 2016 18:57:38 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Departamento de sistemas e Informática UFPS</title>

    <link href="../EstudiantesdeprimerSemestre/css/bootstrap.min.css" rel="stylesheet">

    <link href="../EstudiantesdeprimerSemestre/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="../EstudiantesdeprimerSemestre/css/animate.css" rel="stylesheet">
    <link href="../EstudiantesdeprimerSemestre/css/style.css" rel="stylesheet">
 
    
   
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css"/>

    
    
    
    
    
</head>

<body class="top-navigation">

    <div id="wrapper">
        <div id="" class="gray-bg">
        
         <div class="wrapper wrapper-content animated fadeInRight">
             <div class="container" >
           
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content text-center p-md">

                                <h2><span class="text-navy">Recolecion de datos personales y academicos  </span>
                                 de los estudiantes de primer  <br/>semestre de Ingenieria de sistemas - UFPS.</h2>

                                


                            </div>
                        </div>
                    </div>
                </div>
                  <div class="row">
                      <div class="row ">
                     <div class="col-lg-12 text-center">
                         <div class="">
                             <a href="../EstudiantesdeprimerSemestre/indexAdmin.jsp" >
                                 <h2 class="text-center text-navy"> VOLVER</h2>
                               
                             </a>
                         </div>
                     </div>
                      </div>
                 </div>
                 <div id="contenidoModulo">
                 <div class="row">
                       <%--<div class="col-lg-4">
                         <div class="contact-box">
                             <a href="#" onclick="MDEregistrarFormulario();">
                                 <h2 class="text-center text-navy"> Registrar Formulario</h2>
                                
                             </a>
                         </div>
                     </div>
                    
                    <div class="col-lg-4">
                        <div class="contact-box">
                             <a href="#" onclick="MDEeditarFormulario();">
                                 <h2 class="text-center">Editar Formulario</h2>
                                
                             </a>
                         </div>                      
                    </div> --%>
                    <div class="col-lg-4">
                        <div class="contact-box">
                             <a href="#" onclick="MDEconsultarFormulario();">
                                 <h2 class="text-center text-navy">Consultar Formulario</h2>
                                
                             </a>
                         </div>                        
                    </div>
                    
                </div>
                 </div>      
            </div>

        </div>
        

        </div>
        </div>



    <!-- Mainly scripts -->
    <script src="../EstudiantesdeprimerSemestre/js/jquery-2.1.1.js"></script>
    <script src="../EstudiantesdeprimerSemestre/js/bootstrap.min.js"></script>
    
    
    
<script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>

    
    <script src="../EstudiantesdeprimerSemestre/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../EstudiantesdeprimerSemestre/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="../EstudiantesdeprimerSemestre/js/inspinia.js"></script>
    <script src="../EstudiantesdeprimerSemestre/js/plugins/pace/pace.min.js"></script>

    <!-- Flot -->
    <script src="../EstudiantesdeprimerSemestre/js/plugins/flot/jquery.flot.js"></script>
    <script src="../EstudiantesdeprimerSemestre/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="../EstudiantesdeprimerSemestre/js/plugins/flot/jquery.flot.resize.js"></script>

    <!-- ChartJS-->
    <script src="../EstudiantesdeprimerSemestre/js/plugins/chartJs/Chart.min.js"></script>

    <!-- Peity -->
    <script src="../EstudiantesdeprimerSemestre/js/plugins/peity/jquery.peity.min.js"></script>
    <!-- Peity demo -->
    <script src="../EstudiantesdeprimerSemestre/js/demo/peity-demo.js"></script>
       <script src="../EstudiantesdeprimerSemestre/js/funciones.js"></script>
       

    
    

    
    



    <script>
        $(document).ready(function() {


            var d1 = [[1262304000000, 6], [1264982400000, 3057], [1267401600000, 20434], [1270080000000, 31982], [1272672000000, 26602], [1275350400000, 27826], [1277942400000, 24302], [1280620800000, 24237], [1283299200000, 21004], [1285891200000, 12144], [1288569600000, 10577], [1291161600000, 10295]];
            var d2 = [[1262304000000, 5], [1264982400000, 200], [1267401600000, 1605], [1270080000000, 6129], [1272672000000, 11643], [1275350400000, 19055], [1277942400000, 30062], [1280620800000, 39197], [1283299200000, 37000], [1285891200000, 27000], [1288569600000, 21000], [1291161600000, 17000]];

            var data1 = [
                { label: "Data 1", data: d1, color: '#17a084'},
                { label: "Data 2", data: d2, color: '#127e68' }
            ];
            $.plot($("#flot-chart1"), data1, {
                xaxis: {
                    tickDecimals: 0
                },
                series: {
                    lines: {
                        show: true,
                        fill: true,
                        fillColor: {
                            colors: [{
                                opacity: 1
                            }, {
                                opacity: 1
                            }]
                        },
                    },
                    points: {
                        width: 0.1,
                        show: false
                    },
                },
                grid: {
                    show: false,
                    borderWidth: 0
                },
                legend: {
                    show: false,
                }
            });

            var lineData = {
                labels: ["January", "February", "March", "April", "May", "June", "July"],
                datasets: [
                    {
                        label: "Example dataset",
                        fillColor: "rgba(220,220,220,0.5)",
                        strokeColor: "rgba(220,220,220,1)",
                        pointColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: [65, 59, 40, 51, 36, 25, 40]
                    },
                    {
                        label: "Example dataset",
                        fillColor: "rgba(26,179,148,0.5)",
                        strokeColor: "rgba(26,179,148,0.7)",
                        pointColor: "rgba(26,179,148,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(26,179,148,1)",
                        data: [48, 48, 60, 39, 56, 37, 30]
                    }
                ]
            };

            var lineOptions = {
                scaleShowGridLines: true,
                scaleGridLineColor: "rgba(0,0,0,.05)",
                scaleGridLineWidth: 1,
                bezierCurve: true,
                bezierCurveTension: 0.4,
                pointDot: true,
                pointDotRadius: 4,
                pointDotStrokeWidth: 1,
                pointHitDetectionRadius: 20,
                datasetStroke: true,
                datasetStrokeWidth: 2,
                datasetFill: true,
                responsive: true,
            };


            var ctx = document.getElementById("lineChart").getContext("2d");
            var myNewChart = new Chart(ctx).Line(lineData, lineOptions);

        });
    </script>

</body>


<!-- Mirrored from webapplayers.com/inspinia_admin-v2.5/dashboard_4.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Apr 2016 18:57:38 GMT -->
</html>
        </div>
</html>