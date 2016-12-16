<%-- 
    Document   : procesar_informe
    Created on : 11/12/2016, 04:18:44 PM
    Author     : JAVIER
--%>

<%@page import="Internacionalizacion.Modelo.DTO.Estadistico"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Internacionalizacion.Modelo.DAO.DAOEstadistico"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>

<!DOCTYPE html>
<html>
    <head>
        <link href="img/favicon.ico" rel="shortcut icon"/>
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

        <!--Load the AJAX API-->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
        google.charts.load("current", {packages:['corechart']});
        </script>
        
        <title>INFORME GENERAL</title>

    </head>

    <body>
        
             <img src="../public/img/Banner-superior.png" alt=""/>
        <div id="content">
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

        //String [] filtros = request.getParameterValues("filtro");
        //for(String x:filtros)
        //System.out.println(x);
        String activos_registrados = request.getParameter("activos_registrados");
        String estados = request.getParameter("estados");
        String radicados = request.getParameter("radicados");
        String tipos = request.getParameter("tipos");
        //String activos = request.getParameter("activos");

        String act_tipos = request.getParameter("act_tipos");
        String act_convenios = request.getParameter("act_convenios");
        String act_semestre_años = request.getParameter("act_semestre_años");

        String ent_sectores = request.getParameter("ent_sectores");
        String ent_tipos = request.getParameter("ent_tipos");

        String estudiantes = request.getParameter("estudiantes");
        
        int i = 0;
        String titulo = "";
        int cantidad = 0;
        int nactivos = 0;
        String json = "";
        ArrayList<Estadistico> listaestados = new ArrayList();
        ArrayList<Estadistico> listaradicados = new ArrayList();
        ArrayList<Estadistico> listatipos = new ArrayList();
        ArrayList<Estadistico> lista_act_tipo = new ArrayList();
        ArrayList<Estadistico> lista_act_convenios = new ArrayList();
        ArrayList<Estadistico> lista_act_semestre_años = new ArrayList();
        ArrayList<Estadistico> lista_ent_sectores = new ArrayList();
        ArrayList<Estadistico> lista_ent_tipos = new ArrayList();
        ArrayList<Estadistico> lista_estudiantes = new ArrayList();
        
        
        
        
        
        System.out.print(desde + "-----------" + hasta);
        DAOEstadistico e = new DAOEstadistico();

        //Para consultar por el rango de fechas.
        if (rango == null) {
            //Cantidad de convenios registrados.
               
            if (activos_registrados!= null) {
                cantidad = e.consultarCantidadConvenios(desde, hasta);
                nactivos = e.consultarCantidadConveniosActivos(desde, hasta);
             
            }
            if (estados!= null){ 
                listaestados = e.consultarConveniosporEstado(desde, hasta);
              
            }
            if (radicados!= null) {
                listaradicados = e.consultarConveniosporRadicadosPorAños(desde, hasta);
                
            }
            if (tipos!= null) {
                listatipos = e.consultarConveniosporTipo(desde, hasta);
               
            }
            if (act_tipos!= null) {
                lista_act_tipo = e.consultarActividadesporTipos(desde, hasta);
               
            }
            if (act_convenios!= null) {
                lista_act_convenios = e.consultarActividadesporConvenios(desde, hasta);
               
            }
            if (act_semestre_años!= null) {
                lista_act_semestre_años = e.consultarActividadesporSemestre_Años(desde, hasta);
               
            }
            if (ent_sectores!= null) {
                lista_ent_sectores = e.consultarEntidadesporSector(desde, hasta);
               
            }
            if (ent_tipos!= null) {
                lista_ent_tipos = e.consultarEntidadesporTipo(desde, hasta);
               
            }
            if (estudiantes!= null) {
                lista_estudiantes = e.consultarEstudiantesporActividades(desde, hasta);
               
            }
            
        }             

        //Para consultar sin rango de fechas.
        else if (rango != null) {
             
            if (activos_registrados!= null) {
                cantidad = e.consultarCantidadConvenios(null, null);
                nactivos = e.consultarCantidadConveniosActivos(null, null);
             
            }
            if (estados!= null){ 
                listaestados = e.consultarConveniosporEstado(null, null);
              
            }
            if (radicados!= null) {
                listaradicados = e.consultarConveniosporRadicadosPorAños(null, null);
                
            }
            if (tipos!= null) {
                listatipos = e.consultarConveniosporTipo(null, null);
               
            }
             if (act_tipos!= null) {
                lista_act_tipo = e.consultarActividadesporTipos(null, null);
               
            }
             if (act_convenios!= null) {
                lista_act_convenios = e.consultarActividadesporConvenios(null, null);
               
            }
            if (act_semestre_años!= null) {
                lista_act_semestre_años = e.consultarActividadesporSemestre_Años(null, null);
               
            }
            if (ent_sectores!= null) {
                lista_ent_sectores = e.consultarEntidadesporSector(null, null);
               
            }
            if (ent_tipos!= null) {
                lista_ent_tipos = e.consultarEntidadesporTipo(null, null);
               
            }
            if (estudiantes!= null) {
                lista_estudiantes = e.consultarEstudiantesporActividades(null, null);
               
            }
            
           
            }  

    %>    
    <div class="ufps-row">
        <div class="col-md-6 col-md-push-4">
            <h4>
                <%
                    if(rango == null){
                        %>
                        Desde:<%=desde%>
                        <%}
                
                %>
            </h4>
        </div>                 
        <div class="col-md-4">
            <h4>
                 <%
                    if(rango == null){
                        %>
                        Hasta:<%=hasta%>
                        <%}
                
                %>
            </h4>
        </div>
    </div>
    
   
    

    <script type="text/javascript">
    //google.charts.load("current", {packages:['corechart']});
    
   google.charts.setOnLoadCallback(drawChart);
    
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "Total", { role: "style" } ],
        ["Activos", <%=nactivos%>, "#D23C00"],
        ["Registrados", <%=cantidad%>, "#3565C5"]
        
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: 'Convenios activos y registrados',
        width: 600,
        height: 300,
        bar: {groupWidth: "55%"},
        'fontSize': 15,
        legend: { position: "none" }
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("chart_div0"));
      chart.draw(view, options);
    }
      
      </script>
    
    
    <script type="text/javascript">


        // Load the Visualization API and the corechart package.
        //google.charts.load('current', {'packages': ['corechart']});

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart() {

            <%
            Gson g = new Gson();
            String y = g.toJson(listaestados);
            System.out.print(y);
            %>
            
                    var parsed =<%=y%>;
                    console.log(parsed);
                    var miarray=new Array();
                    for(var i=0; i<parsed.length; i++){
                        miarray.push([parsed[i].columna,parsed[i].valor]);
                    }
                    console.log(miarray);
            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');

            data.addRows(miarray);

            // Set chart options
            var options = {'title': 'Convenios por estados',
                'width': 600,
                'height': 300,
                'pieSliceText': 'value',
                'fontSize': 15};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));
            chart.draw(data, options);
        }
      </script>
      
     
  
      

    <script>

        

        
        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        //String x = "[nombre, valor],[nombre,valor]";
        function drawChart() {

            // Create the data table.
            
            <%
            Gson a = new Gson();
            String b = a.toJson(listaradicados);
            System.out.print(b);
            %>
            
                    var parsed =<%=b%>;
                    console.log(parsed);
                    var miarray=new Array();
                    for(var i=0; i<parsed.length; i++){
                        miarray.push([parsed[i].columna,parsed[i].valor]);
                    }
                    console.log(miarray);
                   
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows(miarray);

            // Set chart options
            var options = {'title': 'Convenios radicados por años',
                'width': 600,
                'height': 300,
                'pieSliceText': 'value',
                'fontSize': 15};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
            chart.draw(data, options);
        }

    </script>

    <script>
        // Load the Visualization API and the corechart package.
        //google.charts.load('current', {'packages': ['corechart']});

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart() {
            
            <%
            Gson c = new Gson();
            String d = c.toJson(listatipos);
            System.out.print(d);
            %>
            
                    var parsed =<%=d%>;
                    console.log(parsed);
                    var miarray=new Array();
                    for(var i=0; i<parsed.length; i++){
                        miarray.push([parsed[i].columna,parsed[i].valor]);
                    }
                    console.log(miarray);

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows(miarray);

            // Set chart options
            var options = {'title': 'Convenios por Tipo',
                'width': 600,
                'height': 300,
                'pieSliceText': 'value',
                'fontSize': 15};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
            chart.draw(data, options);
        }
    </script>

    <script type="text/javascript">


        // Load the Visualization API and the corechart package.
        //google.charts.load('current', {'packages': ['corechart']});

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart() {
            
            <%
            Gson f = new Gson();
            String h = f.toJson(lista_act_tipo);
            System.out.print(h);
            %>
            
                    var parsed =<%=h%>;
                    console.log(parsed);
                    var miarray=new Array();
                    for(var i=0; i<parsed.length; i++){
                        miarray.push([parsed[i].columna,parsed[i].valor]);
                    }
                    console.log(miarray);

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows(miarray);

            // Set chart options
            var options = {'title': 'Actividades por Tipo',
                'width': 600,
                'height': 300,
                'pieSliceText': 'value',
                'fontSize': 15};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div4'));
            chart.draw(data, options);
        }
    </script>
    
    <script type="text/javascript">


        // Load the Visualization API and the corechart package.
        //google.charts.load('current', {'packages': ['corechart']});

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart() {
            
            <%
            Gson m = new Gson();
            String n = m.toJson(lista_act_convenios);
            System.out.print(n);
            %>
            
                    var parsed =<%=n%>;
                    console.log(parsed);
                    var miarray=new Array();
                    for(var i=0; i<parsed.length; i++){
                        miarray.push([parsed[i].columna,parsed[i].valor]);
                    }
                    console.log(miarray);

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows(miarray);

            // Set chart options
            var options = {'title': 'Actividades por Convenios',
                'width': 600,
                'height': 300,
                'pieSliceText': 'value',
                'fontSize': 15};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div5'));
            chart.draw(data, options);
        }
    </script>
    
    <script type="text/javascript">


        // Load the Visualization API and the corechart package.
        //google.charts.load('current', {'packages': ['corechart']});

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart() {
            
            <%
            Gson o = new Gson();
            String p = o.toJson(lista_act_semestre_años);
            System.out.print(p);
            %>
            
                    var parsed =<%=p%>;
                    console.log(parsed);
                    var miarray=new Array();
                    for(var i=0; i<parsed.length; i++){
                        miarray.push([parsed[i].columna,parsed[i].valor]);
                    }
                    console.log(miarray);

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows(miarray);

            // Set chart options
            var options = {'title': 'Actividades por semestre y años',
                'width': 600,
                'height': 300,
                'pieSliceText': 'value',
                'fontSize': 15};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div6'));
            chart.draw(data, options);
        }
    </script>
    
    <script type="text/javascript">


        // Load the Visualization API and the corechart package.
        //google.charts.load('current', {'packages': ['corechart']});

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart() {
            
            <%
            Gson r = new Gson();
            String s = r.toJson(lista_ent_sectores);
            System.out.print(s);
            %>
            
                    var parsed =<%=s%>;
                    console.log(parsed);
                    var miarray=new Array();
                    for(var i=0; i<parsed.length; i++){
                        miarray.push([parsed[i].columna,parsed[i].valor]);
                    }
                    console.log(miarray);

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows(miarray);

            // Set chart options
            var options = {'title': 'Entidades por sector',
                'width': 600,
                'height': 300,
                'pieSliceText': 'value',
                'fontSize': 15};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div7'));
            chart.draw(data, options);
        }
    </script>
    
    <script type="text/javascript">


        // Load the Visualization API and the corechart package.
        //google.charts.load('current', {'packages': ['corechart']});

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart() {
            
            <%
            Gson u = new Gson();
            String v = u.toJson(lista_ent_tipos);
            System.out.print(v);
            %>
            
                    var parsed =<%=v%>;
                    console.log(parsed);
                    var miarray=new Array();
                    for(var i=0; i<parsed.length; i++){
                        miarray.push([parsed[i].columna,parsed[i].valor]);
                    }
                    console.log(miarray);

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows(miarray);

            // Set chart options
            var options = {'title': 'Entidades por Tipo',
                'width': 600,
                'height': 300,
                'pieSliceText': 'value',
                'fontSize': 15};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div8'));
            chart.draw(data, options);
        }
    </script>
    
    <script type="text/javascript">


        // Load the Visualization API and the corechart package.
        //google.charts.load('current', {'packages': ['corechart']});

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart() {
            
            <%
            Gson w = new Gson();
            String x = w.toJson(lista_estudiantes);
            System.out.print(x);
            %>
            
                    var parsed =<%=x%>;
                    console.log(parsed);
                    var miarray=new Array();
                    for(var i=0; i<parsed.length; i++){
                        miarray.push([parsed[i].columna,parsed[i].valor]);
                    }
                    console.log(miarray);

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows(miarray);

            // Set chart options
            var options = {'title': 'Actividades estudiantes semestre y años',
                'width': 600,
                'height': 300,
                'pieSliceText': 'value',
                'fontSize': 15};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div9'));
            chart.draw(data, options);
        }
    </script>
