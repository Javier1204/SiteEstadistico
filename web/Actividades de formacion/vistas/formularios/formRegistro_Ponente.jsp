<%-- 
    Document   : formRegistro_Ponente
    Created on : 23/11/2016, 09:59:52 PM
    Author     : WILSON

<jsp:setProperty name="ponent" property="nombre"  />
<jsp:setProperty name="ponent" property="apellido" />
<jsp:setProperty name="ponent" property="nivel" /> 
<jsp:setProperty name="ponent" property="tipo_vinculacion" /> 
<jsp:setProperty name="ponent" property="correo_personal" /> 
<jsp:setProperty name="ponent" property="titulo" /> 
<jsp:setProperty name="ponent" property="celular" /> 
<jsp:setProperty name="ponent" property="anos_experiencia" />

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actividades De Formacion- Registrar Ponente</title>
    </head>
    <body>
    
    <form class="form-horizontal" method="POST" action="../controladores/registros/registrarPonente.jsp" 
            name="registroPonente" id="registrarPonente">
                <div class="form-group">
                     <label for="inputCedula" class="col-sm-2 control-label">Cedula</label>
                   <div class="col-sm-10">
                     <input type="text" class="form-control ufps-input ufps-red" name="cedula" id="cedula" placeholder="Cedula de Encargado"required>
                </div>
                   </div>
                <div class="form-group">
                     <label for="inputNombre" class="col-sm-2 control-label">Nombre</label>
                   <div class="col-sm-10">
                     <input type="text" class="form-control ufps-input ufps-red" name="nombre" id="nombre" placeholder="Nombre de Encargado"required>
                   </div>
                </div> 
                <div class="form-group">
                     <label for="inputApellido" class="col-sm-2 control-label">Apellido</label>
                   <div class="col-sm-10">
                     <input type="text" class="form-control ufps-input ufps-red" name="apellido" id="apellido" placeholder="Apellido de Encargado"required>
                   </div>
                </div>  
                <div class="form-group">
                     <label for="inputNivel" class="col-sm-2 control-label">Nivel Educativo</label>
                   <div class="col-sm-10">
                     <input type="text" class="form-control ufps-input ufps-red" name="niveleducativo" id="niveleducativo" placeholder="Maestría, Doctorado, ....."required>
                   </div>
                </div> 
                <div class="form-group">
                     <label for="inputVinculacion" class="col-sm-2 control-label">Tipo de Vinculacion</label>
                   <div class="col-sm-10">
                     <input type="text" class="form-control ufps-input ufps-red" name="tipo_vinculacion" id="tipo_vinculacion" placeholder="Vinculacion con la Universidad"required>
                   </div>
                </div> 
                <div class="form-group">
                     <label for="inputCorreo" class="col-sm-2 control-label">Correo Electrónico</label>
                   <div class="col-sm-10">
                     <input type="email" class="form-control ufps-input ufps-red" name="correo_personal" id="correo_personal" placeholder="@mail"required>
                   </div>
                </div> 
               
                <div class="form-group">
                     <label for="inputCorreo" class="col-sm-2 control-label">Titulo</label>
                   <div class="col-sm-10">
                     <input type="text" class="form-control ufps-input ufps-red" name="titulo" id="titulo" placeholder="Titulo"required>
                   </div>
                </div> 
         <div class="form-group">
                     <label for="inputCorreo" class="col-sm-2 control-label">Celular</label>
                   <div class="col-sm-10">
                     <input type="number" class="form-control ufps-input ufps-red" name="celular" id="celular" placeholder="celular"required>
                   </div>
                </div> 
          <div class="form-group">
                     <label for="inputTipo" class="col-sm-2 control-label">Años Experiencia</label>
                   <div class="col-sm-10">
                       <select class="form-control" name="anos_experiencia" id="anos_experiencia" required>
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option>5</option>
                      <option>2</option>
                      <option>6</option>
                      <option>7</option>
                      <option>8</option>
                      </select>
                   </div>
                </div> 
                        <center>
                      <button  type="button"  data-loading-text="Loading..." id="botoapon" class="btn-danger btn-lg" onclick="RegistroPonente();" >registrar</button>
                       <input type="reset" class="btn-danger btn-lg" />  
                       </center>  
            </form>
    
     <div class="row">
                <div class="col-sm-3">                
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <div class="fg-line" id="resultdataponene">

                        </div>
                    </div>
                </div>
                <div class="col-sm-3">                
                </div>
            </div> 
    </body>
</html>
