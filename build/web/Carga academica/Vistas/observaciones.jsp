
       <!--Aqui coloco el header, OJO con include-->
       <jsp:include page="../Vistas/header_us.jsp"/>
       
    <!--Contenido-->
    <!--Aqui empieza el area de trabajo, que cambiara dependiendo de las funcionalidades
    a la cual se quiera tener acceso, segun el boton, o accion ejecutada tras un clic, y 
    en relacion al tipo de usuario, esta seccion sera dinamica, el resto de vistas estaran
    dentro de un div-->
    <div class="ufps-container-fluid">
    <div class="ufps_row">
    <form  align="center">

    <!--AQUI VA TODO EL CODIGO DINAMICO QUE CAMBIA SEGUN LAS INFORMACION, FUNCION Y USUARIO-->
   
    <h1 align="center">App Carga Académica Docentes: Observaciones</h1>
    <!--Aqui se tiene las observaciones hechas-->
    
    <table class="ufps-table ufps-text-jusfity">
        
        <tr>
            <th>Profesor:</th>
            <th colspan="3">//aqui cargo los docentes previamente registrados en combo para seleccionar</th>
        </tr>
       
        <tr><th colspan="4">Actividades de Docencia: </th></tr>
        <tr>
            
            <th>
                <br>
                <a href="../Vistas/docencia.jsp" id="visualizar" name="visualizar"><u>Visualizar</u></a>
            </th>
            
            <th align="center">
                <br>
                <input type="radio" id="opcion" name="opcion" value="aprobar">Aprobar<br>
                <input type="radio" id="opcion" name="opcion" value="observar">Realizar observaciones
            </th>
            
            <th align="center">
                <br>
                <textarea rows="2" required id="observacion" name="observacion" style="width: 700px"></textarea>
            </th>
            
            <th>
                <br>
                <input class="ufps-btn" type="submit" id="registrar" name="registrar" value="guardar">
            </th>
            
        </tr>
        
        <tr>
            <th colspan="4">Actividades de Investigación:</th>
        </tr>
        
        <tr>
            
            <th>
                <br>
                <a href="../Vistas/investigacion.jsp" id="visualizar2" name="visualizar2"><u>Visualizar</u></a>
            </th>
            
             <th align="center">
                <br>
                <input type="radio" id="opcion2" name="opcion2" value="aprobar">Aprobar<br>
                <input type="radio" id="opcion2" name="opcion2" value="observar">Realizar observaciones
            </th>
            
            <th align="center">
                <br>
                <textarea rows="2" required id="observacion2" name="observacion2" style="width: 700px"></textarea>
            </th>
            
            <th>
                <br>
                <input class="ufps-btn" type="submit" id="registrar2" name="registrar2" value="guardar">
            </th>
            
        </tr>
        
        <tr><th colspan="4">Actividades de Extensión</th></tr>
        
        <tr>
            
            <th>
                <br>
                <a href="../Vistas/extension.jsp" id="visualizar3" name="visualizar3"><u>Visualizar</u></a>
            </th> 
            
            <th align="center">
                <br>
                <input type="radio" id="opcion3" name="opcion3" value="aprobar">Aprobar<br>
                <input type="radio" id="opcion3" name="opcion3" value="observar">Realizar observaciones
            </th>
            
            <th align="center">
                <br>
                <textarea rows="2" required id="observacion3" name="observacion3" style="width: 700px"></textarea>
            </th>
            
            <th>
                <br>
                <input class="ufps-btn" type="submit" id="registrar3" name="registrar3" value="guardar">
            </th>
        </tr>
        
        <tr>
            <th colspan="4">Actividades de Administración</th>
        </tr>
        <tr>
            
            <th>
                <br>
                <a href="../Vistas/administracion.jsp" id="visualizar4" name="visualizar4"><u>Visualizar</u></a>
            </th>
            
            <th align="center">
                <br>
                <input type="radio" id="opcion" name="opcion4" value="aprobar">Aprobar<br>
                <input type="radio" id="opcion" name="opcion4" value="observar">Realizar observaciones
            </th>
            
            <th align="center">
                <br>
                <textarea rows="2" required id="observacion4" name="observacion4" style="width: 700px"></textarea>
            </th>
            
            <th>
                <br>
                <input class="ufps-btn" type="submit" id="registrar4" name="registrar4" value="guardar">
            </th>
        </tr>
        
        <tr>
            <th colspan="4">Actividades Otras</th>
        </tr>
        
        <tr>
            <th>
                <br>
                <a href="../Vistas/otras.jsp" id="visualizar5" name="visualizar5"><u>Visualizar</u></a>
            </th>
            
            <th align="center">
                <br>
                <input type="radio" id="opcion5" name="opcion5" value="aprobar">Aprobar<br>
                <input type="radio" id="opcion5" name="opcion5" value="observar">Realizar observaciones
            </th>
            
            <th align="center">
                <br>
                <textarea rows="2" required id="observacion5" name="observacion5" style="width: 700px"></textarea>
            </th>
            
            <th>
                <br>
                <input class="ufps-btn" type="submit" id="registrar5" name="registrar5" value="guardar">
            </th>
            
        </tr>
        
    </table>
    </form><!--Aqui se termina el div del area de trabajo-->
    </div>
    </div>

        <!--Aqui empieza el footer, el pie de pagina de la aplicacion, nombre de la
        universidad, programa, materia y desarrolladores-->
  
<!--Aqui coloco el footer, OJO con include-->
<jsp:include page="../../plantilla/footer.jsp"/>                                                                                                                                                                                                                                                                                                                