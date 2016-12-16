<%--
    Document   : formRegistraractividad
    Created on : 30/11/2016, 07:59:51 PM
    Author     : JAVIER
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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
    String codigo = "";
    Facade fachada = new Facade();
    Docente d = null;
    if (cuenta != null) {
        codigo = cuenta.getUser();

        d = fachada.consultarDocente(codigo);
        if (!d.isHabilitado()) {

%>
<script type="text/javascript">

    alert("NO ESTÁ HABILITADO POR EL COORDINADOR!");
</script>
<%            response.sendRedirect("index.jsp");
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
        <form action="subirInforme_pro.jsp" method="POST" enctype="multipart/form-data" >
            <fieldset>
                <!-- Form Name -->
                <legend><center><strong><h1>Formulario para el Subir Informes</h1></strong></center></legend>
            </fieldset>
            <div class="ufps-col-tablet-10 ufps-col-tablet">
                <div class="form-group">

                    <br><label for="nombre">Nombre del informe</label>
                    <input name="nombre" type="text" class="ufps-input-line" id="nombre" autocomplete="off">
                </div>  
            </div>


            <div class="ufps-col-tablet-10 ufps-col-tablet">    
                <div class="form-group" >

                    <label for="descripcion">Descripcion</label>
                    <input name="descripcion" type="text" class="ufps-input-line" id="representante" autocomplete="off"  >
                </div></div>

            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-2">    
                
<%   Calendar c1 = GregorianCalendar.getInstance();

    String annio = ""+c1.get(Calendar.YEAR); %>
                    <label for="año">Año</label>
                    <input  name="año" type="number" class="ufps-input-line"  min="2016" id="año" placeholder="Digitar Año" >
                </div>


            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-2">
                <div class="form-group">
                    <br><label for="semestre">Seleccione Semestre</label> <br><br>
                    <div class="ufps-col-tablet-4 ufps-col-tablet-offset-4">
                        <select type="number" id="tipo_convenio" name="semestre" class="ufps-input " >
                            <option value="1">1</option>
                            <option value="2">2</option>
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
            
                    <div class="ufps-col-tablet-10">  
                        <div class="form-group">
                            <button type="submit" class="ufps-btn">Subir Archivo</button>
                        </div> </div>

                    </form>
                </center>

                </body>         

                </html>