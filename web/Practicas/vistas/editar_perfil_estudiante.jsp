
<%@page import="Practicas.DTO.estudianteDTO"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Prácticas</title
        <link href="../estilos/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link href="../estilos/css/ufps.css" rel="stylesheet">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/default.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/highlight.min.js"></script>
        <script src="../estilos/js/ufps.js"></script>
    </head>
    <body>
        
        <header>
            <center> <img id="banner" src="../estilos/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header>
       
            <div class="ufps-navbar ufps-container " id="menu"  center>
             <div class="ufps-container-fluid">
                 <div class="ufps-navbar-brand">
                     <div class="ufps-btn-menu" onclick="toggleMenu('menu')">
                         <div class="ufps-btn-menu-bar"> </div>
                         <div class="ufps-btn-menu-bar"> </div>
                         <div class="ufps-btn-menu-bar"> </div>
                         <div class="ufps-btn-menu-bar"> </div>
 
                     </div>
 
                 </div>
                 <div class="ufps-navbar-left nav"><li><a href="index_estudiante.jsp" class="  ufps-navbar-btn  " >Inicio </a></li> </div>
                 
                 <div class="ufps-navbar-left nav">
                     <li><a href="informes.jsp" class="  ufps-navbar-btn  " >Informes </a></li>
                 </div>
 
 
             </div>
        </div>
      
        <%
          Facade f = new Facade();
          
          int codigo = 1150234;
          estudianteDTO ed = new estudianteDTO();
          ed = f.buscarEstudiante(codigo);
          System.out.println("Estudiante consultado. " + ed.toString());
         
      %>
      
      <div  class="ufps-container" id="contenido">
          
          <center><strong><h1>EDITAR INFORMACION </h1></strong></center>    
        <br>        
          <fieldset>
              <h2> Datos Basicos</h2>
              <br>
              
              <div class="form-group">
                  <label for="codigo"><b>Codigo:</b></label>
                     <input type="text" class="ufps-input" id="codigo" value="<%=ed.getCodigoEstudiante()%>">                               
                
              </div>
              <div class="form-group">
                  <label for="cedula"><b>Cedula:</b></label>
                     <input type="text" class="ufps-input" id="cedula" value="<%=ed.getCedula()%>">                               
                
              </div>
              <div class="form-group">
                  <label for="nombreEst"><b>Nombres:</b></label>
                     <input type="text" class="ufps-input" id="nombreEst" value="<%=ed.getNombresEstudiante()%>">                              
                
              </div>
              <div class="form-group"> 
                  <label for="apellidosEst"><b>Apellidos:</b></label>
                  <input type="text" class="ufps-input" id="apellidosEst" value="<%=ed.getApellidosEstudiante()%>">            
              </div
              <br>
               <div class="form-group">
                  <label for="direccionEst"><b>Direccion:</b></label>
                  <input type="text" class="ufps-input" id="direccionEst" >
               </div>  
                <div class="form-group col-md-6">
                    <label for="nacimiento" title="FechaNacimiento"><b>Fecha Nacimiento:</b><span class="glyphicon glyphicon-question-sign"></span></label>
                    <input type="date" class="ufps-input" id="nacimiento">
                </div>
                <div class="form-group">
                    <label for="telefonoEst"><b>Telefono:</b></label>
                    <input name="telefono" type="text" class="ufps-input" id="telefonoEst" >
                </div>
            
                <div class="form-group">
                    <label for="emailEst"><b>Email:</b></label>
                    <input type="text" class="ufps-input" id="emailEst" >
                </div>  
                
              <div class="form-group">
                    <label for="semestre"><b>Semestre:</b></label>
                    <input type="text" class="ufps-input" id="semestre" value="<%=ed.getSemestre()%>" >
                    
                </div>  
    
              <br>
          </fieldset>
     <BR>     
      </div>
        
       
        <BR>
         <div class="ufps-container" id="contenido"> 
        <fieldset>
            <h2>Documentos adicionales:</h2> 
            Aqui deberá cargar los documentos solicitados
            <br> <br>
            <center>
             <div class="form-group">
                  <label for="cedula"><b>Escaneo de la cédula (pdf)</b></label>
                 <form enctype="multipart/form-data" action="uploader.php" method="POST">
                    <input name="uploadedfile" type="file" />
                    <input type="submit" value="Subir archivo" />
                 </form> 
             </div>
                    
               <br>
                <div class="form-group">
                    <label for="horario"><b>Horario(imagen)</b></label>
                    <form enctype="multipart/form-data" action="uploader.php" method="POST">
                        <input name="uploadedfile" type="file" />
                        <input type="submit" value="Subir archivo" />
                    </form> 
                </div>
              <br>
                <div class="form-group">
                    <label for="hv"><b>Hoja de vida(Documento) </b></label>
                    <form enctype="multipart/form-data" action="uploader.php" method="POST">
                        <input name="uploadedfile" type="file" />
                        <input type="submit" value="Subir archivo" />
                    </form> 
                </div>
              <br>
                <div class="form-group">
                    <label for="afiliacion"><b>Afiliacion a ARS/EPS (imagen)</b></label>
                    <form enctype="multipart/form-data" action="uploader.php" method="POST">
                        <input name="uploadedfile" type="file" />
                        <input type="submit" value="Subir archivo" />
                    </form> 
                </div>
              <br>
              En el caso de tener una empresa, adjuntar la carta solicitante
                <div class="form-group">
                    <label for="afiliacion"><b>Carta solicitante(Documento)</b></label>
                    <form enctype="multipart/form-data" action="uploader.php" method="POST">
                        <input name="uploadedfile" type="file" />
                        <input type="submit" value="Subir archivo" />
                    </form> 
                </div>
               <br><br>    
        </fieldset>
         </div>>     
        <BR>
        
       <center><div class="ufps-col-tablet-12 ">  
            <div class="form-group">
                <button type="submit" class="ufps-btn">Guardar Cambios</button>
            </div> 
       </div></center>
    
       
        
    </body>
    <BR><BR><BR>
    <footer>
         <div class="ufps-container ufps-footer-light">
            <center><h5 class="text-center">Universidad Francisco de Paula Santander</h5>
                <h6 class="text-center">Programa Ingeniería de Sistemas<br>
                Desarrollador por estudiantes de Seminario Integrador III</h6>
                <h5> 2016</h5>
             </center>
        </div> 
    </footer>
</html>