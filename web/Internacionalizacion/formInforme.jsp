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
        
            <div class="form-group">
                <br><label for="">Selecciona los valores estadisticos que desee incluir en el informe:</label>
                
            </div>
            

           
            

            
            <div class="form-group col-md-12">
                <button type="submit" class="ufps-btn">Generar Informe</button>
            </div>

        </form>
    
    <!--<div class="row" style="padding-left: 20px">                
        <div class="col-md-12">
            <h3>Selecciona los valores estadisticos que desee incluir en el informe:</h3>
        </div>            
    </div>
    <br>
    
    <div class="row" style="padding-left: 20px">
    <div class="col-md-4">
        <h4>Seleccionar rango de fecha de consulta:</h4> 
    </div>    
    <div class="col-md-3">
        Desde: <input type="date" id="desde">  
    </div>
    <div class="col-md-3">
        Hasta: <input type="date" id="hasta">  
    </div>
    <div class="col-md-2">
        Sin rango <input type="checkbox" id="rango" onchange="habilitarrango()">  
    </div>
    </div>
    <br>
    
    <div class="row" style="padding-left: 20px">
            
        <div class="col-md-2">
           <input type="checkbox" id="convenios">Cantidad de convenios.    
        </div>
        <div class="col-md-3">
            <input type="checkbox" id="estados">Convenios aprobados y terminados.    
        </div>
        <div class="col-md-3">
            <input type="checkbox" id="radicados">Convenios radicados por años.    
        </div>
        <div class="col-md-2">
            <input type="checkbox" id="tipos">Convenios por Tipo.    
        </div>
         <div class="col-md-2">
             <input type="checkbox" id="sectores">Convenios por Sector.    
        </div>
        
        
    
    </div>
    <div class="row" style="padding-left: 20px">
        <div class="col-md-2">
           <input type="checkbox" id="activos">Convenios activos.    
        </div>
        <div class="col-md-2">
            <input type="checkbox" id="act_tipos">Actividades por tipo.    
        </div>
        <div class="col-md-2">
            <input type="checkbox" id="act_convenios">Actividades por convenios.    
        </div>
        <div class="col-md-2">
            <input type="checkbox" id="ent_sectores">Entidades por sector.    
        </div>
    </div>
    
        
    </body>
    <a href="registrarConvenio.jsp"><input type="button" class="ufps-btn" value="REGRESAR"> </a> 
    -->
    
</html>
