<%-- 
    Document   : registrarConvenio
    Created on : 29/10/2016, 09:24:55 PM
    Author     : HeinerV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if(request.getSession().getAttribute("respuesta_convenio")!=null){
    
    %>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_convenio")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_convenio", null);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Convenio</title>
        <link href="img/favicon.ico" rel="shortcut icon"/>
        <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
        <meta charset="utf-8">
        <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Metaetiqueta para la correcta visualizaciÃ³n en dispositivos moviles-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--AÃ±ada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
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

       
        <script src="js/bootstrap-datepicker.js" type="text/javascript"></script>
    </head>
    <body>
        <header>

            <center> <img id="banner" src="../../public/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header> 

        <div class="ufps-navbar ufps-container " id="menu"  center>
            <div class="ufps-container-fluid">
                <div class="ufps-navbar-brand">
                    <div class="ufps-btn-menu" onclick="toggleMenu('menu')">
                        <div class="ufps-btn-menu-bar"> </div>
                        <div class="ufps-btn-menu-bar"> </div>
                        <div class="ufps-btn-menu-bar"> </div>
                        <div class="ufps-btn-menu-bar"> </div>

                    </div>

                </div>
                <div class="ufps-navbar-left nav">

                    <li><a href="../index.jsp" class="  ufps-navbar-btn  " >Home </a></li>
                    <li><a href="convenios.jsp"  class="ufps-navbar-btn  " >Convenios </a></li>
                    <li><a href="actividades.jsp"  class="ufps-navbar-btn  " >Actividades </a></li>
                    <li><a href="actividades.jsp"  class="ufps-navbar-btn  " >Registrar Entidad </a></li>
                    <li><a href="registrarConvenio.jsp"  class="ufps-navbar-btn  " >Registrar Convenio </a></li>


                </div>


            </div>
        </div>

        <!--Contenido-->
        <div  class="ufps-container" id="contenido">


            <div class="ufps-row">



                <div class="col-md-12" id="formularioEntidad" ><br>
                    <center><form action="registrarConvenio_pro.jsp" method="POST" center>
                            <fieldset>
                                <!-- Form Name -->
                                <legend><center><strong><h1>Formulario para el Registro de Convenios</h1></strong></center></legend>
                            </fieldset>
                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">

                                    <label for="nombre">Nombre Convenio</label>
                                    <input name="nombre" type="text" class="ufps-input-line" id="entidad" >
                                </div>  </div>

                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">    
                                <div class="form-group" >

                                    <label for="descripcion">Descripcion</label>
                                    <input name="descripcion" type="text" class="ufps-input-line" id="representante" >
                                </div></div>

                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">    
                                <div class="form-group" >

                                    <label for="vigencia">Vigencia</label>
                                    <input name="vigencia" type="text" class="ufps-input-line" id="representante" >
                                </div></div>



                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">
                                    <br><label for="tipo_convenio">Seleccione Tipo de Convenio</label> <br><br>
                                    <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                        <select id="tipo_convenio" name="tipo_convenio" class="ufps-input " >
                                            <option value="Marco">Marco</option>
                                            <option value="Especifico">Especifico</option>
                                            <option value="Interinstitucional">Interinstitucional</option>

                                        </select><br><br>
                                    </div>
                                </div> </div>
                            <br> <br><label for="tipo_convenio">Seleccione Lo que se puede hacer en el presente convenio</label>

                            <br><div class="checkbox">

                                <br><label>
                                    <input name="movilidad" type="checkbox" value="">
                                    Movilidad
                                </label>
                                <label>
                                    <input name="pasantia" type="checkbox" value="">
                                    Pasantia
                                </label>

                                <label>
                                    <input name="extension" type="checkbox" value="">
                                    Extension
                                </label>
                                <label>
                                    <input name="investigacion" type="checkbox" value="">
                                    Investigacion
                                </label>
                                <label>
                                    <input name="social" type="checkbox" value="">
                                    Social
                                </label>
                                <label>
                                    <input name="practica" type="checkbox" value="">
                                    Practicas
                                </label>
                            </div>

                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group col-md-6">
                                    <br> <label for="creacion" title="Fecha en que se creó el convenio.">Fecha creación: <span class="glyphicon glyphicon-question-sign"></span></label>
                                    <input type="date" class="ufps-input" id="fechacreacion" name="fechacreacion">
                                </div>


                                <div class="form-group col-md-6">
                                    <br><label for="creacion" title="Fecha en que se termina el convenio ">Fecha terminacion <span class="glyphicon glyphicon-question-sign"></span></label>
                                    <input type="date" class="ufps-input" id="creacion" name="fechaterminacion">
                                </div></div>



                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">

                                    <label for="estado">Estado</label>
                                    <select id="estado" name="estado" class="ufps-input-line ">
                                        <option value="Aprobado">Aprobado</option>
                                        <option value="Terminado">Terminado</option>

                                    </select>
                                </div> 
                            </div>

                            

                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group" >
                                    <label for="entidad" >Seleccione la Entidad con quien se hace el Convenio</label>
                                    <select id="entidad" name="entidad" class="ufps-input-line ">
                                        <option value="10">Entidad 1</option>
                                        <option value="11">Entidad 2</option>
                                        <option value="12">Entidad 3</option>

                                    </select>

                                </div> </div>




                            <div class="ufps-col-tablet-12 ">  
                                <div class="form-group">
                                    <button type="submit" class="ufps-btn">Registrar Convenio</button>
                                </div> </div>

                        </form></center>
                </div>


            </div>

            <!-- Formulario de registro de actividades del convenio-->






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