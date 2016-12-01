<%-- 
    Document   : registrarEntidad
    Created on : 29/10/2016, 05:59:06 PM
    Author     : HeinerV
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Internacionalizacion.Modelo.DTO.Pais"%>
<%@page import="Internacionalizacion.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Facade f = new Facade();
    if (request.getSession().getAttribute("respuesta_entidad") != null) {

%>
<div class="ufps-alert-green">
    <span class="ufps-close-alert-btn">x</span> Se registro Correctamente La entidad.
</div>
<script type="text/javascript">
//    alert("<%=request.getSession().getAttribute("respuesta_entidad")%>");
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
        <script src="../public/js/ufps.js" type="text/javascript"></script>
        

        <script src="js/bootstrap-datepicker.js" type="text/javascript"></script>
    </head>
    <body>             

        <jsp:include page="../plantilla/header.jsp"></jsp:include>
        <!--Contenido-->
        <div  class="ufps-container" id="contenido" style="width: 1270px">


            <div class="ufps-row">



                <div class="col-md-12" id="formularioEntidad" ><br>
                    <center><form action="registrarEntidad_pro.jsp" method="POST" center>
                            <fieldset>
                                <!-- Form Name -->
                                <legend><center><strong><h1>Formulario para el Registro de Entidades</h1></strong></center></legend>
                            </fieldset>
                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">

                                    <br><label for="nombre">Nombre Entidad</label>
                                    <input name="nombre" type="text" class="ufps-input-line" id="entidad" >
                                </div>  </div>
                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <label for="pais">NIT</label>
                                <input type="text" name ="nit" class="ufps-input-line">
                            </div>
                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">    
                                <div class="form-group" >

                                    <label for="nombre">Nombre Representante</label>
                                    <input name="representante" type="text" class="ufps-input-line" id="representante" >
                                </div></div>


                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group"   >
                                    <label for="sector">Seleccione Sector:</label>
                                    <select id="sector" name="sector" class="ufps-input-line" border-width:2px margin:7px padding:7px>
                                        <option value="Agropecuario">Agropecuario</option>
                                        <option value="Comercial">Comercial</option>
                                        <option value="Comunicaciones">Comunicaciones</option>
                                        <option value="Construccion">Construccion</option>
                                        <option value="Educacion">Educacion</option>
                                        <option value="Energetico">Energetico</option>
                                        <option value="Financiero">Financiero</option>
                                        <option value="Industrial">Industrial</option>
                                        <option value="Minero">Minero</option>                                        
                                        <option value="Salud">Salud</option>
                                        <option value="Servicios">Servicios</option>
                                        <option value="Solidario">Solidario</option>
                                        <option value="Transporte">Transporte</option>                                                                   
                                        <option value="Turistico">Turistico</option>
                                        <option value="Otros">Otros</option>
                                        
                                    </select>
                                </div></div>

                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">
                                    <label for="tipo">Seleccione Ambito</label>
                                    <select id="tipo" name="tipo" class="ufps-input-line " >
                                        <option value="Publico">Publico</option>
                                        <option value="Privado">Privado</option>
                                        <option value="Mixto">Mixto</option>     
                                        <option value="ONG">Mixto</option>
                                        <option value="Fundacion">Mixto</option>   

                                    </select>
                                </div> 
                            </div>

                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">

                                    <label for="telefono">Telefono de Contacto</label>
                                    <input name="telefono" type="number" class="ufps-input-line " id="telefono" >
                                </div> </div>
                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <label for="pais">Direccion</label>
                                <input type="text" name ="direccion" class="ufps-input-line">
                            </div>

                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">
                                    <label for="pais">Seleccione el Pais de la Entidad</label>
                                    <select name="pais" class="ufps-input-line " >
                                        <%
                                            ArrayList<Pais> paises = f.obtenerPaises();

                                            for (Pais p : paises) {

                                                if (p.getNombre().equals("Colombia")) {
                                        %>   
                                        <option value="<%=p.getId()%>" selected><%=p.getNombre()%></option>

                                        <%
                                        } else {
                                        %>
                                        <option value="<%=p.getId()%>"><%=p.getNombre()%></option>

                                        <%}
                                            }
                                        %>
                                    </select>
                                </div> </div>





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

    <div class="ufps-container ufps-footer " style="height: 70px">
        <h4 class="text-center">Universidad Francisco de Paula Santander</h4>
        <h4 class="text-center">Programa Ingeniería de Sistemas</h4>
        <h5>Desarrollador por: Francisco Javier Duarte García - Heiner Enrique Villamizar Molina</h5>
    </div>    
   
</html>
