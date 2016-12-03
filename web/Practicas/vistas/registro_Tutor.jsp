<%-- 
    Document   : registro_Tutor
    Created on : 6/11/2016, 10:08:33 PM
    Author     : Usuario
--%>
<%@page import="Practicas.DTO.empresaDTO"%>
<%@page import="Practicas.DTO.tutor_empresaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.Facade.Facade"%>
<%
    Facade f = new Facade();
if(request.getSession().getAttribute("respuesta_registro_Tutor")!=null){
    
%>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_registro_Tutor")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_registro_Tutor", null);
%>
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
                 <div class="ufps-navbar-left nav">
 
                 <div class="ufps-navbar-left nav"><li><a href="index.jsp" class="  ufps-navbar-btn  " >INICIO</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="perfil.jsp" class="  ufps-navbar-btn  " >PERFILES DE PRACTICA</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="estudiantes.jsp" class="  ufps-navbar-btn  " >ESTUDIANTES</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >EMPRESAS</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >CONVENIOS</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="mostrar_practica.jsp" class="  ufps-navbar-btn  " >PRACTICAS</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="" class="  ufps-navbar-btn  " >CONSULTAS E INFORMES</a></li></div>
                 </div>
                 
 
             </div>
        </div>
      
      
      <div  class="ufps-container" id="contenido">
          <form action="registrar_tutor_pro.jsp" method ="POST">
          <center><strong><h1>REGISTRO DEL TUTOR DE LA EMPRESA</h1></strong></center>
          <fieldset>
              <h2> Datos Basicos</h2>
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                     <label for="nombres">Nombre Completo:</label>
                                     <input name="nombres" type="text" class="ufps-input-line" id="linea1" required="" >                              
                
              </div>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1"> 
                              <label for="telefono">Telefono:</label>
                                    <input name="telefono" type="text" class="ufps-input-line" id="linea1" required="" >
                                     
                                
              </div
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
 
                                     <label for="cargo">Cargo:</label>
                                     <input name="cargo" type="text" class="ufps-input-line" id="linea2" required="">
                                 </div>  
               
                <BR>
              </div>
             
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
 
                                     <label for="email">Email:</label>
                                     <input name="email" type="text" class="ufps-input-line" id="linea3" required="">
                                 </div> 
                  <BR> 
      
              </div>
             
              <br>
              
               <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
<BR>
                      <div class="form-group" >
                                    <label for="entidad" >Seleccione la Entidad asociada al Convenio</label>
                                    <select id="entidad" name="entidad" class="ufps-input-line " required="">
                                        
                                        <%
                                            ArrayList<empresaDTO> entidades = f.obtenerEmpresas();
                                            for(empresaDTO e: entidades){
                                        %>
                                        <option value="<%=e.getIdempresa()%>"><%=e.getNombreEmpresa()%></option>
                                        
                                        <%}
                                        %>
                                    </select>
<BR>
<BR>
                                </div> </div>          
        
                                  
             
          
     
      <BR> 
      <BR>
       <center><div class="group ">  
            <div class="btn-group btn-group-justified">
                <button type="submit" class="ufps-btn">Registrar Tutor</button>
                 
                <div class="caption">
                        <p><a href="registro_practica.jsp" class="btn ufps-btn" role="button">Volver</a></p>
                    </div>
            </div>
                
       </div></center>
      
      </fieldset>
          </form>
      </div>
        
      
       

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
