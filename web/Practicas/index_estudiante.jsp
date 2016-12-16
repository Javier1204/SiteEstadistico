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
        boolean b=cuenta.containRol("Estudiante");
        boolean m=cuenta.containModulo("Practicas");
    }
    
%> 

<jsp:include page="../plantilla/header.jsp"/>         
           
            
        <div  class="ufps-container" id="contenido">
        <fieldset>
            <center>
                <h1>Modulo de practicas </h1>
                <h2>- Site Estadistico - </h2>
                <h3>Universidad Francisco de Paula Santander</h3>
            </center>
            <BR>
        <div class="row">
            
            <div class="col-xs-12 col-md-4">
                <div class="ufps-img-thumbnail">
                    <img src="img/editar.png" alt="imagen de evento" >
                    <div class="caption">
                        <p><a href="registro_estudiante.jsp" class="btn ufps-btn" role="button">Registro estudiante</a></p>
                    </div>
                </div>
             </div>

             <div class="col-xs-12 col-md-4">
                <div class="ufps-img-thumbnail">
                    <img src="img/enviar.png" alt="imagen de evento">
                    <div class="caption">
                        <p><a href="informes.jsp" class="btn ufps-btn" role="button">Enviar Informes</a></p>
                    </div>
                </div>
             </div>
  
        </div>
            </fieldset>
        </div>
<jsp:include page="../plantilla/footer.jsp"/>  
