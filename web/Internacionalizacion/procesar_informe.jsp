<%-- 
    Document   : procesar_informe
    Created on : 11/12/2016, 04:18:44 PM
    Author     : JAVIER
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Internacionalizacion.Modelo.DAO.DAOEstadistico"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../public/css/ufps.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/ufps-estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/informe.js" type="text/javascript"></script>
        
        <script src="js/jquery-3.1.1.js" type="text/javascript"></script>
        <script src="js/jquery-3.1.0.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="../public/js/ufps.js" type="text/javascript"></script>
        <script src="../public/js/ufps.min.js" type="text/javascript"></script>
        <script src="js/formconvenio.js" type="text/javascript"></script>
        
        <title>INFORME GENERAL</title>
        
    </head>
    
    <body>
        <jsp:include page="../plantilla/header.jsp"></jsp:include>
        
        <center><h1>INFORME GENERAL DE LOS CONVENIOS, ACTIVIDADES Y ENTIDADES</h1></center>
        
    <%
        System.out.print("-----------");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String semestre = request.getParameter("semestre");
        String año = request.getParameter("año");
        String rango = request.getParameter("rango");
        String desde = request.getParameter("desde");
        String hasta = request.getParameter("hasta");
        int cantidad = 0;
        int activos = 0;
        
        System.out.print(desde +"-----------"+hasta);
        DAOEstadistico e = new DAOEstadistico();  
        
        if(rango == null){
            //Cantidad de convenios registrados.
        cantidad = e.consultarCantidadConvenios(desde, hasta);
        activos = e.consultarCantidadConveniosActivos(desde, hasta);
        //ArrayList<String> estados = e.consultarConveniosporEstado(desde, hasta);
        //ArrayList<String> tipos = e.consultarConveniosporTipo(desde, hasta);
        }
        
        
    
    %>    
        
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        
    
                
    </script>
        
    <script type="text/javascript">
    

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      google.charts.setOnLoadCallback(drawChart);
      // Set a callback to run when the Google Visualization API is loaded.
     

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        
        data.addRows([
          ['Movilidad', 1],
          ['Extension', 2],
          ['Practica', 0],
          ['Social', 0],
          ['Pasantia', 1],
          ['Investigacion', 0]
          
          
        ]);

        // Set chart options
        var options = {'title':'Cantidad de actividades por Tipo',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));
        chart.draw(data, options);
        
      }
    
    </script>
    
    <script>

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
          ['Aprobado', 4],
          ['Terminado', 1]
          
          
          
        ]);

        // Set chart options
        var options = {'title':'Convenios por estado',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
        chart.draw(data, options);
      }
    
</script>

<script>
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
          ['Privado', 2],
          ['Publico', 4]
          
          
          
        ]);

        // Set chart options
        var options = {'title':'Entidades por tipo',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
        chart.draw(data, options);
      }
    </script>
    
    <script type="text/javascript">
    

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
          ['2016', 4],
          ['2015', 1]
        
        ]);

        // Set chart options
        var options = {'title':'Convenios radicados por año',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div4'));
        chart.draw(data, options);
      }
    </script>
    
    <script type="text/javascript">
    

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
          ['Agropecuario', 1],
          ['Educacion', 3],
          ['Servicios', 1],
          ['Financiero', 1]
        
        ]);

        // Set chart options
        var options = {'title':'Entidades por sector',
                       'width':600,
                       'height':300,
                   'pieSliceText':'value',
               'fontSize':15,
           slices: [{color: 'black'}, {}, {}, {color: '#00f000'}]};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div5'));
        chart.draw(data, options);
      }
      
    </script>

  
    <!--Div that will hold the pie chart-->
    <div class="row">
        <div id="chart_div" class="col-md-5">
            <br><br><br><h4 class="text-center">Cantidad de convenios registrados en el sistema: <%=cantidad%></h4>
            <br><br><br><h4 class="text-center">Cantidad de convenios activos: <%=activos%></h4>
        </div>
        
        <div id="chart_div1" class="col-md-5">
            
            
            
            
        </div>
    </div>
    <div class="row">
    <div id="chart_div2" class="col-md-5"></div>
    <div id="chart_div3" class="col-md-5"></div>
    </div>
    <div class="row">
    <div id="chart_div4" class="col-md-5"></div>
    <div id="chart_div5" class="col-md-5"></div>
    </div>
    
    
    
    </body>
    <a href="formInforme.jsp"><input type="button" class="ufps-btn" value="REGRESAR"> </a> 
    
    <!--FOOTER-->
    <div class="ufps-container ufps-footer " style="height: 70px">
        <h4 class="text-center">Universidad Francisco de Paula Santander</h4>
        <h4 class="text-center">Programa Ingeniería de Sistemas</h4>
        <h5>Desarrollador por: Francisco Javier Duarte García - Heiner Enrique Villamizar Molina</h5>
    </div>   
</html>
