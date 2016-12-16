<%-- 
    Document   : formRegistro_Asistencias
    Created on : 23/11/2016, 09:58:16 PM
    Author     : WILSON
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
     <form class="form-horizontal" method="POST" action="../controladores/registros/registrarAsistencias.jsp" name="registroAsistencias" id="registrarAsistencias">
               
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
                    <center> 
                      <button  type="button"  data-loading-text="Loading..." id="botoactiviasis" class="btn-danger btn-lg" onclick="Registroasistencia();" >registrar</button>
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
