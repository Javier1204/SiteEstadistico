
<%@page import="gestionUsuarios.ICuenta"%>
<%@ page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page import="Practicas.DTO.empresaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : registro_convenio
    Created on : 30/10/2016, 05:16:28 PM
    Author     : Administrador
--%>
<%

    ICuenta cuenta=null;
    String codigo=null;
    
    if(session.getAttribute("usuario")!=null){
        cuenta=(ICuenta)session.getAttribute("usuario");
    }
    
    if(cuenta!=null){
        codigo=cuenta.getUser();
        boolean b=cuenta.containRol("Coordinador practicas");
        boolean m=cuenta.containModulo("Practicas");
    }
    
%> 

<%
    Facade fachada = new Facade();
if(request.getSession().getAttribute("respuesta_convenio")!=null){
%>
<div class="ufps-alert-red" center>
    <span class="ufps-close-alert-btn">x</span>Se registro Correctamente el Convenio.
</div>
<script type="text/javascript">
        alert("<%=request.getSession().getAttribute("respuesta_convenio")%>");
</script>
<%}
    request.getSession().setAttribute("respuesta_convenio", null);
%>

<jsp:include page="../plantilla/header.jsp"/>  

<div class="ufps-col-mobile-12 ufps-col-tablet-2">
        <li><a href="index_1.jsp" class="  ufps-navbar-btn  " >INICIO</a></li>
        <li><a href="perfil.jsp" class="  ufps-navbar-btn  " >PERFILES DE PRACTICA</a></li>
        <li><a href="estudiantes.jsp" class="  ufps-navbar-btn  " >ESTUDIANTES</a></li>
        <li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >EMPRESAS</a></li>
        <li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >CONVENIOS</a></li>
        <li><a href="mostrar_practica.jsp" class="  ufps-navbar-btn  " >PRACTICAS</a></li>
        <li><a href="" class="  ufps-navbar-btn  " >CONSULTAS E INFORMES</a></li>
                 
    </div>
      
<div  class="ufps-container" id="contenido">
          <center><form action="registrarConvenio_pro.jsp" method="POST" center>
          
                    
          <center><strong><h1>REGISTRO DE LOS CONVENIOS</h1></strong></center>
          
          
          <fieldset>
              <h2> Datos Basicos</h2>
              <br>
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                  <BR>                   
                                    <label for="id">Codigo Convenio:</label>
                                     <input name="id" type="text" class="ufps-input-line" id="linea1" required="" >                              
             
                                                    
              </div>
 <%            
                Date date = new java.sql.Date(System.currentTimeMillis());
                SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
                String currentDate = ft.format(date);
                System.out.println("fecha"+currentDate);
%>             
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                  <BR>                   
                                     <label for="fecha_radicacion">Fecha Radicación</label>
                                     <input type="text" class="ufps-input" id="fecha_radicacion" name="fecha_radicacion"  required="" value="<%=currentDate%>" >                            
             
                                                    
              </div>
              
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                  <BR>                   
                                    <label for="nombre">Nombre:</label>
                                     <input name="nombre" type="text" class="ufps-input-line" id="linea1" required="" >                              
             
                                                    
              </div>
              
             <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1"> 
                  <BR>             
                  <label for="creacion" title="Fecha en que se creó el convenio.">Fecha creación: <span class="glyphicon glyphicon-question-sign"></span></label>
                                    <input type="date" class="ufps-input" id="fechacreacion" name="fechacreacion" required="" onchange="fijarfechainicio_inicio(this.value)">                                     
                                
              </div>
              
       

                          
       

       
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
 <BR>
                  <div class="form-group">
                                      <label for="vigencia">Vigencia:</label>
                                     <input name="vigencia" type="text" class="ufps-input-line" id="linea3"  >
                                 </div>  
              </div>
              
              
                            
           <%--   <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                  <BR>
                  <div class="form-group" >
                                    <label for="estado">Estado</label>
                                    <select id="estado" name="estado" class="ufps-input-line " required="">
                                        <option value="Aprobado">Aprobado</option>
                                        <option value="Terminado">Terminado</option>


                                    </select>

                                </div> </div>
              --%>
              
              
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1 ">
                  <BR>
                  <div class="form-group">
                                     <label for="descripcion">Descripcion:</label>
                                     <input name="descripcion" type="text" class="ufps-input-line" id="linea7" required="" >
                                 </div>  
              </div>
               
                  <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
<BR>
                      <div class="form-group" >
                                    <label for="entidad" >Seleccione la Entidad asociada al Convenio</label>
                                    <select id="entidad" name="entidad" class="ufps-input-line " required="">
                                        
                                        <%
                                            ArrayList<empresaDTO> entidades = fachada.obtenerEmpresas();
                                            for(empresaDTO e: entidades){
                                        %>
                                        <option value="<%=e.getIdempresa()%>"><%=e.getNombreEmpresa()%></option>
                                        
                                        <%}
                                        %>
                                    </select>
<BR>
<BR>
                                </div> </div>          
        
              
                                    
         <BR>

                
              
        
        </fieldset>   
            <BR>    
            <center><div class="ufps-col-tablet-12 ">  
            <div class="btn-group btn-group-justified">
                <button type="submit" class="ufps-btn">Registrar Convenio</button>
                 <div class="caption">
                        <p><a href="mostrar_convenio.jsp" class="btn ufps-btn" role="button">Volver</a></p>
                    </div>
            </div></div></center>                     
                                    
       
            
            
            
          </center>
          
     <BR>   
     </form>
      </div>      

      <jsp:include page="../plantilla/footer.jsp"/> 