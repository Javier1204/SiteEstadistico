<%-- 
    Document   : registro_solicitud
    Created on : 30/10/2016, 05:19:56 PM
    Author     : Administrador
--%>
<%@page import="Practicas.DTO.estudianteDTO"%>
<%@page import="Practicas.DTO.tutor_empresaDTO"%>
<%@page import="Practicas.DTO.convenioDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.Facade.Facade"%>
<%
    Facade fachada = new Facade();
if(request.getSession().getAttribute("respuesta_registro_practica")!=null){
    
    %>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_registro_practica")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_registro_practica", null);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                 <div class="ufps-navbar-left nav"><li><a href="index.jsp" class="  ufps-navbar-btn  " >INICIO</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="estudiantes.jsp" class="  ufps-navbar-btn  " >ESTUDIANTES</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >CONVENIOS</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >EMPRESAS</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="perfil.jsp" class="  ufps-navbar-btn  " >PERFILES</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="" class="  ufps-navbar-btn  " >CONSULTAS E INFORMES</a></li></div>
                 
             </div>
                
                 
                
        </div>
        
        <div class="ufps-pull-right">
            <div class="thumbnail">
                <img src="concierge_bell.png">
                <button class="ufps-badge-gray" data-badge="6">Notificaciones</button>
            </div>
        </div>
    
        <center><h2>REGISTRAR PRACTICAS</h2></center>
        
        <div class="ufps-container" id="contenido">
           <fieldset>
            <h2>Información basica</h2>
            Solo los espacios señalados con asterisco(*) son necesarios para registrar la práctica. 
            El resto de los campos puede ser agregados más adelante. 
             <br> <br> <br>
             
                <div class="ufps-col-tablet-5 ufps-col-offset-7">
                    <label for="año"><b>Año*:</b> <span class="glyphicon glyphicon-question-sign"></span></label>
                    <input type="text" class="ufps-input" id="año">
                </div>
              <div class="ufps-col-tablet-5 ufps-col-offset-7">
                  <label for="semestre"><b>Semestre*: </b></label>
                  <input type="text" class="ufps-input" id="semestre" >                              
              </div>  
              <br>
              <div class="ufps-col-tablet-5 ufps-col-offset-7">
                <label for="estado"><b>Estado*</b></label> 
                <select id="valor" name="estado" class="ufps-input " >
                    <option value="1">No asignada</option>
                    <option value="2">Asignada</option>
                    <option value="3">Cancelada</option>
                    <option value="4">Finalizada</option>
                </select>
                </div>
              <br>
              <div class="ufps-col-tablet-5 ufps-col-offset-7">
                <label for="perfil"><b>Perfil*</b></label> 
                <select id="valor" name="perfil" class="ufps-input " >
                    <option value="1">Capacitación</option>
                    <option value="2">Mantenimiento Hardware</option>
                    <option value="3">Mantenimiento Redes</option>
                    <option value="4">Desarrollo Software</option>
                    <option value="5">Desarrollo Web</option>
                </select>
              </div>
              <BR>
              
           </fieldset>
            <br>
            <fieldset>
             
                <h2>Relaciones</h2>
                
             
                  <div class="ufps-col-tablet-5 ufps-col-offset-7">
                                <div class="form-group" >
                                    <label for="idconvenio" >Seleccione el convenio asociado a la Practica*</label>
                                    <select id="idconvenio" name="idconvenio" class="ufps-input-line ">
                                        
                                        <%
                                            ArrayList<convenioDTO> convenios = fachada.obtenerConvenios();
                                            for(convenioDTO e: convenios){
                                        %>
                                        <option value="<%=e.getIdconvenio()%>"><%=e.getNombreConvenio()%></option>
                                        
                                        <%}
                                        %>
                  
             
                          </select>

                                </div> </div>
                                        
                  <div class="form-group">
                     <a href="registro_convenio.jsp" class="btn ufps-btn" role="button">Nuevo Convenio</a>
                     </div>
                                                     
                <BR>
                <br>
                <br>
             
             <div class="ufps-col-tablet-5 ufps-col-offset-7">
                                <div class="form-group" >
                                    <label for="idtutor" >Seleccione el Tutor asociado a la Empresa*</label>
                                    <select id="idtutor" name="idtutor" class="ufps-input-line ">
                                        
                                        <%
                                            ArrayList<tutor_empresaDTO> tutores = fachada.obtenerTutores();
                                            for(tutor_empresaDTO e: tutores){
                                        %>
                                        <option value="<%=e.getIdtutor()%>"><%=e.getNombreTutor()%></option>
                                        
                                        <%}
                                        %>
                  
             
                          </select>

                                </div> </div>
                                        
                  <div class="form-group">
                      <a href="registro_Tutor.jsp" class="btn ufps-btn" role="button">Nuevo Tutor Empresa</a>
                     </div>
                <BR>
                <br>
                <br>
                             
                                  
                <div class="ufps-col-tablet-5 ufps-col-offset-7">
                 <label for="docente"><b>Tutor docente: </b></label>
                  <input type="button" class="ufps-btn" id="idocente" value="Buscar Docente">   
                </div>
              <br>
              <BR>
                <br>
                <br>
             
                <div class="ufps-col-tablet-5 ufps-col-offset-7">
                                <div class="form-group" >
                                    <label for="idestudiante" >Seleccione estudiante ascociado a la Empresa*</label>
                                    <select id="idestudiante" name="idestudiante" class="ufps-input-line ">
                                        
                                        <%
                                            ArrayList<estudianteDTO> estudiantes = fachada.obtenerEstudiante();
                                            for(estudianteDTO e: estudiantes){
                                        %>
                                        <option value="<%=e.getCodigoEstudiante()%>"><%=e.getNombresEstudiante()%></option>
                                        
                                        <%}
                                        %>
                  
             
                          </select>

                     </div> </div>
                                        
                  
                
            </fieldset>
            
            <BR>
            <fieldset>
                <h2> Documentos adjuntos</h2>
                 <center>
             <div class="form-group">
                  <label for="semestre"><b>Carta de solicitud: </b></label>
                 <form enctype="multipart/form-data" action="uploader.php" method="POST">
                    <input name="uploadedfile" type="file" />
                    <input type="submit" value="Subir archivo" />
                 </form> 
             </div>
                    
               <br>
                <div class="form-group">
                    <label for="convenio"><b>Convenio(Documento) </b></label>
                    <form enctype="multipart/form-data" action="uploader.php" method="POST">
                        <input name="uploadedfile" type="file" />
                        <input type="submit" value="Subir archivo" />
                    </form> 
                </div>
              <br>
                <div class="form-group">
                    <label for="convenio"><b>Carta de aceptación(Documento) </b></label>
                    <form enctype="multipart/form-data" action="uploader.php" method="POST">
                        <input name="uploadedfile" type="file" />
                        <input type="submit" value="Subir archivo" />
                    </form> 
                </div>
              <br>
                <div class="form-group">
                    <label for="convenio"><b>Carta de cumplimiento(Documento) </b></label>
                    <form enctype="multipart/form-data" action="uploader.php" method="POST">
                        <input name="uploadedfile" type="file" />
                        <input type="submit" value="Subir archivo" />
                    </form> 
                </div>
               <br><br><br>
            </center>    
            <center><div class="ufps-col-tablet-12 ">  
                <div class="form-group">
                    <button type="submit" class="ufps-btn">Finalizar Registro</button>
                </div> 
            </div></center>
            </fieldset>
        </div>
        <BR><BR>
           
    </body>
    
    <BR><br>
    
    <footer>
         <div class="ufps-container ufps-footer-light">
            <center><h5 class="text-center">Universidad Francisco de Paula Santander</h5>
                <h6 class="text-center">Programa Ingeniería de Sistemas<br>
                <h5> 2016</h5>
                Desarrollador por estudiantes de Seminario Integrador III</h6>
             </center>
        </div> 
    </footer>
    
</html>