<%@page import="gestionUsuarios.ICuenta"%>
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
        boolean b=cuenta.containRol("Estudiante");
        boolean m=cuenta.containModulo("Practicas");
    }
    
%>

<jsp:include page="../plantilla/header.jsp"/>  

    <div class="ufps-col-mobile-12 ufps-col-tablet-2">
        <li><a href="index_estudiante.jsp" class="  ufps-navbar-btn  " >Inicio </a></li>            
        <li><a href="editar_perfil_estudiante.jsp" class="  ufps-navbar-btn  " >Mi Perfil </a></li>                       
    </div>
      
      <center><strong><h1>INFORMES DE PRACTICAS</h1></strong></center> 
            
      
      <div  class="ufps-container" id="contenido">
          <fieldset>  
          <center>
            
            <h2>Documentos </h2> 
            Aqui deberá cargar los documentos solicitados
            <br> <br>
            
             <div class="form-group">
                  <label for="informe1"><b>Primer informe</b></label>
                 <form enctype="multipart/form-data" action="uploader.php" method="POST">
                    <input name="uploadedfile" type="file" />
                    <input type="submit" value="Enviar archivo" />
                 </form> 
             </div>
                    
               <br>
                <div class="form-group">
                    <label for="informe2"><b>Segundo informe</b></label>
                    <form enctype="multipart/form-data" action="uploader.php" method="POST">
                        <input name="uploadedfile" type="file" />
                        <input type="submit" value="Enviar archivo" />
                    </form> 
                </div>
              <br>
                <div class="form-group">
                    <label for="informe3"><b>Informe final</b></label>
                    <form enctype="multipart/form-data" action="uploader.php" method="POST">
                        <input name="uploadedfile" type="file" />
                        <input type="submit" value="Enviar archivo" />
                    </form> 
                </div>
              <br>
               <br>    
        </fieldset>
         </div>   
        <BR>

    <BR><BR><BR>
  <jsp:include page="../plantilla/footer.jsp"/> 