<!--
    <script type="text/javascript">


        // Load the Visualization API and the corechart package.
        //google.charts.load('current', {'packages': ['corechart']});

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
            var options = {'title': 'Actividades por tipo',
                'width': 600,
                'height': 300,
                'pieSliceText': 'value',
                'fontSize': 15
                //slices: [{color: 'black'}, {}, {}, {color: '#00f000'}]
                 };

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div4'));
            chart.draw(data, options);
            
        }

    </script>
  -->

    <!--Divs that will hold the pies charts-->
    
      
        <div id="chart_div0" class="col-md-6"></div>
        
        
        <%
        if(estados!=null){
            %>
            <div id="chart_div1" class="col-md-6"></div>
            <%}    
        
        %>
        <div id="chart_div2" class="col-md-6"></div>
        <div id="chart_div3" class="col-md-6"></div>
        <div id="chart_div4" class="col-md-6"></div>
        <div id="chart_div5" class="col-md-6"></div>        
        <div id="chart_div6" class="col-md-6"></div>
        <div id="chart_div7" class="col-md-6"></div>
        <div id="chart_div8" class="col-md-6"></div>
        <div id="chart_div9" class="col-md-6"></div>

        <div class="row">
            <a href="registrarActividad.jsp"><input type="button" class="ufps-btn" value="REGRESAR"> </a> 
        </div>
        </div>
        <!--<div id="editor"></div>
<button id="cmd">generate PDF</button>-->
</body>

<!--<script>
    
    var doc = new jsPDF();
var specialElementHandlers = {
    '#editor': function (element, renderer) {
        return true;
    }
};

$('#cmd').click(function () {
    doc.fromHTML($('#content').html(), 15, 15, {
        'width': 170,
            'elementHandlers': specialElementHandlers
    });
    doc.save('sample-file.pdf');
});
    
    
</script>-->


<!--FOOTER-->

<div class="ufps-container ufps-footer" style="height: 70px">
    <h4 class="text-center">Universidad Francisco de Paula Santander</h4>
    <h4 class="text-center">Programa Ingeniería de Sistemas</h4>
    <h5>Desarrollador por: Francisco Javier Duarte García - Heiner Enrique Villamizar Molina</h5>
</div>   
</html>
