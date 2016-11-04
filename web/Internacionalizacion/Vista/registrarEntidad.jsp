<%-- 
    Document   : registrarEntidad
    Created on : 29/10/2016, 05:59:06 PM
    Author     : HeinerV
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if(request.getSession().getAttribute("respuesta_entidad")!=null){
    
    %>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_entidad")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_entidad", null);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Entidad</title>
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
                    <li><a href="registrarActividad.jsp"  class="ufps-navbar-btn  " >Actividades </a></li>
                    <li><a href="registrarEntidad.jsp"  class="ufps-navbar-btn  " >Registrar Entidad </a></li>
                    <li><a href="registrarConvenio.jsp"  class="ufps-navbar-btn  " >Registrar Convenio </a></li>

                    </li>
                </div>


            </div>
        </div>

        <!--Contenido-->
        <div  class="ufps-container" id="contenido">


            <div class="ufps-row">



                <div class="col-md-12" id="formularioEntidad" ><br>
                    <center><form action="registrarEntidad_pro.jsp" method="POST" center>
                            <fieldset>
                                <!-- Form Name -->
                                <legend><center><strong><h1>Formulario para el Registro de Entidades</h1></strong></center></legend>
                            </fieldset>
                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">

                                    <label for="nombre">Nombre Entidad</label>
                                    <input name="nombre" type="text" class="ufps-input-line" id="entidad" >
                                </div>  </div>

                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">    
                                <div class="form-group" >

                                    <label for="nombre">Nombre Representante</label>
                                    <input name="representante" type="text" class="ufps-input-line" id="representante" >
                                </div></div>


                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group"   >
                                    <label for="sector">Seleccione Sector:</label>
                                    <select id="sector" name="sector" class="ufps-input-line" border-width:2px margin:7px padding:7px>
                                        <option value="Educacion">Educacion</option>
                                        <option value="Comercial">Comercial</option>
                                        <option value="Salud">Salud</option>
                                        <option value="Financiero">Financiero</option>
                                    </select>
                                </div></div>
                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">
                                    <label for="ambito">Seleccione Ambito de la empresa</label>
                                    <select id="ambito" name="ambito" class="ufps-input-line " >
                                        <option value="Privado">Privado</option>
                                        <option value="Publico">Publico</option>
                                        <option value="Fundacion">Fundacion</option>

                                    </select>
                                </div> 
                            </div>
                            
                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">
                                    <label for="tipo">Seleccione tipo entidad</label>
                                    <select id="tipo" name="tipo" class="ufps-input-line " >
                                        <option value="Empresa">Empresa</option>
                                        <option value="Universidad">Universidad</option>                                        

                                    </select>
                                </div> 
                            </div>

                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">

                                    <label for="telefono">Telefono de Contacto</label>
                                    <input name="telefono" type="text" class="ufps-input-line " id="telefono" >
                                </div> </div>

                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">
                                    <label for="pais">Seleccione el Pais de la Entidad</label>
                                    <select id="ambito" name="pais" class="ufps-input-line " >
                                        <option value="1">Pais 1</option>
                                        <option value="2">Pais 2</option>
                                        <option value="2">Fais 3</option>

                                    </select>
                                </div> </div>
                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <label for="pais">NIT</label>
                                    <input type="text" name ="nit" class="ufps-input-line">
                            </div>




                            <div class="ufps-col-tablet-12 ">  
                                <div class="form-group">
                                    <button type="submit" class="ufps-btn">Registrar</button>
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
