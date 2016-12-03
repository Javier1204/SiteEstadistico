<%-- 
    Document   : registro_solicitud
    Created on : 30/10/2016, 05:19:56 PM
    Author     : Administrador
--%>
<%@page import="java.util.List"%>
<%@page import="Practicas.DTO.perfilDTO"%>
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
        <script type="text/javascript" lib="/jquery-1.9.1.jar"></script>  
        <script type="text/javascript">
                    function combo()
                    {
                    $("#f_opc").val("1");
                    $.post("comboD.jsp"),$("#data").serialize(),function(data){$("#id_tutor").html(data);})
                    alert("cambiar a select dependiente");
                    System.out.println("paso por aqui");
                    }
</script>
        
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
                 <div class="ufps-navbar-left nav"><li><a href="perfil.jsp" class="  ufps-navbar-btn  " >PERFILES DE PRACTICA</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="estudiantes.jsp" class="  ufps-navbar-btn  " >ESTUDIANTES</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >EMPRESAS</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >CONVENIOS</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="mostrar_practica.jsp" class="  ufps-navbar-btn  " >PRACTICAS</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="" class="  ufps-navbar-btn  " >CONSULTAS E INFORMES</a></li></div>
                 
             </div>
                
                 
                
        </div>
        
        
       
        <center><h2>REGISTRAR PRACTICAS</h2></center>
        
        <div class="ufps-container" id="contenido">
            
            <form action="registro_practica_p.jsp" method="POST"> 
           <fieldset>
            <h2>Información basica</h2>
            Solo los espacios señalados con asterisco(*) son necesarios para registrar la práctica. 
            El resto de los campos puede ser agregados más adelante. 
             <br> <br> <br>
             
             
             
                <div class="ufps-col-tablet-5 ufps-col-offset-7">
                    <label for="ano_practica">Año*:</label>
                    <input name="ano_practica" type="text" class="ufps-input-line" id="linea1" required="" >
                </div>
              <div class="ufps-col-tablet-5 ufps-col-offset-7">
                  <label for="semestre_practica">Semestre*:</label>
                  <input name="semestre_practica" type="number" min="1" max="2" class="ufps-input-line" id="linea1" required="" placeholder="semestre">                              
              </div>  
              <br>
              <div class="ufps-col-tablet-5 ufps-col-offset-7">
                <label for="estado">Estado*</label> 
                <select id="estado" name="estado" class="ufps-input " required=""  >
                    <option value="No asignada">No asignada</option>
                    <option value="Asignada">Asignada</option>
                    <option value="Cancelada">Cancelada</option>
                    <option value="Finalizada">Finalizada</option>
                </select>
                </div>
              <br>
              <div class="ufps-col-tablet-5 ufps-col-offset-7">
                <label for="id_perfil">Perfil*</label> 
                <select id="id_perfil" name="id_perfil" class="ufps-input "  required="">
                                        
                                        <%
                                            List<perfilDTO> perfiles = fachada.listarPerfil();
                                            for(perfilDTO e: perfiles){
                                        %>
                                        <option value="<%=e.getIdperfil()%>"><%=e.getNombre()%></option>
                                        
                                        <%}
                                        %>
                </select>
              </div>
              
                <BR>
                <BR>
                <BR>
                <BR>
                <BR>
             
                  <div class="ufps-col-tablet-5 ufps-col-offset-7">
                                <div class="form-group" >
                                    <input type="hidden" name="i_opc" id="i_opc">
                                     <BR>
                                    <label for="id_convenio" >Seleccione el convenio asociado a la Practica*</label>
                                    <select id="id_convenio" name="id_convenio" class="ufps-input-line " onchange="combo()" >
                                        
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
                                     <BR>
                                    <label for="id_tutor" >Seleccione el Tutor asociado a la Empresa*</label>
                                    <select id="id_tutor" name="id_tutor" class="ufps-input-line " >
                                        
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
                 
                    <label for="id_docente">Codigo del Docente de Practica*:</label>
                  <input name="id_docente" type="text" class="ufps-input-line" id="linea1" required="" >   
                </div>
                <br>
                <BR>
                <br>
                <br>
             
                <div class="ufps-col-tablet-5 ufps-col-offset-7">
                                <div class="form-group" >
                                     <BR>
                                    <label for="id_estudiante" >Seleccione estudiante ascociado a la Empresa*</label>
                                    <select id="id_estudiante" name="id_estudiante" class="ufps-input-line " >
                                        
                                        <%
                                            ArrayList<estudianteDTO> estudiantes = fachada.obtenerEstudiantes();
                                            for(estudianteDTO e: estudiantes){
                                        %>
                                        <option value="<%=e.getCodigoEstudiante()%>"><%=e.getNombresEstudiante()%></option>
                                        
                                        <%}
                                        %>
                  
             
                          </select>

                     </div> </div>
                                        
            <center><div class="ufps-col-tablet-12 ">  
                <div class="form-group">
                    <div class="caption">
                        <button type="submit" class="ufps-btn" id="btnAgregar">Registrar Practica</button>
                    </div>
                </div> 
            </div></center>      
                
            </fieldset>
       </form>  
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