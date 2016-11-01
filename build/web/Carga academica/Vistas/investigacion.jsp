
<!--@uthor: victor urbina 1150962-->

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
   
        <h1 align="center">App Carga Acad�mica Docentes: Actividades de Investigaci�n</h1>
         <!--Aqui creo una tabla donde se ingresan los datos concernientes a las 
         actividades de investigacion, con 6 columas por 12 filas-->
         
        <table class="ufps-table ufps-text-jusfity">
          <tr>
              <th>C�digo-Acta Administrativa</th> 
              <th>Actividades</th>
              <th>Responsabilidad</th>
              <th>Unidad Investigativa</th>
              <th>Instituci�n</th>
              <th>Hora Semanal</th>
              <th>Acci�n</th>
          </tr> 
          
          <tr>
              <th><br>
                  <input class="ufps-input ufps-red" type="file" name="acta" id="acta" required>
              </th> 
              <th><br>
                  <input class="ufps-input ufps-red" type="text" placeholder="Ej:Actividad 1" name="actividades" id="actividades" required>
              </th>
              <th><br>
                  <select class="ufps-input ufps-red" id="responsabilidad" name="responsabilidad">
                     <option value="directorGrupo">Director de Grupo</option>
                     <option value="directorProyecto">Director de Proyecto</option>
                     <option value="directorSemillero">Director de Semillero</option>
                     <option value="jovenInvestigador">Joven Investigador</option>
                     <option value="participante">Participante</option>
                  </select>
              </th>
              <th><br>
                <input class="ufps-input ufps-red" type="text" placeholder="Ej:facultad/departamento" name="unidadInvestigativa" id="unidadInvestigativa" required>
              </th>
              <th><br>
                  <select class="ufps-input ufps-red" id="institucional" name="institucional">
                    <option value="UFPS">UFPS</option>
                    <option value="UDES">UDES</option>
                    <option value="UNISIMON">UNISIMON</option>
                    <option value="UIS">UIS</option>
                    <option value="UNILIBRE">UNILIBRE</option>
                    <option value="UNIMINUTO">UNIMINUTO</option>
                    <option value="UNAB">UNAB</option>
                    <option value="UNIPAMPLONA">UNIPAMPLONA</option
                    <option value="UNAD">UNAD</option>
                  </select>
              </th>
              <th><br>
                  <input class="ufps-input ufps-red" type="number" maxlength="2" min="0" max="50" name="horaSemanal" id="horaSemanal" required>
              </th>
              <th><br><input type="submit" class="ufps-btn" id="registrar" name="registrar" value="guardar" onclick=sumoSubtotal()></th>
          </tr> 
          
          <tr>
              <th>-</th> 
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
          </tr> 
          
          <tr>
              <th>-</th> 
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
          </tr> 
          
          <tr>
              <th>-</th> 
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
          </tr> 
          
          <tr>
              <th>-</th> 
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
          </tr> 
          
          <tr>
              <th>-</th> 
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
          </tr> 
          
          <tr>
              <th>-</th> 
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
          </tr> 
          
          <tr>
              <th>-</th> 
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
          </tr> 
          
          <tr>
              <th>-</th> 
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
          </tr> 
          
          <tr>
              <th>-</th> 
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
              <th>-</th>
          </tr> 
          
          <tr>
              <th colspan="5">Subtotal=</th> 
              <th>
                 <input class="ufps-input ufps-red" type="number" value=0 maxlength="2" min="0" max="20" name="subtotal" id="subtotal" required disabled="true">
              </th>
              <th>-</th>
          </tr> 
        </table>
         <br>
    </form><!--Aqui se termina el div del area de trabajo-->
    </div>
    </div>

        <!--Aqui empieza el footer, el pie de pagina de la aplicacion, nombre de la
        universidad, programa, materia y desarrolladores-->
        
 <!--Aqui coloco el footer, OJO con include-->
<jsp:include page="../../plantilla/footer.jsp"/>    

<script>
    function sumoSubtotal(){
        document.getElementById("subtotal").value=parseInt(document.getElementById("horaSemanal").value)+
                                                  parseInt(document.getElementById("subtotal").value);
         //pues mensaje si guard� problema con la base de datos, en caso de error debera decir cual
         alert("Exito Regitr� Informaci�n");
    }
</script>                                                                                                                                                                                                                                                                                                                