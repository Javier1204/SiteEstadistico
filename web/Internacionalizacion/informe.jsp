<%-- 
    Document   : informe
    Created on : 1/12/2016, 05:00:31 AM
    Author     : JAVIER
--%>


<%@page import="Internacionalizacion.Modelo.DAO.DAOEstadistico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INFORME</title>
        
        <link href="img/favicon.ico" rel="shortcut icon"/>
        <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
        <meta charset="utf-8">
        <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Metaetiqueta para la correcta visualizaciÃ³n en dispositivos moviles-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--AÃ±ada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
        <link href="../public/css/ufps.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/ufps-estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
       


        <!--LibrerÃ­as para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!--Algunos componentes requieren el uso de la librerÃ­a en javascript-->

        <script src="js/jquery-3.1.1.js" type="text/javascript"></script>
        <script src="js/jquery-3.1.0.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="../public/js/ufps.js" type="text/javascript"></script>
        <script src="../public/js/ufps.min.js" type="text/javascript"></script>
        <script src="js/formconvenio.js" type="text/javascript"></script>
        
    </head>
    <body>
        
    <jsp:include page="../plantilla/header.jsp"></jsp:include>
                
    <center><h1>INFORME GENERAL DE LOS CONVENIOS Y ACTIVIDADES</h1></center>
    
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        
    <%
        DAOEstadistico e = new DAOEstadistico();
    
    
    int cantidad = e.consultarCantidadConvenios();
    
    %>
    
    
    

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Convenios', cantidad]
          
        ]);

        // Set chart options
        var options = {'title':'Cantidad de convenios',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  </head>

  
    <!--Div that will hold the pie chart-->
    <div id="chart_div"></div>
  
    
    
    
    
    
    </body>
    <a href="registrarConvenio.jsp"><input type="button" class="ufps-btn" value="REGRESAR"> </a> 
    
    <!--FOOTER-->
    <div class="ufps-container ufps-footer " style="height: 70px">
        <h4 class="text-center">Universidad Francisco de Paula Santander</h4>
        <h4 class="text-center">Programa Ingeniería de Sistemas</h4>
        <h5>Desarrollador por: Francisco Javier Duarte García - Heiner Enrique Villamizar Molina</h5>
    </div>   
    
</html>
