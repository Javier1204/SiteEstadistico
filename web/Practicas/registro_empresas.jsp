<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
if(request.getSession().getAttribute("respuesta_entidad")!=null){
    
%>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_entidad")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_entidad", null);
%>
<jsp:include page="../plantilla/header.jsp"/>  
    <div class="ufps-col-mobile-12 ufps-col-tablet-2">
 
        <li><a href="index_1.jsp" class="  ufps-navbar-btn  " >INICIO</a></li>
        <li><a href="perfil.jsp" class="  ufps-navbar-btn  " >PERFILES DE PRACTICA</a></li>
        <li><a href="estudiantes.jsp" class="  ufps-navbar-btn  " >ESTUDIANTES</a></li>
        <li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >EMPRESAS</a></li>
        <li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >CONVENIOS</a></li>
        <li><a href="registro_practica.jsp" class="  ufps-navbar-btn  " >PRACTICAS</a></li>
        <li><a href="" class="  ufps-navbar-btn  " >CONSULTAS E INFORMES</a></li>

    </div>
      
      
<div  class="ufps-container" id="contenido">
          <form action="Registrar_empresa_p.jsp" method ="POST">
          <center><strong><h1>REGISTRO DE LA EMPRESA</h1></strong></center>
          <fieldset>
              <h2> Datos Basicos</h2>
              <br>
              <div class="ufps-col-tablet-10 ufps-col-tablet-offset-1">
                                     <label for="nombres">Nombre:</label>
                                     <input name="nombres" type="text" class="ufps-input-line" id="linea1" required="" >                              
                
              </div>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1"> 
                             <label for="nit">NIT:</label>
                                    <input name="nit" type="text" class="ufps-input-line" id="linea1" required="">
                                     
                                
              </div
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
 
                                     <label for="direccion">Direccion:</label>
                                     <input name="direccion" type="text" class="ufps-input-line" id="linea2" required="">
                                 </div>  
              </div>
             
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
 
                                     <label for="telefono">Telefono:</label>
                                     <input name="telefono" type="text" class="ufps-input-line" id="linea3" required="" >
                                 </div>  
              </div>
             
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
 
                                     <label for="representanteLegal">Representante Legal:</label>
                                     <input name="representanteLegal" type="text" class="ufps-input-line" id="linea3" required="" >
                                 </div>  
              </div>
              <br>
              <br>
               
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
       
                                 <div class="form-group">
                                     <br><label for="actEmpresa">Sector de la empresa:</label> <br><br>
                                     <div class="ufps-col-tablet-6 ufps-col-tablet-offset-1">
                                         <select id="actEmpresa" name="actEmpresa" class="ufps-input " required="">
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
                                        <option value=Turistico>Turistico</option>
                                    </select></div>
                                 </div>
                  
              </div>
              
               <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
                                     <br><label for="tipoEmpresa">Tipo de empresa:</label> <br><br>
                                     <div class="ufps-col-tablet-6 ufps-col-tablet-offset-1">
                                         <select id="tipoEmpresa" name="tipoEmpresa" class="ufps-input " required="">
                                             <option value="Publica">Publico</option>
                                             <option value="Privada">Privado</option>
                                             <option value="Mixta">Mixta</option>

                                    </select></div>
                                 </div>
                   
              </div>
          
        <BR> 
        <BR>
        <BR>
       <center><div class="group">  
            <div class="btn-group btn-group-justified">
                <button type="submit" class="ufps-btn">Registrar Empresa</button>
                 <div class="caption">
                        <p><a href="mostrar_empresa.jsp" class="btn ufps-btn" role="button">Volver</a></p>
                    </div>
            </div>
                
       </div></center>
      
      </fieldset>
</form>
      </div>
              

    <BR><BR><BR>
  <jsp:include page="../plantilla/footer.jsp"/> 