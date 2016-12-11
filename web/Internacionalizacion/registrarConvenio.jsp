<%-- 
    Document   : formRegistraractividad
    Created on : 30/11/2016, 07:59:51 PM
    Author     : JAVIER
--%>

<%@page import="Internacionalizacion.Modelo.DTO.Docente"%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="Internacionalizacion.Modelo.DTO.Entidad"%>
<%@page import="Internacionalizacion.Facade.Facade"%>
<%@page import="Internacionalizacion.Modelo.DTO.Convenio"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ICuenta cuenta = (ICuenta) session.getAttribute("usuario");
    if (cuenta == null) {

        response.sendRedirect("../Integrador/login.jsp");

    }
    
    Facade fachada = new Facade();
    Docente d = null;
    if(cuenta != null){
    String codigo = cuenta.getUser();
    d = fachada.consultarDocente(codigo);
    if(!d.isHabilitado()){
        
%>
<script type="text/javascript">
    alert("NO ESTÁ HABILITADO POR EL COORDINADOR!");
</script>
<%
    response.sendRedirect("index.jsp");
}
}
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

    <center>
        <form action="registrarConvenio_pro2.jsp" method="POST" enctype="multipart/form-data" >
            <fieldset>
                <!-- Form Name -->
                <legend><center><strong><h1>Formulario para el Registro de Convenios</h1></strong></center></legend>
            </fieldset>
            <div class="ufps-col-tablet-10 ufps-col-tablet">
                <div class="form-group">

                    <br><label for="nombre">Nombre Convenio</label>
                    <input name="nombre" type="text" class="ufps-input-line" id="entidad" >
                </div>  </div>
            <div class="ufps-col-tablet-10 ufps-col-tablet">
                <div class="form-group">

                    <label for="radicado" style="text-align: right">Numero radicado</label>
                    <input name="radicado" type="text" class="ufps-input-line" id="radicado" >
                </div>  </div>

            <div class="ufps-col-tablet-10 ufps-col-tablet">    
                <div class="form-group" >

                    <label for="descripcion">Descripcion</label>
                    <input name="descripcion" type="text" class="ufps-input-line" id="representante" >
                </div></div>

            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">    
                <div class="form-group" >

                    <label for="vigencia">Vigencia</label>
                    <input name="vigencia" type="text" class="ufps-input-line" id="vigencia" >
                </div></div>
            
            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-2">
                <div class="form-group">
                    <br><label for="tipo_convenio">Seleccione Tipo de Convenio</label> <br><br>
                    <div class="ufps-col-tablet-4 ufps-col-tablet-offset-4">
                        <select id="tipo_convenio" name="tipo_convenio" class="ufps-input " >
                            <option value="Marco">Marco</option>
                            <option value="Especifico">Especifico</option>
                            <option value="Interinstitucional">Interinstitucional</option>

                        </select><br><br>
                    </div>
                </div> </div><br><br>
            <div class="ufps-col-tablet-10 ufps-col-tablet">
                <div class="form-group">
                    <br><label >Por favor cargue el acta o documento del convenio</label> <br><br>
                    <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                        <input type="file" name="archivo" id="archivo" accept=".pdf" required>
                        <!--<button type="file"  name="archivo" id="archivo" class="ufps-btn" required>Cargar acta</button> -->
                        <br> <br></div>
                </div> </div>
            <div class="ufps-col-tablet-10 ufps-col-tablet">
                <div class="form-group">
                    <br><label for="tipo_convenio">Seleccione lo que se puede hacer en el presente convenio</label>

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
                </div> </div>
            <div class="ufps-col-tablet-10 ufps-col-tablet">

                <div class="form-group col-md-4">
                    <br> <label for="fecharadicacion" title="Fecha en que se radica el convenio.">Fecha radicación: <span class="glyphicon glyphicon-question-sign"></span></label>
                    <input type="date" class="ufps-input" id="fecharadicacion" name="fecharadicacion" onchange="fijarfechainicio_inicio(this.value)">
                </div>

                <div class="form-group col-md-4">
                    <br> <label for="fechainicio" title="Fecha en que se inicia el convenio.">Fecha inicio: <span class="glyphicon glyphicon-question-sign"></span></label>
                    <input type="date" class="ufps-input" id="fechainicio" name="fechainicio" onchange="fijarfechainicio_terminacion(this.value)">
                </div>

<!--
                <div class="form-group col-md-4 pull-right">
                    <br><label for="fechaterminacion" title="Fecha en que se termina el convenio ">Fecha terminacion <span class="glyphicon glyphicon-question-sign"></span></label>
                    <input type="date" class="ufps-input" id="fechaterminacion" name="fechaterminacion" onchange="fijarfechalimite_inicio(this.value)">
                </div></div>
-->


            <!--<div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                <div class="form-group">

                    <label for="estado">Estado</label>
                    <select id="estado" name="estado" class="ufps-input-line ">
                        <option value="Aprobado">Aprobado</option>
                        <option value="Terminado">Terminado</option>

                    </select>
                </div> 
            </div>
            -->



            <div class="ufps-col-tablet-10 ufps-col-tablet">
                <div class="form-group" >
                    <label for="entidad" >Seleccione la Entidad con quien se hace el Convenio</label>
                    <select id="entidad" name="entidad" class="ufps-input-line ">

                        <%
                            ArrayList<Entidad> entidades = fachada.obtenerEntidades();
                            for (Entidad e : entidades) {
                        %>
                        <option value="<%=e.getId()%>"><%=e.getNombre()%></option>

                        <%}
                        %>
                    </select>

                </div> </div>

            <div class="ufps-col-tablet-10">  
                <div class="form-group">
                    <button type="submit" class="ufps-btn">Registrar Convenio</button>
                </div> </div>

        </form></center>

</body>         

</html>
