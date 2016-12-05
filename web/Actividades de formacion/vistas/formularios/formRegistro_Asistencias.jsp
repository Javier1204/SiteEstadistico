<%-- 
    Document   : formRegistro_Asistencias
    Created on : 23/11/2016, 09:58:16 PM
    Author     : WILSON


     <form class="form-horizontal" role="form" enctype="multipart/form-data"   method="post"   name="registroAsistencias" id="registroAsistencias">
  $('#registroAsistencias').submit(function (e) {
        var data = new FormData(this); //Creamos los datos a enviar con el formulario
        $.ajax({
            url: '../../Actividades de formacion/vistas/RegistraAsistensia.jsp', //URL destino
            data: data,
            processData: false, //Evitamos que JQuery procese los datos, daría error
            contentType: false, //No especificamos ningún tipo de dato
            type: 'POST',
            success: function (data) {
                $('#resultdataassiten').html(data);
            }
        });
        
        e.preventDefault(); //Evitamos que se mande del formulario de forma convencional
    });

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="modact" scope="page" class="ActividadesFormacion.Facade.FacActividad" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actividades De Formacion- Registrar Asistencias</title>
    </head>
    <body>
        <form method="post" action="UploadFileController" enctype="multipart/form-data">
                <div class="form-group">
                     <label for="inputActividades" class="col-sm-2 control-label">Actividad</label>
                   <div class="col-sm-10">
                    <%=modact.ListarActividades2() %>
                   </div>
                </div>  
                <div class="form-group">
                     <label for="inputAsistentes" class="col-sm-2 control-label">Estudiantes</label>
                   <div class="col-sm-10">
                       
                        <%=modact.ListarEstudiantes2()  %>
                       
                </div>
                        
                        
                   </div> 
                <div class="form-group">
                     <label for="inputAsistentes" class="col-sm-2 control-label">Imagen</label>
                   <div class="col-sm-10">
                       
                        <input type="file" name="file_uploaded" id="file_uploaded" accept="image/jpeg,image/png" >
                       
                </div>
                        
                        
                   </div> 
                        
                        
                        
                    <center> 
                       <%-- <button  type="button"  data-loading-text="Loading..." id="botoactiviasis" class="btn-danger btn-lg" onclick="Registroasistencia();" >registrar</button>
                        
                                             <button class="btn-danger btn-lg" type="submit">Actualizar Caracteristicas</button>

                       
               --%>
                     <input type="submit" value="Upload">
                          <input type="reset" class="btn-danger btn-lg" />  
                </center>          
            </form>
                        <div class="row">
                <div class="col-sm-3">                
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <div class="fg-line" id="resultdataassiten">

                        </div>
                    </div>
                </div>
                <div class="col-sm-3">                
                </div>
            </div> 
    </body>
</html>
<script>
    
   
   

     
    
</script>