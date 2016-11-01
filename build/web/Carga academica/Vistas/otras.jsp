
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

            <h1 align="center">App Carga Académica Docentes: Otras Actividades</h1>

            <!--tabla del formato de la ing pilar rodriguez relacionado a otros de 5*12
            5 columnas por 12 filas y luego se subdividen segun el caso.-->

            <table class="ufps-table ufps-text-jusfity">
                <tr>
                    <th colspan="2">Identificación de la actividad</th>
                    <th>Fecha 1er Informe</th>
                    <th>Fecha 2do Informe</th>
                    <th>Otro</th>
                    <th>Acciones</th>
                 </tr>
                <tr>
                    <th><br>
                         <input class="ufps-input ufps-red" type="number" maxlength="2" min="0" max="20" name="consecutivo" id="consecutivo" required disabled="true">
                    </th>
                    <th><br>
                        <input class="ufps-input ufps-red" type="text" placeholder="Ej:actividad 1" name="actividad" id="actividad" required>
                    </th>
                    <th><br>
                        <input class="ufps-input ufps-red" type="text" placeholder="Ej:informe 1" name="informeUno" id="informeUno" required>
                    </th>
                    <th><br>
                        <input class="ufps-input ufps-red" type="text" placeholder="Ej:informe 2" name="informeDos" id="informeDos" required>
                    </th>
                    <th><br>
                        <input class="ufps-input ufps-red" type="text" placeholder="Ej:otro 1" name="otro" id="otro" required>
                    </th>
                    <th><br>
                        <input type="submit" class="ufps-btn" id="registrar" name="registrar" value="guardar">
                    </th>
                </tr>
                <tr>
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
                </tr>
                <tr>
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
                </tr>
                <tr>
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
                </tr>
                <tr>
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
                </tr>
                <tr>
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
                </tr>
            </table>
            <br>
        </form><!--Aqui se termina el div del area de trabajo-->
        </div>
        </div>

        <!--Aqui empieza el footer, el pie de pagina de la aplicacion, nombre de la
        universidad, programa, materia y desarrolladores-->
    
<!--Aqui coloco el footer, OJO con include-->
<jsp:include page="../../plantilla/footer.jsp"/>                                                                                                                                                                                                                                                                                                                