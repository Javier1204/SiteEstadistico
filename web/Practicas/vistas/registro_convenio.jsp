
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : registro_convenio
    Created on : 30/10/2016, 05:16:28 PM
    Author     : Administrador
--%>

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
                 <div class="ufps-navbar-left nav">
 
                     <li><a href="index.jsp" class="  ufps-navbar-btn  " >Home </a></li>
                     
                 </div>
                 
                  <div class="ufps-navbar-left nav">
 
                     <li><a href="index.jsp" class="  ufps-navbar-btn  " >Estudiantes </a></li>
                 </div>
                 
                <div class="ufps-navbar-left nav">

                     <li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >Empresa </a></li>
                 </div>
                 
                 
                 
                 <div class="ufps-navbar-left nav">

                     <li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >Convenios </a></li>
                 </div>
                 
                 
                  <div class="ufps-navbar-left nav">

                     <li><a href="registrar_practica.jsp" class="  ufps-navbar-btn  " >Practicas </a></li>
                 </div>
                 
                 
 
             </div>
        </div>
      
      
      <div  class="ufps-container" id="contenido">
          
          <center><strong><h1>REGISTRO DE LOS CONVENIOS</h1></strong></center>
          <fieldset>
              <h2> Datos Basicos</h2>
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                     <label for="nombre">Nombre:</label>
                                     <input name="nombre" type="text" class="ufps-input-line" id="linea1" >                              
             
                                                    
              </div>
              
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1"> 
                              <label for="fechaCreacion">Fecha de Creacion:</label>
                              <input type="date" class="ufps-input" id="linea1" name="fechaCreacion">
                                     
                                
              </div>
              
              
              
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
 
                                     <label for="FechaTerminacion">Fecha de terminacion:</label>
                                     <input type="date" class="ufps-input" id="linea3" name="fechaTerminacion">
                                 </div>  
              </div>
             
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
 
                                     <label for="vigencia">Vigencia:</label>
                                     <input name="vigencia" type="text" class="ufps-input-line" id="linea3" >
                                 </div>  
              </div>
              
              
                            
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                <div class="form-group" >
                                    <label for="estadoConvenio" >Seleccione el estado del  Convenio</label>
                                    <select id="estadoConvenio" name="estadoConv" class="ufps-input-line ">
                                        <option value="1"> Aprobado</option>
                                        <option value="2">Terminado</option>
                                        

                                    </select>

                                </div> </div>
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
 
                                     <label for="tipoConvenio">Tipo:</label>
                                     <input name="tipoConvenio" type="text" class="ufps-input-line" id="linea5" >
                                 </div>  
              </div>
              
              
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1 ">
                                 <div class="form-group">

                                     <label for="descripcion">Descripcion:</label>
                                     <input name="descripcion" type="text" class="ufps-input-line" id="linea7" >
                                 </div>  
              </div>
               
                  <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                <div class="form-group" >
                                    <label for="entidad" >Seleccione la Entidad asociada al Convenio</label>
                                    <select id="entidad" name="entidad" class="ufps-input-line ">
                                        <option value="1"> Entidad 1</option>
                                        <option value="2">Entidad 2</option>
                                        <option value="2">Entidad 3</option>

                                    </select>

                                </div> </div>          
              
          </fieldset>
     <BR>     
      </div>
        
      
        <BR>
       <center><div class="ufps-col-tablet-12 ">  
            <div class="btn-group btn-group-justified"">
                <button type="submit" class="ufps-btn">Registrar Convenio</button>
                
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