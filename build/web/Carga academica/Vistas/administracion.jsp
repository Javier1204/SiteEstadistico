                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <!DOCTYPE html>
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

            <h1 align="center">App Carga Académica Docentes: Administración Académica</h1>

            <!--tabla del formato de la ing pilar rodriguez relacionado a docencia de 6*10
            7 filas por 10 columnas y luego se subdividen segun el caso.-->

            <table class="ufps-table ufps-text-jusfity">
                <tr>
                    <th colspan="2">Cargo</th>
                    <th>Horas Semanal</th>
                    <th colspan="2">Otras actividades Administrativas</th>
                    <th>Horas Semanal</th>
                    <th>Horas Semestre</th>
                    <th>Acción</th>
                </tr>
                <tr>
                    <th>
                        <br>
                        <!--Aqui se trae el id de la bd segun los registros hechos-->
                        <input class="ufps-input ufps-red" type="number" maxlength="2" min="0" max="20" name="consecutivo" id="consecutivo" required disabled="true">
                    </th>
                    <th>
                        <br>
                        <select id="cargo" name="cargo" class="ufps-input ufps-red">
                            <option value="decano">Decano</option>
                            <option value="director">Director</option>
                            <option value="vicerrector">Vicerrector</option>
                            <option value="asistente">Asistente</option>
                             <option value="jefeDivision">Jefe de División</option>
                            <option value="jefeDepartamento">Jefe de Departamento</option
                            <option value="coordinadorPrograma">Coordinador de Programa</option>
                            <option value="representacionInstitucional">Representación Institucional</option>
                            <option value="representacionGremial">Representación Gremial</option>
                        </select>
                    </th>
                    <th>
                        <br>
                        <input class="ufps-input ufps-red" value="0" type="number" maxlength="2" min="0" max="50" name="horaSemanal" id="horaSemanal" required="required">
                    </th>
                    <th>
                        <br>
                        <!--Aqui se trae el id de la bd segun los registros hechos-->
                        <input class="ufps-input ufps-red" type="number" maxlength="2" min="0" max="20" name="consecutivo2" id="consecutivo2" required="required" disabled="true">
                    </th>
                    <th>
                        <br>
                        <input class="ufps-input ufps-red" type="text" placeholder="Ej:actividad 1" name="actividad" id="actividad" required="required">
                    </th>
                    <th>
                        <br>
                        <input class="ufps-input ufps-red" value="0" type="number" maxlength="2" min="0" max="50" name="horaSemanal2" id="horaSemanal2" required="required" onclick=horaSemestral()>
                    </th>
                    <th>
                        <br>
                        <input class="ufps-input ufps-red" value="0" type="number" maxlength="2" min="0" max="20" name="horaSemestre" id="horaSemestre"  required="required" disabled="true">
                    </th>
                    <th>
                        <br>
                        <input class="ufps-btn" type="submit" id="registrar" name="registrar" value="guardar" onclick="calcular()">
                    </th>
                </tr>
                <tr>
                    <th>-</th>
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
                    <th>-</th>
                </tr>
                <tr>
                    <th colspan="2">Subtotal</th>
                    <th>
                        <input class="ufps-input ufps-red" type="number" value=0 maxlength="2" min="0" max="20" name="subSemanal" id="subSemanal" required disabled="true">
                    </th>
                    <th colspan="2">Subtotal</th>
                    <th>
                        <input class="ufps-input ufps-red" type="number" value=0 maxlength="2" min="0" max="20" name="subSemanal2" id="subSemanal2" required disabled="true">
                    </th>
                    <th>
                        <input class="ufps-input ufps-red" type="number" value=0 maxlength="2" min="0" max="20" name="subSemanal2" id="subSemestral" required disabled="true">
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
        <jsp:include page="../../plantilla/footer.jsp"/>  

    <script>
        
        function calcular(){
           subSemanal();
           subSemanal2();
           subSemestral();
         }
        
        function horaSemestral(){
            document.getElementById("horaSemestre").value=(parseInt(document.getElementById("horaSemanal").value)+
                                                          parseInt(document.getElementById("horaSemanal2").value))*16;
        }
        
        function subSemanal(){
               document.getElementById("subSemanal").value=parseInt(document.getElementById("horaSemanal").value)+
                                                            parseInt(document.getElementById("subSemanal").value);
        }
        
        function subSemanal2(){
                document.getElementById("subSemanal2").value=parseInt(document.getElementById("horaSemanal2").value)+
                                                            parseInt(document.getElementById("subSemanal2").value);
        }
        
        function subSemestral(){
                document.getElementById("subSemestral").value=parseInt(document.getElementById("horaSemestre").value)+
                                                              parseInt(document.getElementById("subSemestral").value);
          
          //pues mensaje si guardó problema con la base de datos, en caso de error debera decir cual
          alert("Exito Regitró Información");  
        }
        
    </script>                                                                                                                                                                                                                                                                                                                 