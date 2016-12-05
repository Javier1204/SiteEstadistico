<%-- 
    Document   : formRegistro_Actividad
    Created on : 23/11/2016, 09:45:56 PM
    Author     : WILSON


<jsp:useBean id="sisjor" scope="page" class="ufps.facade.SisJor" />
 <%=sisjor.downlistFecha() %>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
                      <label for="inputFechaInicio"   class="col-sm-2 control-label">Fecha de Inicio</label>
                   <div class="col-sm-4">
                       <input type="text" name="fechaInicio" id="fechaInicio" class="form-control ufps-input ufps-red"  placeholder="Fecha de Inicio" required>
                   </div>
                       <label for="inputFechaFin"   class="col-sm-2 control-label">Fecha de Fin</label>
                   <div class="col-sm-4">
                       <input type="text" name="fechaFin" id="fechaFin" class="form-control ufps-input ufps-red"  placeholder="Fecha de Fin" required>
                   </div>
                   </div>
                
    

                
                  
                 <center>
                      <button  type="button"  data-loading-text="Loading..." id="botoaresemesre" class="btn-danger btn-lg" onclick="Reportesemestre();" >Buscar</button>
                
                <input type="reset" class="btn-danger btn-lg" />  
                </center> 
                
    
            </form>
                <div class="row">
               
                <div class="col-sm-12">
                    <div class="form-group">
                        <div class="fg-line" id="resultdarsemes">

                        </div>
                    </div>
                </div>
                
            </div> 
    </body>
</html>
        <script>
$(function () {
  
     
         
});
</script>