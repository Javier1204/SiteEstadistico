<%-- 
    Document   : datosDocente
    Created on : 2/11/2016, 09:20:12 AM
    Author     : Administrador
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="Practicas.DTO.docenteDTO"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<jsp:include page="../plantilla/header.jsp"/> 
       

    <div class="ufps-col-mobile-12 ufps-col-tablet-2">
        <ul>
            <li><a href="index_1.jsp" class="  ufps-navbar-btn  " >INICIO</a></li>
            <li><a href="perfil.jsp" class="  ufps-navbar-btn  " >PERFILES DE PRACTICA</a>
            <li><a href="estudiantes.jsp" class="  ufps-navbar-btn  " >ESTUDIANTES</a></li>
            <li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >EMPRESAS</a></li>
            <li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >CONVENIOS</a></li>
            <li><a href="registro_practica.jsp" class="  ufps-navbar-btn  " >PRACTICAS</a></li>
            <li><a href="" class="  ufps-navbar-btn  " >CONSULTAS E INFORMES</a></li>
        </ul>
    </div>    
                 
      <%
          Facade f = new Facade();
          
          int codigo = 13;
          docenteDTO ed = new docenteDTO();
          ed = f.buscar_Docente(codigo);
          System.out.println("Estudiante consultado. " + ed.toString());
         
      %>
      
        
      <div  class="ufps-container" id="contenido">
          
          <form action="index.jsp" method ="POST">
          <center><strong><h1>DATOS BASICOS DOCENTE</h1></strong></center>    
        <br>        
          <fieldset>
              
              <br>
              <div class="form-group">
                  <label for="nombreDoc"><b>Nombres:</b></label>
                     <input type="text" class="ufps-input" id="nombreDoc" value="<%=ed.getNombreDocente()%>" >                              
                
              </div>
              <div class="form-group"> 
                  <label for="apellidosDoc"><b>Apellidos:</b></label>
                  <input type="text" class="ufps-input" id="apellidosDoc" value="<%=ed.getApellidosDocente()%>" >            
              </div
              <br>
               <div class="form-group">
                  <label for="cedulaDoc"><b>Cedula:</b></label>
                  <input type="text" class="ufps-input" id="cedulaDoc" value="<%=ed.getCedulaDocente()%>" >
               </div>  
              
              <div class="form-group col-md-6">
                    <label for="nacimientoDoc" title="FechaNacimiento"><b>Fecha Nacimiento:</b><span class="glyphicon glyphicon-question-sign"></span></label>
                    <input type="date" class="ufps-input" id="nacimientoDoc" value="<%=ed.getFechaNacimiento()%>"  >
                </div> 
              
              <div class="form-group">
                  <label for="codigo"><b>Codigo:</b></label>
                  <input type="text" class="ufps-input" id="codigo" value="<%=ed.get_Codigo() %>" >
               </div>
              
             
              
              <div class="form-group">
                  <label for="direccionDoc"><b>Direccion de la Residencia:</b></label>
                  <input type="text" class="ufps-input" id="direccionDoc" value="<%=ed.getDireccion()%>" >
               </div>
                           
                <div class="form-group">
                    <label for="celDoc"><b>Celular:</b></label>
                    <input name="celDoc" type="text" class="ufps-input" id="celDoc" value="<%=ed.getCelular()%>" >
                </div>
            
                <div class="form-group">
                    <label for="emailpers"><b>Correo Personal:</b></label>
                    <input type="text" class="ufps-input" id="emailpers" value="<%=ed.getEmail()%>" >
                </div>  
     
              <br>
              
                            
          </fieldset>
     <BR>     
      </div>
        
       <div class="ufps-container" id="contenido"> 
       
           <fieldset>
               <h2>    Información Académica</h2>
               
               <div class="form-group">
                    <label for="nivelEst"><b>Nivel de Estudio:</b></label>
                    <input type="text" class="ufps-input" id="nivelEst" value="<%=ed.getNivelEstudio()%>">
                </div>
               
               <div class="form-group">
                    <label for="tituloPre"><b>Titulo de Pregrado:</b></label>
                    <input type="text" class="ufps-input" id="tituloPre" value="<%=ed.getTituloPregrado() %>">
                </div>
               
               
               
               <div class="form-group">
                    <label for="tipoVin"><b>Tipo de Vinculación:</b></label>
                    <input type="text" class="ufps-input" id="tipoVin" value="<%=ed.getTipoVinculacion() %>" >
                </div>
               
               <div class="form-group">
                    <label for="anos_exp"><b>Años de Experiencia:</b></label>
                    <input type="text" class="ufps-input" id="anos_exp" value="<%=ed.getAñosExperiencia() %>">
                </div>
               
               <div class="form-group">
                    <label for="emailInst"><b>Correo Institucional:</b></label>
                    <input type="text" class="ufps-input" id="emailInst" value="<%=ed.getEmail2() %>" >
                </div>
               
               
               
               
                <br><br>
        
               
           </fieldset>
       </div>
      
            
            
        <BR>
        
       <center><div class="ufps-col-tablet-12 ">  
            <div class="form-group">
                <button type="submit" class="ufps-btn">Volver</button>
            </div> 
       </div></center>
        
<jsp:include page="../plantilla/footer.jsp"/> 
    