<%-- 
    Document   : registro_Tutor
    Created on : 6/11/2016, 10:08:33 PM
    Author     : Usuario
--%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="Practicas.DTO.empresaDTO"%>
<%@page import="Practicas.DTO.tutor_empresaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.Facade.Facade"%>

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
    Facade f = new Facade();
if(request.getSession().getAttribute("respuesta_registro_Tutor")!=null){
    
%>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_registro_Tutor")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_registro_Tutor", null);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
          <form action="registrar_tutor_pro.jsp" method ="POST">
          <center><strong><h1>REGISTRO DEL TUTOR DE LA EMPRESA</h1></strong></center>
          <fieldset>
              <h2> Datos Basicos</h2>
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                     <label for="nombres">Nombre Completo:</label>
                                     <input name="nombres" type="text" class="ufps-input-line" id="linea1" required="" >                              
                
              </div>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1"> 
                              <label for="telefono">Telefono:</label>
                                    <input name="telefono" type="text" class="ufps-input-line" id="linea1" required="" >
                                     
                                
              </div
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
 
                                     <label for="cargo">Cargo:</label>
                                     <input name="cargo" type="text" class="ufps-input-line" id="linea2" required="">
                                 </div>  
               
                <BR>
              </div>
             
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
 
                                     <label for="email">Email:</label>
                                     <input name="email" type="text" class="ufps-input-line" id="linea3" required="">
                                 </div> 
                  <BR> 
      
              </div>
             
              <br>
              
               <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
<BR>
                      <div class="form-group" >
                                    <label for="entidad" >Seleccione la Entidad asociada al Convenio</label>
                                    <select id="entidad" name="entidad" class="ufps-input-line " required="">
                                        
                                        <%
                                            ArrayList<empresaDTO> entidades = f.obtenerEmpresas();
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
      <BR>
       <center><div class="group ">  
            <div class="btn-group btn-group-justified">
                <button type="submit" class="ufps-btn">Registrar Tutor</button>
                 
                <div class="caption">
                        <p><a href="registro_practica.jsp" class="btn ufps-btn" role="button">Volver</a></p>
                    </div>
            </div>
                
       </div></center>
      
      </fieldset>
          </form>
      </div>
        
    <BR><BR><BR>

    <jsp:include page="../plantilla/footer.jsp"/> 
