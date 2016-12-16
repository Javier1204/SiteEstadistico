<%-- 
    Document   : registrarEntidad
    Created on : 29/10/2016, 05:59:06 PM
    Author     : HeinerV
--%>

<%@page import="Internacionalizacion.Modelo.DTO.Docente"%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Internacionalizacion.Modelo.DTO.Pais"%>
<%@page import="Internacionalizacion.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    
    alert("NO ESTÁ HABILITADO POR EL COORDINADOR!");
</script>
<%
    response.sendRedirect("index.jsp");
}
}

    

    
    
if (request.getSession().getAttribute("respuesta_actividad") != null) {

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
    
    <body>             

        
        <!--Contenido-->
        
                    <center><form action="registrarEntidad_pro.jsp" method="POST" center>
                            <fieldset>
                                <!-- Form Name -->
                                <legend><center><strong><h1>Formulario para el Registro de Entidades</h1></strong></center></legend>
                            </fieldset>
                            <div class="ufps-col-tablet-12 ufps-col-tablet-offset">
                                <div class="form-group">

                                    <br><label for="nombre">Nombre Entidad</label>
                                    <input name="nombre" type="text" class="ufps-input-line" id="entidad" >
                                </div>  </div>
                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <label for="pais">NIT</label>
                                <input type="text" name ="nit" class="ufps-input-line">
                            </div>
                            <div class="ufps-col-tablet-12 ufps-col-tablet-offset">    
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
                            <div class="ufps-col-tablet-12 ufps-col-tablet-offset">
                                <label for="pais">Direccion</label>
                                <input type="text" name ="direccion" class="ufps-input-line">
                            </div>

                            <div class="ufps-col-tablet-6 ufps-col-tablet-offset-3">
                                <div class="form-group">
                                    <label for="pais">Seleccione el Pais de la Entidad</label>
                                    <select name="pais" class="ufps-input-line " >
                                        <%
                                            ArrayList<Pais> paises = fachada.obtenerPaises();

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
                


    </body>

    <!--Footer-->

     
   
</html>
