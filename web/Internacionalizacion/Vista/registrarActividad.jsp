


<%@page import="internacionalizacion.Facade.Facade"%>
<%@page import="internacionalizacion.Modelo.DTO.Convenio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="internacionalizacion.Controlador.ControladorConvenio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    Facade fachada = new Facade();

    if (request.getSession().getAttribute("respuesta_actividad") != null) {

%>
<!--<div class="ufps-alert-green" center>
    <span class="ufps-close-alert-btn">x</span> Se registro Correctamente la actividad!.
</div>


    <script type="text/javascript">
    alert("Registro exitoso!");
    </script>-->
<%}
    request.getSession().setAttribute("respuesta_actividad", true);
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
        <link href="../../public/css/ufps.css" rel="stylesheet" type="text/css"/>
        <link href="css/ufps.css" rel="stylesheet" type="text/css"/>
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
        <script src="../../public/js/ufps.js" type="text/javascript"></script>
        <script src="../../public/js/ufps.min.js" type="text/javascript"></script>
        <script src="js/formactividad.js" type="text/javascript"></script>

        <script src="js/bootstrap-datepicker.js" type="text/javascript"></script>
    </head>
    <body>
        <header>

            <center> <img id="banner" src="../../public/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header> 

        <div class="ufps-navbar ufps-container " id="menu" >
            <div class="ufps-container-fluid">
                <div class="ufps-navbar-brand">
                    <div class="ufps-btn-menu" onclick="toggleMenu('menu')">
                        <div class="ufps-btn-menu-bar">hdasd </div>
                        <div class="ufps-btn-menu-bar">dadas </div>
                        <div class="ufps-btn-menu-bar"> </div>
                    </div>

                </div>
                <div class="ufps-navbar-left nav">

                    <li><a href="../index.jsp" class="  ufps-navbar-btn  " >Home </a></li>
                    <li><a href="convenios.jsp"  class="ufps-navbar-btn  " >Convenios </a></li>
                    <li><a href="registrarActividad.jsp"  class="ufps-navbar-btn  " >Actividades </a></li>
                    <li><a href="consultarConvenios.jsp"  class="ufps-navbar-btn  " >Consultar Convenios</a></li>

                    </li>
                </div>


            </div>
        </div>

        <!--Contenido-->
        <div  class="ufps-container" id="contenido">


            <div class="ufps-row">
                <div class="col-md-3">
                    <ul class="nav nav-pills nav-stacked"><br>
                        <input type="button" class="ufps-btn-accordion" value="Registrar actividad"><br><br>
                        <input type="button" id ="actividades" class="ufps-btn-accordion" value="Consultar actividades"><br><br>
                        <input type="button" class="ufps-btn-accordion" value="Actualizar actividad"><br><br>
                        <input type="button" id="convenios" class="ufps-btn-accordion" value="Consultar convenios" onclick="consultarconvenios()"><br><br>
                        <input type="button" class="ufps-btn" value="Cerrar Sesión">
                        <!--<li class="active"><a href="#"><i class="fa fa-home fa-fw"></i>Home</a></li>-->
                        <!--<li><a href="http://www.jquery2dotnet.com"><i class="fa fa-list-alt fa-fw"></i>Registrar actividad</a></li><br>
                        <li><a href="http://www.jquery2dotnet.com"><i class="fa fa-file-o fa-fw"></i>Consultar actividades</a></li><br>
                        <li><a href="http://www.jquery2dotnet.com"><i class="fa fa-bar-chart-o fa-fw"></i>Modificar actividades</a></li>-->

                    </ul>
                </div>


                <div class="col-md-9" id="destino"><br>
                    <form action="registrarActividad_pro.jsp" method="POST">
                        <fieldset>
                            <!-- Form Name -->
                            <legend><strong><h1>Formulario de Registro de Actividades</h1></strong></legend>
                        </fieldset>

                        <div class="form-group">
                            <label for="convenio">Seleccione convenio:</label>
                            <select id="convenio" name="convenio" class="ufps-input" onchange="">

                                <%
                                    //ControladorConvenio c = new ControladorConvenio();
                                    ArrayList<Convenio> convenios = fachada.obtenerConvenios();

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
                        <div class="form-group">
                            <label for="duracion" title="Duración de la actividad en semanas, dias o meses.">Duración actividad: <span class="glyphicon glyphicon-question-sign"></span></label>
                            <input type="text" class="ufps-input" id="duracion" name="duracion" placeholder="duracion en dias, meses o años">
                        </div>

                        <div class="form-group col-md-5">
                            <label for="creacion" title="Fecha en que se crea la actividad.">Fecha creación: <span class="glyphicon glyphicon-question-sign"></span></label>
                            <input type="date" class="ufps-input" id="creacion" name="creacion" required="true">
                        </div>
                        <div class="form-group col-md-5">
                            <label for="terminacion" title="Finalización de la actividad.">Fecha terminación: <span class="glyphicon glyphicon-question-sign"></span></label>
                            <input type="date" class="ufps-input" id="terminacion" name="terminacion" required="true">
                        </div>
                        <div class="ufps-row">
                            <!--Se deben cargar dinamicamente de acuerdo a las registradas en convenio-->
                            <div class="form-group col-md-3">
                                <label for="tipoactividad">Tipo actividad:</label>
                                <select id="tipoactividad" name="tipoactividad" class="ufps-input" onchange="mostrarpasantia()">
                                    <option value="Practica">Practica</option>
                                    <option value="Pasantia">Pasantia</option>
                                    <option value="Movilidad">Movilidad</option>
                                    <option value="Social">Social</option>
                                    <option value="Extension">Extension</option>
                                    <option value="Investigacion">Investigacion</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="hora" title="Hora que comienza la actividad para el caso de actividades sociales o de extensión.">Hora inico actividad: <span class="glyphicon glyphicon-question-sign"></span></label>
                                <input type="text" class="ufps-input" id="hora" name="hora">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="responsable" title="Docente responsable">Docente responsable: <span class="glyphicon glyphicon-question-sign"></span></label>
                                <input type="text" class="ufps-input" id="hora" name="responsable">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="hora" title="Lugar donde se realiza la actividad.">Lugar: <span class="glyphicon glyphicon-question-sign"></span></label>
                                <input type="text" class="ufps-input" id="hora" name="lugar">
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
                                <input type="text" class="ufps-input" id="nombreproyecto">

                            </div>
                            <div class="form-group">
                                <label for="tutorempresa" title="Tutor de la empresa.">Tutor empresa pasantía: <span class="glyphicon glyphicon-question-sign"></span></label>
                                <input type="text" class="ufps-input" id="tutorempresa">

                            </div>
                            <div class="form-group">
                                <label for="tutoruni" title="Tutor de la universidad.">Tutor universidad pasantía: <span class="glyphicon glyphicon-question-sign"></span></label>
                                <input type="text" class="ufps-input" id="tutoruni">

                            </div>
                            <div class="form-group col-md-5">
                                <label for="fechainicio" title="Fecha inicio de la pasantía.">Fecha inicio pasantía: <span class="glyphicon glyphicon-question-sign"></span></label>
                                <input type="date" class="ufps-input" id="fechainicio">
                            </div>
                            <div class="form-group col-md-5">
                                <label for="fechafin" title="Fecha terminación pasantía.">Fecha fin pasantía: <span class="glyphicon glyphicon-question-sign"></span></label>
                                <input type="date" class="ufps-input" id="fechafin">
                            </div>
                                </div>
                        </div>
                        <div class="form-group col-md-3">
                            <button type="submit" class="ufps-btn">Registrar</button>
                        </div>

                    </form>
                </div>


            </div>

        </div>


    </body>

    <!--Footer-->

    <div class="ufps-container ufps-footer ">
        <h5 class="text-center">Universidad Francisco de Paula Santander</h5>
        <h6 class="text-center">Programa Ingeniería de Sistemas<br>
            Desarrollador por: Francisco Javier Duarte García - Heiner Enrique Villamizar Molina</h6>


    </div>  
    <!--<%@ include file="../../plantilla/footer.jsp"%>-->
</html>
