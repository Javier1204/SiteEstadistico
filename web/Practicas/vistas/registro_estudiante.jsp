
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.DTO.perfil_estudianteDTO"%>
<%@page import="Practicas.DTO.perfilDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Practicas.Facade.Facade" %>
<%@page import="Practicas.DTO.estudianteDTO"%>

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
        <link href="../estilos/css/bootstrap.css" rel="stylesheet" type="text/css"/>
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
 
                     <li><a href="index_estudiante.jsp" class="  ufps-navbar-btn  " >Inicio </a></li>
                     
                 </div>
 
 
             </div>
        </div>
      
      <%
          Facade f = new Facade();
          //AQUI OBTIENE LA SESION DEL ESTUDIANTE
          //escriba el codigo de un estudiante q tenga en la base de datos
          int codigo = 1150716;
          estudianteDTO ed = new estudianteDTO();
          ed = f.buscarEstudiante(codigo);
          System.out.println("Estudiante consultado. " + ed.toString());
         //no trae la drieccion? si ya vi que en no le agrego lo otro probemos con ese y si funciona yo completo lo ortr
      %>
        
      <div  class="ufps-container" id="contenido">
          <form method="POST" action="cargar_datos_estudiante.jsp">    
          <center><strong><h1>REGISTRO DE ESTUDIANTE DE PRACTICAS</h1></strong></center>                  
        <br><br>          
         
          <fieldset>
              <h2> Datos Basicos</h2>
              <br>
              <div class="form-group">
                  <label for="nombreEst"><b>Nombres:</b></label>
                     <input type="text" class="ufps-input" id="nombreEst" value="<%=ed.getNombresEstudiante()%>">                              
                
              </div>
              <div class="form-group"> 
                  <label for="apellidosEst"><b>Apellidos:</b></label>
                  <input type="text" class="ufps-input" id="apellidosEst" value="<%=ed.getApellidosEstudiante()%>">            
              </div
              <br>
              <br>
          </fieldset>
         </form>    
     <BR>     
      </div>
        
        <%
            List <perfilDTO> lista = f.listarPerfil();
        %>
        <div  class="ufps-container" id="contenido">
        <form method="POST" action="agregar_perfil.jsp"> 
           <fieldset>
               <h2>    Perfiles de practica</h2>
               
               En cada perfil debe asignarle un valor del 1 al 5 (siendo 1: No me interesa y 5:Me interesa mucho)
               <br><br>
                <div class="ufps-col-desktop-12 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
                    <div class="form-group">
                        <table class="ufps-table">
                            <thead><tr> 
                                <td align="center">Id. Perfil</td>
                                <td align="center">Nombre</td>
                                <td align="center">Valor</td>
                            </tr></thead>
                            <tbody>
                        <%  int n=0;
                            for(perfilDTO p: lista){  
                                n++;%>   
                            <tr>
                                <td align="center"> <%= p.getIdperfil()%> </td>
                                <td align="center"> <%= p.getNombre() %> </td>
                                <td align="center">  <input type="text" class="ufps-input" id="Valor<%=n%>"> </td>
                            </tr>
                        <% } %>
                            </tbody>
                        </table>
                    </div> 
                </div><br><br>       
                        
                  <input type="hidden" class="ufps-input" id="codigoEst" value="<%=codigo %>" name="codigoEst"> 
                  
                        <center><div class="ufps-col-tablet-12 ">  
                            <div class="form-group">
                                <button type="submit" class="ufps-btn" id="btnGuardarPerfiles">Guardar</button>
                            </div></div></center>
                        
              
                <br><br>
               
           </fieldset></form></div>  
      
        <BR>
         <div class="ufps-container" id="contenido"> 
          
        <fieldset>
        
            <h2>Documentos adicionales:</h2> 
            Aqui deberá cargar los documentos solicitados
            <br> <br>
            <center>
              
            
             <div class="form-group">
                 <form enctype="multipart/form-data" action="subir_archivo.jsp" method="POST"> 
                  <label for="cedula"><b>Escaneo de la cédula (pdf)</b></label>
                  <input name="uploadedfile" type="file" /> 
                  <input type="submit" class="ufps-btn" name="cedula" value="Subir Archivo">
                 </form>
             </div>
                    
               <br>
                <div class="form-group">
                    <form enctype="multipart/form-data" action="subir_archivo.jsp" method="POST"> 
                    <label for="horario"><b>Horario(imagen)</b></label>
                    <input name="uploadedfile" type="file" />
                    <input type="submit" class="ufps-btn" name="horario" value="Subir Archivo">
                    </form>
                </div>
              <br>
                <div class="form-group">
                    <form enctype="multipart/form-data" action="subir_archivo.jsp" method="POST"> 
                    <label for="hv"><b>Hoja de vida(Documento) </b></label>
                    <input name="uploadedfile" type="file" />
                    <input type="submit" class="ufps-btn" name="hv" value="Subir Archivo">
                    </form>
                </div>
              <br>
              
                <div class="form-group">
                    <form enctype="multipart/form-data" action="subir_archivo.jsp" method="POST"> 
                    <label for="afiliacion"><b>Afiliacion a ARS/EPS (imagen)</b></label>
                        <input name="uploadedfile" type="file">
                        <input type="submit" class="ufps-btn" name="afiliacion" value="Subir Archivo">
                    </form>    
                </div>
              <br>

               <br><br>  
            </form>   
            </center>
               <form method="POST">    
               <center><div class="ufps-col-tablet-12 ">  
                <div class="form-group">
                <button type="submit" class="ufps-btn" id="btnRegistrarEstudiante">Finalizar Registro</button>
                </div></div></center>
               </form> 
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