
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.DTO.perfil_estudianteDTO"%>
<%@page import="Practicas.DTO.perfilDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Practicas.Facade.Facade" %>
<%@page import="Practicas.DTO.estudianteDTO"%>

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
<jsp:include page="../plantilla/header.jsp"/>  

<div class="ufps-col-mobile-12 ufps-col-tablet-2">
    <ul>
        <li><a href="datosDocente.jsp" class="  ufps-navbar-btn  " > Datos del docente</a></li>                 
    </ul>
</div>
        
<div  class="ufps-container" id="contenido">
    <fieldset>
        <center>
            <h1>Modulo de practicas </h1>
            <h2>- Site Estadistico - </h2>
        </center>
        <BR>
        <div class="row">
            
            
            <div class="col-xs-12 col-md-4">
                <div class="ufps-img-thumbnail">
                    <img src="img/perfiles.jpeg" alt="imagen de evento">
                    <div class="caption">
                        <p><a href="perfil.jsp" class="btn ufps-btn" role="button">Perfiles de practica</a></p>
                    </div>
                </div>
             </div>
            
            <div class="col-xs-12 col-md-4">
                <div class="ufps-img-thumbnail">
                    <img src="img/empresa.jpeg" alt="imagen de evento">
                    <div class="caption">
                        <p><a href="mostrar_empresa.jsp" class="btn ufps-btn" role="button">Empresas</a></p>
                    </div>
                </div>
             </div>
            
            <div class="col-xs-12 col-md-4">
                <div class="ufps-img-thumbnail">
                    <img src="img/convenios.jpeg" alt="imagen de evento" >
                    <div class="caption">
                        <p><a href="mostrar_convenio.jsp" class="btn ufps-btn" role="button">Convenios</a></p>
                    </div>
                </div>
             </div>

             
             <div class="col-xs-12 col-md-4">
                <div class="ufps-img-thumbnail">
                    <img src="img/estudiantes.jpeg" alt="imagen de evento" >
                    <div class="caption">
                        <p><a href="estudiantes.jsp" class="btn ufps-btn" role="button">Estudiantes</a></p>
                    </div>
                </div>
             </div>   
         
            <div class="col-xs-12 col-md-4">
                <div class="ufps-img-thumbnail">
                    <img src="img/practicas.jpeg" alt="imagen de evento" >
                    <div class="caption">
                        <p><a href="mostrar_practica.jsp" class="btn ufps-btn" role="button">Practicas</a></p>
                    </div>
                </div>
             </div>

             <div class="col-xs-12 col-md-4">
                <div class="ufps-img-thumbnail">
                    <img src="img/informes.jpeg" alt="imagen de evento">
                    <div class="caption">
                        <p><a href="generar_estadisticas.jsp" class="btn ufps-btn" role="button">Estadisticas</a></p>
                    </div>
                </div>
             </div>

               
            
        </div>
    </fieldset>
</div>
        
<jsp:include page="../plantilla/footer.jsp"/> 