<%-- 
    Document   : formRegistraractividad
    Created on : 30/11/2016, 07:59:51 PM
    Author     : JAVIER
--%>

<%@page import="Internacionalizacion.Modelo.DTO.Docente"%>
<%@page import="Internacionalizacion.Facade.Facade"%>
<%@page import="Internacionalizacion.Modelo.DTO.Convenio"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Facade fachada = new Facade();
    //Convenio con = new Convenio();
    if (request.getSession().getAttribute("respuesta_actividad") != null) {

%>
<div class="ufps-alert-green" center>
    <span class="ufps-close-alert-btn">x</span> Se registro Correctamente la actividad!.
</div>


<script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_actividad")%>");
</script>
<%}
    request.getSession().setAttribute("respuesta_actividad", null);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

        <form action="registrarActividad_pro.jsp" method="POST">
            <div class="form-group col-md-12" style="margin-top: 10px;">
                <fieldset>
                    <!-- Form Name -->
                    <legend><strong><h1><center>Formulario de Registro de Actividades</center></h1></strong></legend>
                </fieldset>
            </div>
            <div class="form-group">
                <br><label for="convenio">Seleccione convenio:</label>
                <select id="convenio" name="convenio" class="ufps-input" onchange="cambiarTipo(this.value)">

                    <%
                        //ControladorConvenio c = new ControladorConvenio();
                        ArrayList<Convenio> convenios = fachada.obtenerConvenios();
                        Convenio c = convenios.get(0);
                        //cambiarTipo(c.getId());
                        for (Convenio con : convenios) {


                    %>                                    
                    <option value="<%=con.getId()%>"><%=con.getNombre()%></option>

                    <% }
                    %>
                </select>
            </div>


            <div class="form-group">

                <label for="nombre">Nombre actividad:</label>
                <input type="text" class="ufps-input" id="nombre" name="nombre" required="true">
            </div>
            <!--<div class="form-group">
                <label for="duracion" title="Duración de la actividad en semanas, dias o meses.">Duración actividad: <span class="glyphicon glyphicon-question-sign"></span></label>
                <input type="text" class="ufps-input" id="duracion" name="duracion" placeholder="duracion en dias, meses o años">
            </div>
            -->
            <div class="form-group col-md-5">
                <label for="creacion" title="Fecha en que inicia la actividad.">Fecha inicio: <span class="glyphicon glyphicon-question-sign"></span></label>
                <input type="date" class="ufps-input" id="creacion" name="creacion" required="true" onchange="fijarvalormin(this.value)">
            </div>
            <div class="form-group col-md-5">
                <label for="terminacion" title="Finalización de la actividad.">Fecha terminación: <span class="glyphicon glyphicon-question-sign"></span></label>
                <input type="date" class="ufps-input" id="terminacion" name="terminacion" required="true">
            </div>
            <div class="ufps-row">
                <!--Se deben cargar dinamicamente de acuerdo a las registradas en convenio-->
                <div class="form-group col-md-3">
                    <label for="tipoactividad">Tipo actividad:</label>
                    <select id="tipoactividad" name="tipoactividad" class="ufps-input" onchange="mostrarpasantia()" required="true">


                    </select>
                </div>
                <div class="form-group col-md-3">
                    <label for="hora" title="Hora que comienza la actividad para el caso de actividades sociales o de extensión.">Hora inico actividad: <span class="glyphicon glyphicon-question-sign"></span></label>
                    <input type="text" class="ufps-input" id="hora" name="hora">
                </div>

                <div class="form-group col-md-3">
                    <label for="responsable" title="Docente responsable">Docente responsable: <span class="glyphicon glyphicon-question-sign"></span></label>
                    <select class="ufps-input" id="docente" name="responsable">
                        <%
                            ArrayList<Docente> docentes = fachada.obtenerDocentes();
                            for (Docente d : docentes) {
                                
                        %>
                        <option value="<%=d.getCodigo()%>"><%=d.getNombres()%></option>

                        <%}
                        %>

                    </select>
                </div>

                <div class="form-group col-md-3">
                    <label for="lugar" title="Lugar donde se realiza la actividad.">Lugar: <span class="glyphicon glyphicon-question-sign"></span></label>
                    <input type="text" class="ufps-input" id="lugar" name="lugar">
                </div>

                <div class="form-group col-md-3">
                    <label for="semestre" title="Semestre academico en que se realiza la actividad.">Semestre academico: <span class="glyphicon glyphicon-question-sign"></span></label>
                    <input type="number" class="ufps-input" id="semestre" name="semestre" min="1" max="2" required="required" placeholder="semestre">
                </div>

            </div>
            <div class="form-group">
                <label for="agregarestudiante" title="Agrega los estudiantes que realizan la actividad.">Agregar un estudiante a la actividad: <span class="glyphicon glyphicon-question-sign"></span></label>
                <!--<input type="button" class="ufps-btn" id="agregarestudiante" value="Agregar Estudiante">-->
                <input type="button" class="ufps-btn" value="Agregar Estudiante" onClick="addInput('insertar');">
                <input type="button" class="ufps-btn" value="Quitar Estudiante" onClick="borrarInput('insertar');"><br><br>
                <div class="row">
                    <div id="insertar" class="form-group col-md-4">

                    </div>
                </div>
            </div>
            <div class="form-group">

                <label for="descripcion" title="Descripción de la actividad.">Descripción de la actividad: <span class="glyphicon glyphicon-question-sign"></span></label>
                <input type="text" class="ufps-input" id="descripcion" name="descripcion">

            </div>

            <div class="panel" id="panelpasantia" style='display:none'>
                <div class="panel-heading"><h4>Formulario para Registro de Pasantia</h4></div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="nombreproyecto" title="Nombre del proyecto de pasantía.">Nombre proyecto pasantía: <span class="glyphicon glyphicon-question-sign"></span></label>
                        <input type="text" name="nombrepasantia" class="ufps-input" id="nombreproyecto">

                    </div>
                    <div class="form-group">
                        <label for="tutorempresa" title="Tutor de la empresa.">Tutor empresa pasantía: <span class="glyphicon glyphicon-question-sign"></span></label>
                        <input type="text" name="tutorempresa" class="ufps-input" id="tutorempresa">

                    </div>
                    <div class="form-group">
                        <label for="tutoruni" title="Tutor de la universidad.">Tutor universidad pasantía: <span class="glyphicon glyphicon-question-sign"></span></label>
                        <input type="text" name="tutoru" class="ufps-input" id="tutoruni">

                    </div>

                </div>
            </div>
            <div class="form-group col-md-12">
                <button type="submit" class="ufps-btn">Registrar</button>
            </div>

        </form>

    </body>         

</html>
