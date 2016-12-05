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
$("#fechaInicio").datetimepicker();
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
$("#fechaFin").datetimepicker();
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
                     <label for="inputNombre" class="col-sm-2 control-label">Actividad</label>
                   <div class="col-sm-10">
                       <%=modact.ListarActividades()  %>
                </div>
                   </div>
                
    

                
                  
                 <center>
                      <button  type="button"  data-loading-text="Loading..." id="botoarepoacti" class="btn-danger btn-lg" onclick="ReporteActividad();" >Buscar</button>
                
                <input type="reset" class="btn-danger btn-lg" />  
                </center> 
                
    
            </form>
                <div class="row">
               
                <div class="col-sm-12">
                    <div class="form-group">
                        <div class="fg-line" id="resultdarepoactivii">

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