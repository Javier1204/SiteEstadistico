%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                     <li><a href="editar_perfil_estudiante.jsp" class="  ufps-navbar-btn  " >Mi Perfil </a></li>               
                 </div>
 
 
             </div>
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