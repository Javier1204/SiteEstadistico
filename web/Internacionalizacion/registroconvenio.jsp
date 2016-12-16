<%--
    Document   : formRegistraractividad
    Created on : 30/11/2016, 07:59:51 PM
    Author     : JAVIER
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="Internacionalizacion.Modelo.DTO.Docente"%>
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
    //else if (cuenta.getUser().equals("8")) {

        //String codigo = cuenta.getUser();
        //if(codigo=="8"){
        //System.out.println("soy el 8");
//%>
<!--<script type="text/javascript">
    alert("ERES COORDINADOR NO PUEDES ENTRAR AQUÍ!");
</script>-->
<%
//response.sendRedirect("index.jsp");
//}
String codigo="";
Facade fachada = new Facade();
Docente d = null;
if(cuenta != null){
codigo = cuenta.getUser();

d = fachada.consultarDocente(codigo);
if(!d.isHabilitado()){
        
%>
<script type="text/javascript">
    
   // alert("NO ESTÁ HABILITADO POR EL COORDINADOR!");
</script>
<%
    response.sendRedirect("index.jsp");
}
}

    

    
    
if (request.getSession().getAttribute("respuesta_actividad") != null) {

%>


<div class="ufps-alert-green" center>
    <span class="ufps-close-alert-btn">x</span> Se registro Correctamente la actividad!.
</div>


<script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_actividad")%>");
</script>-->
<%}
    request.getSession().setAttribute("respuesta_actividad", null);
%>

<html>
   
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
            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-2">
                <div class="form-group">

                    <label for="radicado" style="text-align: right">Numero radicado</label>
                    <input name="radicado" type="text" class="ufps-input-line" id="radicado" >
                </div>  </div>

            <div class="ufps-col-tablet-10 ufps-col-tablet">    
                <div class="form-group" >

                    <label for="descripcion">Descripcion</label>
                    <input name="descripcion" type="text" class="ufps-input-line" id="representante" >
                </div></div>
            
            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-2">    
                <div class="form-group" >

                    <label for="vigencia">Vigencia</label>
                    <input name="vigencia" type="number" class="ufps-input-line" id="vigencia" placeholder="Digitar Meses" >
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
                <center>
                    
            <div class="ufps-col-tablet-10 ufps-col-tablet-offset-1">

                <div class="form-group col-md-4">
                    <br> <label for="fecharadicacion" title="Fecha en que se radica el convenio.">Fecha radicación: <span class="glyphicon glyphicon-question-sign"></span></label>
                    <input type="date" class="ufps-input" id="fecharadicacion" name="fecharadicacion" onchange="fijarfechainicio_inicio(this.value)">
                </div>

                <div class="form-group col-md-4">
                    <br> <label for="fechainicio" title="Fecha en que se inicia el convenio.">Fecha inicio: <span class="glyphicon glyphicon-question-sign"></span></label>
                    <input type="date" class="ufps-input" id="fechainicio" name="fechainicio" onchange="fijarfechainicio_terminacion(this.value)">
                </div>

                
            </div><center>
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

        </form>
                        </center>

</body>         

</html>
