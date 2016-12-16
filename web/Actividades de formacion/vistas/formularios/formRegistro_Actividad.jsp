<%-- 
    Document   : formRegistro_Actividad
    Created on : 23/11/2016, 09:45:56 PM
    Author     : WILSON


<jsp:useBean id="sisjor" scope="page" class="ufps.facade.SisJor" />
 <%=sisjor.downlistFecha() %>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="modact" scope="page" class="ActividadesFormacion.Facade.FacActividad" />

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actividades De Formacion- Registrar Actividad</title>
        
        <script>
$(function () {
$("#fechaInicio").datetimepicker({
    format: 'Y-m-d H:i'
});
     if( $('#siconv').prop('checked')  ){
         $("#convenio").prop('disabled',true);
     }
     else{
          $("#convenio").prop('disabled',false);
     }
         
});
</script>
<script>
$(function () {
$("#fechaFin").datetimepicker({
    format: 'Y-m-d H:i'
   
});
});
</script>
    </head>
    <body>
       <script languaje="javascript">

function validar()
{

  
}

</script>
</head>
<body>
<form class="form-horizontal" method="POST" name="formactividad"  name="registroActividad" id="registrarActividad">
                <div class="form-group">
                     <label for="inputNombre" class="col-sm-2 control-label">Nombre</label>
                   <div class="col-sm-10">
                       <input type="text" name="nombre" id="nombre" class="form-control ufps-input ufps-red"   placeholder="Nombre de la Actividad" required>
                </div>
                   </div>
                   <div class="form-group">
                     <label for="inputPonente" class="col-sm-2 control-label">Ponente</label>
                   <div class="col-sm-10">
                       <%=modact.ListarPonentes()%>
                   </div>
                </div>
                <div class="form-group">
                     <label for="inputConvenio" class="col-sm-2 control-label">Convenio</label>
                   <div class="col-sm-10">
                      <%=modact.ListarConvenios() %>
                       
                   </div>
                </div> 
                  <div class="form-group">
                     <label for="inputTipo" class="col-sm-2 control-label">Tipo de Actividad</label>
                   <div class="col-sm-10">
                       <select class="form-control" name="tipoActividad" id="tipoActividad" required>
                      <option>Investigación formativa</option>
                      <option>profesional específica</option>
                      <option>emprendimiento e innovación</option>
                      </select>
                   </div>
                </div> 
                  <div class="form-group">
                     <label for="inputTipo" class="col-sm-2 control-label">NO Aplica convenio</label>
                   <div class="col-sm-10">
                       <input type="checkbox" name="siconv" value="1" id="siconv">
                   </div>
                </div> 

                <div class="form-group">
                     <label for="inputFechaInicio"   class="col-sm-2 control-label">Fecha y Hora de Inicio</label>
                   <div class="col-sm-10">
                       <input type="text" name="fechaInicio" id="fechaInicio" class="form-control ufps-input ufps-red"  placeholder="Fecha de Inicio" required>
                   </div>
                </div>
                <div class="form-group">
                     <label for="inputFechaFin"   class="col-sm-2 control-label">Fecha y Hora de Fin</label>
                   <div class="col-sm-10">
                       <input type="text" name="fechaFin" id="fechaFin"  class="form-control ufps-input ufps-red"  placeholder="Fecha de Fin" required>
                   </div>
                </div> 
              

                <div class="form-group">
                     <label for="inputLugar" class="col-sm-2 control-label">Lugar</label>
                   <div class="col-sm-10">
                       <input type="text"  name="lugar" id="lugar" class="form-control ufps-input ufps-red"  placeholder="Lugar de la Actividad" required>
                   </div>
                </div> 
                
                
                <div class="form-group">
                     <label for="inputOrganizador"   class="col-sm-2 control-label">Organizador</label>
                   <div class="col-sm-10">
                       <input type="text" name="organizador" id="organizador" class="form-control ufps-input ufps-red"  placeholder="Docente Organizador" required>
                   </div>
                </div>

                
                  
                 <center>
                      <button  type="button"  data-loading-text="Loading..." id="botoactivi" class="btn-danger btn-lg" onclick="RegistroActividadm();" >registrar</button>
                
                <input type="reset" class="btn-danger btn-lg" />  
                </center> 
                
    
            </form>
                <div class="row">
                <div class="col-sm-3">                
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <div class="fg-line" id="resultdataacetivi">

                        </div>
                    </div>
                </div>
                <div class="col-sm-3">                
                </div>
            </div> 
    </body>
</html>
        <script>
$(function () {
   $('#siconv').change(function (){
       if( $('#siconv').prop('checked')  ){
         $("#convenio").prop('disabled',true);
     }
     else{
          $("#convenio").prop('disabled',false);
     }
   });
     
         
});
</script>