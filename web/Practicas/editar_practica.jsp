<%-- 
    Document   : editar_practica
    Created on : 27/11/2016, 08:51:29 PM
    Author     : Usuario
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="Practicas.DTO.perfilDTO"%>
<%@page import="java.util.List"%>
<%@page import="Practicas.DTO.practicaDTO"%>
<%@page import="Practicas.DTO.estudianteDTO"%>
<%@page import="Practicas.DTO.tutor_empresaDTO"%>
<%@page import="Practicas.DTO.convenioDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.Facade.Facade"%>


<jsp:include page="../plantilla/header.jsp"/>  

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

<%
    Facade fachada = new Facade();

            int id = Integer.parseInt(request.getParameter("idpractica"));
            System.out.println("Empresa id. " + id);
            practicaDTO ed = new practicaDTO();
            ed = fachada.buscarPractica(id);
            System.out.println("Empresa consultada. " + ed.toString());

if(request.getSession().getAttribute("respuesta_editar_practica")!=null){
    
    %>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_editar_practica")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_editar_practica", null);
%>

<%
/**
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  ICuenta cuenta=null;
  if(session.getAttribute("usuario")==null){
      System.out.print("entro");
      response.sendRedirect("login.jsp");
      return;
  }else{
        cuenta= (ICuenta) session.getAttribute("usuario");
  }
 */   
%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
                    function combo()
                    {
                    $("#f_opc").val("1");
                    $.post("comboD.jsp"),$("#data").serialize(),function(data){$("#id_tutor").html(data);})
                    alert("cambiar a select dependiente");
                    System.out.println("paso por aqui");
                    }
</script>

            <div class="ufps-navbar-left nav">
                <ul>
                    <li><a href="index_1.jsp" class="  ufps-navbar-btn  " >INICIO</a></li>
                    <li><a href="perfil.jsp" class="  ufps-navbar-btn  " >PERFILES DE PRACTICA</a></li>
                    <li><a href="estudiantes.jsp" class="  ufps-navbar-btn  " >ESTUDIANTES</a></li>
                    <li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >EMPRESAS</a></li>
                    <li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >CONVENIOS</a></li>
                    <li><a href="mostrar_practica.jsp" class="  ufps-navbar-btn  " >PRACTICAS</a></li>
                    <li><a href="" class="  ufps-navbar-btn  " >CONSULTAS E INFORMES</a></li>
                </ul>     
             </div>
                

        <center><h2>EDITAR PRACTICAS</h2></center>
        
        <div class="ufps-container" id="contenido">
            
            <form action="editar_practica_p.jsp?idpractica=<%=ed.getIdpractica()%>" method="POST"> 
           <fieldset>
            <h2>Información basica</h2>
            Solo los espacios señalados con asterisco(*) son necesarios para registrar la práctica. 
            El resto de los campos puede ser agregados más adelante. 
             <br> <br> <br>
             
             
             
                <div class="ufps-col-tablet-5 ufps-col-offset-7">
                    <label for="ano_practica">Año*:</label>
                    <input name="ano_practica" type="text" class="ufps-input-line" id="linea1" required="" value="<%=ed.getAño_practica() %>" >
                </div>
              <div class="ufps-col-tablet-5 ufps-col-offset-7">
                  <label for="semestre_practica">Semestre*:</label>
                  <input name="semestre_practica" type="number" min="1" max="2" class="ufps-input-line" id="linea1" required="" placeholder="semestre" value="<%=ed.getSemestre_practica() %>">                              
              </div>  
              <br>
              <div class="ufps-col-tablet-5 ufps-col-offset-7">
                <label for="estado">Estado*</label> 
                <select id="estado" name="estado" class="ufps-input " required="" value="<%=ed.getEstado() %>" >
                    <option value="No asignada">No asignada</option>
                    <option value="Asignada">Asignada</option>
                    <option value="Cancelada">Cancelada</option>
                    <option value="Finalizada">Finalizada</option>
                </select>
                </div>
              <br>
              <div class="ufps-col-tablet-5 ufps-col-offset-7">
                <label for="id_perfil">Perfil*</label> 
                <select id="id_perfil" name="id_perfil" class="ufps-input "  required="" value="<%=ed.getId_perfil() %>">
                                        
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
                                    <select id="id_convenio" name="id_convenio" class="ufps-input-line " onchange="combo()" value="<%=ed.getId_convenio() %>" >
                                        
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
                                    <select id="id_tutor" name="id_tutor" class="ufps-input-line " value="<%=ed.getId_tutor() %>" >
                                        
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
                  <input name="id_docente" type="text" class="ufps-input-line" id="linea1" required="" value="<%=ed.getId_docente() %>">   
                </div>
                <br>
                <BR>
                <br>
                <br>
             
                <div class="ufps-col-tablet-5 ufps-col-offset-7">
                                <div class="form-group" >
                                     <BR>
                                    <label for="id_estudiante" >Seleccione estudiante ascociado a la Empresa*</label>
                                    <select id="id_estudiante" name="id_estudiante" class="ufps-input-line " value="<%=ed.getId_estudiante() %>" >
                                        
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
                <div class="form-group btn-group  ">
                    <div class="caption">
                        <button type="submit" class="ufps-btn" id="btnAgregar">Actualizar</button>
                        <p><a href="mostrar_practica.jsp" class="btn ufps-btn" role="button">Volver</a></p> 
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
    
  <jsp:include page="../plantilla/footer.jsp"/> 
    
</html>