<%-- 
    Document   : registro_solicitud
    Created on : 30/10/2016, 05:19:56 PM
    Author     : Administrador
--%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="java.util.List"%>
<%@page import="Practicas.DTO.perfilDTO"%>
<%@page import="Practicas.DTO.estudianteDTO"%>
<%@page import="Practicas.DTO.tutor_empresaDTO"%>
<%@page import="Practicas.DTO.convenioDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.Facade.Facade"%>

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
        
<jsp:include page="../plantilla/header.jsp"/>  
       
    <div class="ufps-col-mobile-12 ufps-col-tablet-2">
        <li><a href="index_1.jsp" class="  ufps-navbar-btn  " >INICIO</a></li>
        <li><a href="perfil.jsp" class="  ufps-navbar-btn  " >PERFILES DE PRACTICA</a></li>
        <li><a href="estudiantes.jsp" class="  ufps-navbar-btn  " >ESTUDIANTES</a></li>
        <li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >EMPRESAS</a></li>
        <li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >CONVENIOS</a></li>
        <li><a href="mostrar_practica.jsp" class="  ufps-navbar-btn  " >PRACTICAS</a></li>
        <li><a href="" class="  ufps-navbar-btn  " >CONSULTAS E INFORMES</a></li>
                 
    </div>
    
     <center><h2>REGISTRAR PRACTICAS</h2></center>
        
        <div class="ufps-col-mobile-12 ufps-col-tablet-9" id="contenido">
            
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
                      <BR>
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
                      <BR>
                      <BR>
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
                      <BR>
                      <BR>
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
                                             java.util.Calendar fecha = java.util.Calendar.getInstance();
                                            int mes= fecha.get(java.util.Calendar.MONTH);    
                                            int año=fecha.get(java.util.Calendar.YEAR);
                                            int semestre= 0;
                                            System.out.println(""+mes+""+año);

                                           if((mes>=02)|| (mes<=06)){
                                               semestre=1;
                                              }else{
                                               semestre=2;
           }
                                            ArrayList<estudianteDTO> estudiantes = fachada.obtenerEstudiantes_asignados();
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
        
    <div>
        <h3>Documentos adicionales:</h3> 
            Aqui deberá cargar los documentos solicitados
                <table class="" width="670px" legth="700px">      
                    <tr>          
                    <div class="form-group">
                        <form enctype="multipart/form-data" action="subir_archivo.jsp" method="POST"> 
                            <td> <label for="cedula"><b>Carta de solicitud:    </b></label>
                            <td><input name= "solicitud.pdf" type="file" /> </td>
                            <td><input type="submit" class="ufps-btn" name="cedula" value="Subir Archivo"></td>
                            <td> </td>
                        </form>
                    </div>
                </tr>    
               <br>
               <tr>
                <div class="form-group">
                    <form enctype="multipart/form-data" action="subir_archivo.jsp" method="POST"> 
                    <td><label for="horario"><b>convenio:    </b></label></td>
                    <td><input name="convenio.pdf" type="file" /></td>
                    <td><input type="submit" class="ufps-btn" name="horario" value="Subir Archivo"></td>
                    <td></td>
                    </form>
                </div>
                </tr>    
              <br>
              <tr>
                <div class="form-group">
                    <form enctype="multipart/form-data" action="subir_archivo.jsp" method="POST">
                    <td><label for="hv"><b>Carta de aceptacion:   </b></label></td>
                    <td><input name="aceptacion.pdf" type="file" /></td>
                    <td><input type="submit" class="ufps-btn" name="hv" value="Subir Archivo"></td>
                    <td></td>
                    </form>
                </div>
                </tr>    
              <br>
                <tr>
                <div class="form-group">
                    <form enctype="multipart/form-data" action="subir_archivo.jsp" method="POST"> 
                    <td><label for="afiliacion"><b>Carta de cumplimiento: </b></label></td>
                    <td><input name="cumplimiento.pdf" type="file"></td>
                    <td><input type="submit" class="ufps-btn" name="afiliacion" value="Subir Archivo"></td>
                    <td></td>
                    </form>    
                </div>
                </tr>
                </table>  
              <br>
    
               <br><br>  
            </form>   
               <form method="POST">    
               <center><div class="ufps-col-tablet-12 ">  
                <div class="form-group">
                <button type="submit" class="ufps-btn" id="btnRegistrarEstudiante">Finalizar Registro</button>
                </div></div></center>
               </form>     
      </div>
    
    
    
            
           
    </body>
    
    <BR><br>
    
  <jsp:include page="../plantilla/footer.jsp"/> 