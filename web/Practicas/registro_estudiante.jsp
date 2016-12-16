
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.DTO.perfil_estudianteDTO"%>
<%@page import="Practicas.DTO.perfilDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Practicas.Facade.Facade" %>
<%@page import="Practicas.DTO.estudianteDTO"%>

<%

    ICuenta cuenta=null;
    String codigo=1150712+"";
    
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
<!DOCTYPE html>
<body>
    <div class="ufps-container" id="contenido">
        
        <div class="ufps-col-mobile-7 ufps-col-tablet-2">
            <li><a href="index_estudiante.jsp" >Inicio </a></li>
        </div>

      
      <%
          Facade f = new Facade();

          estudianteDTO ed = new estudianteDTO();
          ed = f.buscarEstudiante(codigo);
          System.out.println("Estudiante consultado. " + ed.toString());
         //no trae la drieccion? si ya vi que en no le agrego lo otro probemos con ese y si funciona yo completo lo ortr
      %>
     
      <div class="ufps-col-tablet-10" id="componentes">    
      
          <form method="POST" action="cargar_datos_estudiante.jsp">  
          <div>    
          <strong><h2>REGISTRO DE ESTUDIANTE DE PRACTICAS</h2></strong>                  
        <br><br>          
        
              <h3> Datos Basicos</h3>
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-0">
                  <label for="nombreEst"><b>Nombres:</b></label>
                     <input type="text" class="ufps-input" id="nombreEst" value="<%=ed.getNombresEstudiante()%>">                                  
              </div>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-0"> 
                  <label for="apellidosEst"><b>Apellidos:</b></label>
                  <input type="text" class="ufps-input" id="apellidosEst" value="<%=ed.getApellidosEstudiante()%>">            
              </div
              <br>
              <br>
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-0">
                  <BR>  
                  <label for="nombreEst"><b>Direccion:</b></label>
                     <input type="text" class="ufps-input" id="dirEst">                                  
              </div>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-0"> 
                  <BR> 
                  <label for="apellidosEst"><b>Telefono:</b></label>
                  <input type="text" class="ufps-input" id="telEst">            
              </div
               <br>
              <br>
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-0">
                  <BR> 
                  <label for="emailEst"><b>Email:</b></label>
                     <input type="text" class="ufps-input" id="emailEst">                                  
              </div>
               <div class="ufps-col-tablet-5 ufps-col-tablet-offset-0">
                  <BR>                   
                    <label for="fecha_nac">Fecha de Nacimiento</label>
                    <input type="date" class="ufps-input" id="fechaNac" name="fecha_nac"  required="" onchange="fijarfechainicio_inicio(this.value)" >                                         
              </div>
              
              
              
              <center><div class="ufps-col-tablet-12 ">  
                <div class="form-group">
                    <div class="caption">
                        <button type="submit" class="ufps-btn" id="btnGuardar">Guardar Datos</button>
                    </div>
                </div> 
            </div></center>      
          </div>
         </form>    
     <BR><br><br><br><br><br><br><br><br><br><br><br><br><br>     
        
        <%
            List <perfilDTO> lista = f.listarPerfil();
        %>

        <div>
            
             <form method="POST" action="agregar_perfil.jsp"> 
            <BR>
               <h3>Perfiles de practica</h3>
               
               En cada perfil debe asignarle un valor del 1 al 5 (siendo 1: No me interesa y 5:Me interesa mucho)
               <br><br>
                <div class="ufps-col-desktop-10 ufps-col-netbook-10 ufps-col-tablet-10 ufps-col-mobile-10">
                    <% String nombre1="prueba1"; %>
                    <input type="text" class="ufps-input" name="<%=nombre1 %>" value="prueba">
                    <div class="ufps-col-tablet-11">
                            <input type="text" class="ufps-col-desktop-2"  value="ID PERFIL" DISABLED>   
                            <input type="text" class="ufps-col-desktop-4"  value="NOMBRE" DISABLED>   
                            <input type="text" class="ufps-col-desktop-2" value="VALOR" DISABLED>
                            <br><br>
                                                        
                           
                        <%  byte n=0;
                            String perfil="";
                            String valor="";
                            perfil_estudianteDTO[] perf=  new perfil_estudianteDTO[lista.size()];
                            byte pos=0;
                            
                            for(perfilDTO p: lista){    
                                n++;
                                perfil="idperfil"+n;
                                valor="valor"+n;
                            %> 
                                <input type="text" class="ufps-col-desktop-2" name="idperfil" value="<%= p.getIdperfil()%>" DISABLED>  
                                
                                <input type="text" class="ufps-col-desktop-4" name="nombrep" value="<%= p.getNombre() %>" DISABLED>   
                                <input   type="text" class="ufps-col-desktop-2" name="valor" required="" onkeypress="cargarVector()">
                                <br><br>
                                 
                        <% } %>
                        
                        <script type="text/javascript">
                                                       
                        </script>
                                                   
                    </div> 
                </div><br><br>       
                        
                <input type="hidden" class="ufps-input" id="codigoEst" value="<%=codigo %>" name="codigoEst"> 
                <input type="hidden" class="ufps-input" id="cantidad" value="<%=n%>" name="cantidad"> 
                  
                        <center><div class="ufps-col-tablet-10 ">  
                                <BR>
                            <div class="form-group">
                                <button type="submit" class="ufps-btn" id="btnGuardarPerfiles">Guardar preferencias de practicas</button>
                            </div></div></center>
                        
              
                <br><br>
               
           </form>  
        </div>
        <BR>
        
            
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
        <div>
        <h3>Documentos adicionales:</h3> 
            Aqui deberá cargar los documentos solicitados
                <table class="" width="670px" legth="700px">      
                    <tr>          
                    <div class="form-group">
                        <form enctype="multipart/form-data" action="subir_archivo.jsp" method="POST"> 
                            <td> <label for="cedula"><b>Escaneo de la cédula (pdf):    </b></label>
                            <td><input name= "cedula_<%=codigo%>.pdf" type="file" /> </td>
                            <td><input type="submit" class="ufps-btn" name="cedula" value="Subir Archivo"></td>
                            <td> </td>
                        </form>
                    </div>
                </tr>    
               <br>
               <tr>
                <div class="form-group">
                    <form enctype="multipart/form-data" action="subir_archivo.jsp" method="POST"> 
                    <td><label for="horario"><b>Horario(pdf):    </b></label></td>
                    <td><input name="horario_<%=codigo%>.pdf" type="file" /></td>
                    <td><input type="submit" class="ufps-btn" name="horario" value="Subir Archivo"></td>
                    <td></td>
                    </form>
                </div>
                </tr>    
              <br>
              <tr>
                <div class="form-group">
                    <form enctype="multipart/form-data" action="subir_archivo.jsp" method="POST">
                    <td><label for="hv"><b>Hoja de vida(pdf):   </b></label></td>
                    <td><input name="hv_<%=codigo%>.pdf" type="file" /></td>
                    <td><input type="submit" class="ufps-btn" name="hv" value="Subir Archivo"></td>
                    <td></td>
                    </form>
                </div>
                </tr>    
              <br>
                <tr>
                <div class="form-group">
                    <form enctype="multipart/form-data" action="subir_archivo.jsp" method="POST"> 
                    <td><label for="afiliacion"><b>Afiliacion a ARS/EPS (pdf)</b></label></td>
                    <td><input name="afiliacion_<%=codigo%>.pdf" type="file"></td>
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
        <BR>
        
    </div>
    <BR><BR><BR>
    </div>
</body>
  <jsp:include page="../plantilla/footer.jsp"/> 