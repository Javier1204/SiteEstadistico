
<%@page import="Practicas.Facade.Facade"%>
<%@page import="Practicas.DTO.empresaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : registro_convenio
    Created on : 30/10/2016, 05:16:28 PM
    Author     : Administrador
--%>
<%
    Facade fachada = new Facade();
if(request.getSession().getAttribute("respuesta_convenio")!=null){
    
    %>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_convenio")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_convenio", null);
%>
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
          <center><form action="registrarConvenio_pro.jsp" method="POST" center>
          
                    
          <center><strong><h1>REGISTRO DE LOS CONVENIOS</h1></strong></center>
          
          
          <fieldset>
              <h2> Datos Basicos</h2>
              <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                     <label for="nombre">Nombre:</label>
                                     <input name="nombre" type="text" class="ufps-input-line" id="linea1" >                              
             
                                                    
              </div>
              
              
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1"> 
                               <label for="creacion" title="Fecha en que se creó el convenio.">Fecha creación: <span class="glyphicon glyphicon-question-sign"></span></label>
                                    <input type="date" class="ufps-input" id="fechacreacion" name="fechacreacion">                                     
                                
              </div>
              
              
              
              
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-1">
                                 <div class="form-group">
 
                                     <label for="creacion" title="Fecha en que se termina el convenio ">Fecha terminacion <span class="glyphicon glyphicon-question-sign"></span></label>
                                    <input type="date" class="ufps-input" id="creacion" name="fechaterminacion">
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
                                    <label for="estado">Estado</label>
                                    <select id="estado" name="estado" class="ufps-input-line ">
                                        <option value="Aprobado">Aprobado</option>
                                        <option value="Terminado">Terminado</option>


                                    </select>

                                </div> </div>
              
              
              
              
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
                                        
                                        <%
                                            ArrayList<empresaDTO> entidades = fachada.obtenerEmpresa();
                                            for(empresaDTO e: entidades){
                                        %>
                                        <option value="<%=e.getIdempresa()%>"><%=e.getNombreEmpresa()%></option>
                                        
                                        <%}
                                        %>
                                    </select>

                                </div> </div>          
        
              <BR>
         <center><div class="ufps-col-tablet-12 ">  
            <div class="btn-group btn-group-justified">
                <button type="submit" class="ufps-btn">Registrar Convenio</button>
                <button type="submit" class="ufps-btn">Volver</button>
            </div></div></center>
        </fieldset>        
       
          </center>
          
     <BR>   
     </form>>
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