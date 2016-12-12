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
        <title>Formulario de generación del informe</title>

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
        <script src="js/informe.js" type="text/javascript"></script>


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


        <form action="procesar_informe.jsp" method="POST">
            <div class="form-group col-md-12" style="margin-top: 10px;">
                <fieldset>
                    <!-- Form Name -->
                    <legend><strong><h1><center>Formulario de Generación de Informe</center></h1></strong></legend>
                </fieldset>
            </div>    

            <div class="form-group">

                <label for="nombre">Nombre informe:</label>
                <input type="text" class="ufps-input" id="nombre" name="nombre" maxlength="100" required="true">
            </div>           

            <div class="form-group">
                <label for="descripcion" title="Breve descripción del informe.">Descripción: <span class="glyphicon glyphicon-question-sign"></span></label>
                <input type="text" class="ufps-input" id="descripcion" name="descripcion" maxlength="500" required="true">
            </div>

            <div class="form-group col-md-2">
                <label for="semestre" title="Semestre del informe.">Semestre: <span class="glyphicon glyphicon-question-sign"></span></label>
                <input type="number" class="ufps-input" id="semestre" name="semestre" min="1" max="2" required="true">
            </div>

            <div class="form-group col-md-2">
                <label for="año" title="Año del informe.">Año: <span class="glyphicon glyphicon-question-sign"></span></label>
                <input type="number" class="ufps-input" id="año" name="año" min="2016" required="true">
            </div>

            <div class="ufps-row">
                <div class="form-group col-md-12">
                    <br><label for=""><h4>* A continuación selecciona los valores estadisticos que desee incluir en el informe:</h4></label>

                </div>
            </div>

            <div class="ufps-row">
                <div class="form-group col-md-4">
                    <label>Seleccionar rango de fecha de consulta: </label>
                </div>    
                <div class="form-group col-md-3">
                    <label>Desde: </label> <input type="date" id="desde" name="desde"> 
                </div>
                <div class="form-group col-md-3">
                    <label>Hasta: </label> <input type="date" id="hasta" name="hasta"> 
                </div>
                <div class="form-group col-md-2">
                    <label title="Si lo habilitas, no habrá filtrado por fechas.">Sin rango <span class="glyphicon glyphicon-question-sign"></span></label> <input type="checkbox" id="rango" onchange="habilitarrango()" name="rango"> 
                </div>
            </div>

            <div class="ufps-row">
                <div class="form-group col-md-12">
                    <br><label for="">Estadisticas para los convenios:</label>

                </div>
            </div>

            <div class="ufps-row">
            <div class="col-md-2">
                <input type="checkbox" id="convenios" name="convenios"> Cantidad de convenios.
            </div>
            <div class="col-md-3">
                <input type="checkbox" id="estados" name="estados"> Convenios aprobados y terminados.    
            </div>
            <div class="col-md-3">
                <input type="checkbox" id="radicados" name="radicados"> Convenios radicados por años.    
            </div>
            <div class="col-md-2">
                <input type="checkbox" id="tipos" name="tipos"> Convenios por Tipo.    
            </div>
            <div class="col-md-2">
                <input type="checkbox" id="activos" name="activos"> Convenios activos.    
            </div>
            </div>

            
            <div class="ufps-row">
                <div class="form-group col-md-12">
                    <br><label for="">Estadisticas para las actividades:</label>

                </div>
            </div>
            
            <div class="ufps-row">
                
                
            <div class="col-md-2">
                <input type="checkbox" id="act_tipos" name="act_tipos"> Actividades por tipo.    
            </div>
            <div class="col-md-4">
                <input type="checkbox" id="act_convenios" name="act_convenios"> Cantidad de actividades por convenios.    
            </div>
            <div class="col-md-4">
                <input type="checkbox" id="act_convenios" name="act_convenios"> Cantidad de actividades por semestre y año.    
            </div>
               
            </div>
            
            <div class="ufps-row">
                <div class="form-group col-md-12">
                    <br><label for="">Estadisticas para las entidades:</label>

                </div>           
            </div>
            
            <div class="ufps-row">
            <div class="col-md-3">
                <input type="checkbox" id="ent_sectores" name="ent_sectores"> Entidades por sector.    
            </div>
            <div class="col-md-3">
                <input type="checkbox" id="sectores" name="ent_tipos"> Entidades por Tipo.    
            </div>
            </div>
            
            <div class="ufps-row">
                <div class="form-group col-md-12">
                    <br><label for="">Estadisticas para los estudiantes:</label>

                </div>           
            </div>
            
            <div class="ufps-row">
            <div class="col-md-6">
                <input type="checkbox" id="estudiantes" name="estudiantes"> Cantidad de estudiantes que realizan actividades por semestre y año.    
            </div>
            </div><br>
            
            <div class="form-group col-md-2 col-md-push-10">
                <button type="submit" class="ufps-btn">Generar Informe</button>
            </div>

        </form>

</html>
