
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
 
                     <li><a href="../index.jsp" class="  ufps-navbar-btn  " >Home </a></li>
                     
                 </div>
 
 
             </div>
        </div>
      
      <%
          Facade f = new Facade();
          //AQUI OBTIENE LA SESION DEL ESTUDIANTE
          //escriba el codigo de un estudiante q tenga en la base de datos
          int codigo = 1151111;
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
               <div class="form-group">
                  <label for="direccionEst"><b>Direccion:</b></label>
                  <input type="text" class="ufps-input" id="direccionEst">
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
     
              <br>
          </fieldset>
         </form>    
     <BR>     
      </div>
        
        <%
            List <perfil_estudianteDTO> lista2= f.listarPerfilesEstudiante(codigo);
            List <perfilDTO> lista = f.listarPerfil();
            //int tam = lista.size();
            //int [] valores= new int[tam];
            //int ind=1;
            //for(int x=0; x<tam; x++){
              //  valores[x] = ind;
               // ind++;
           // }
        %>
       <div class="ufps-container" id="contenido"> 
        <form method="POST" action="agregar_perfil.jsp"> 
           <fieldset>
               <h2>    Perfiles de practica</h2>
               
               A continuacion deberá seleccionar cada perfil y asignarle un valor numero del combo de opciones. Tenga en cuenta que 1 representa lo que menos le interesa. 
               Por favor, repetir hasta que el sistema le indique. 
               <br>
               
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-0">
                                 <div class="form-group">
                                     <br><label for="perfiles">Seleccione Perfil</label> <br><br>
                                     <div class="ufps-col-tablet-6 ufps-col-tablet-offset-1">
                                         <select id="comboPerfiles" name="comboPerfiles" id="comboPerfiles" class="ufps-input " >
                                             <% for(perfilDTO p: lista){
                                             %>
                                             <option value="<%=p.getIdperfil() %>"> <%= p.getNombre() %> </option>
                                             <%
                                                 }
                                             %>
                                    </select></div>
                                 </div>  
              </div>
              
                <%
                %>                    
               <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
                                     <br><label for="valor_perfil">Asigne valor</label> <br><br>
                                                                         
                                            <input type="text" class="ufps-input" id="comboValor" >
                                        </div>  
                                         <%-- <select id="comboValor" name="comboValor" id="comboValor" class="ufps-input " >
                                             <%// for(int i=0; i<tam; i++){
                                                 
                                            // %>
                                             <option value="<%=valores[i] %>"> <%=valores[i]%> </option>
                                          //   <% 
                                        //         System.out.println(valores[i]);
                                      //       }
                                    //         %>
                                    </select></div>
                                         --%>
                                         </div>
                                 
              
            <BR>   
            <input type="hidden" class="ufps-input" id="codigoEst" value="<%=codigo %>" name="codigoEst"> 
          
            <center> <div class="ufps-col-tablet-12">  
                <div class="form-group">
                    <button type="submit" class="ufps-btn" id="btnAgregarPerfil">Aceptar</button>
                </div> 
            </div></center>
              
                <br><br>
               
            </fieldset></form></div>  
        <fieldset>
        <table class="ufps-table">
            <tr class="ufps-table-inserted tr"> 
            <td>Id de Perfil</td>
            <td>Nombre de Perfil</td>
            <td>Valor</td>
            <td>Opcion</td>
           </tr>
           
           <% for (perfil_estudianteDTO est: lista2){
               perfilDTO pd= f.buscarPerfil(est.getIdperfil());
           
           %>
           <tr>
            <td><%= est.getIdperfil() %></td>
            <td><%= pd.getNombre() %></td>
            <td> <%= est.getValor() %> </td>
            <td>
                <div class="form-group">
                   <button type="submit" class="ufps-btn-light" id="btnEliminarPerfil">Eliminar</button> 
                </div>  
            </td> 
           </tr>
           
           
           <%               
                   } 
           %>
        </table>
               
               <br>
               
           </fieldset>
          
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