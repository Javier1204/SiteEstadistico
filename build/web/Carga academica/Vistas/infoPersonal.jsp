                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <!DOCTYPE html>
<!--@uthor: victor urbina 1150962-->

       <!--Aqui coloco el header, OJO con include-->
       <jsp:include page="../Vistas/header_us.jsp"/>
        
        <!--Contenido-->
        <!--Aqui empieza el area de trabajo, que cambiara dependiendo de las funcionalidades
        a la cual se quiera tener acceso, segun el boton, o accion ejecutada tras un clic, y 
        en relacion al tipo de usuario, esta seccion sera dinamica, el resto de vistas estaran
        dentro de un div-->

        <!--AQUI VA TODO EL CODIGO DINAMICO QUE CAMBIA SEGUN LAS INFORMACION, FUNCION Y USUARIO-->

        <!--Este agrega el div de info personal-->
        <div class="ufps-container">
        <div class="ufps_row">
        <!--Aqui ingreso toda la informacion personal del docente-->
        <form align="center">
          
            <h1 align="center">I. Actualizar Informaci�n Personal del Docente</h1>

            <!--Aqui en esta tabla boy a ubicar los campos de la informacion requerida en dos columnas y una fiila
            con la mitad en cada parte, esto con el objetivo de distribuir el ancho y largo sobre el area de 
            trabajo.-->
                
                <!--preguntas del 1 al 8: izquierda-->
                <!--respuestas del 9 al 15: derecha-->
                <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
                    1. C�digo:
                    <input class="ufps-input ufps-red" type="number" id="codigo" readonly="true" name="codigo" min="0" max="9999999" required="required">
                    <br><br>  
                    2. C�dula:
                    <input class="ufps-input ufps-red" type="number" id="cedula" name="cedula" min="0" max="9999999999" required="required">
                    <br><br>
                    3. Nombres:
                    <input class="ufps-input ufps-red" type="text" id="nombres" name="nombres" placeholder="Ej: Maria del Pilar" required="required">
                    <br><br>
                    4. Apellidos:
                    <input class="ufps-input ufps-red" type="text" id="apellidos" name="apellidos" placeholder="Ej:Rojas" required="required">  
                    <br><br>
                    5. Estado: 
                        <select class="ufps-input ufps-red" id="estado" name="estado">
                            <option value="activo">activo</option>
                            <option value="inactivo">inactivo</option>
                        </select>
                </div>
                
                <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
                   
                    6. Nivel de Estudio:
                        <select class="ufps-input ufps-red" id="nivelEstudio" name="nivelEstudio">
                            <option value="especialista">Especialista</option>
                            <option value="magister">Magister</option>
                            <option value="doctor">Doctor</option>
                        </select>
                    <br><br>
                    7. Categor�a:
                        <select class="ufps-input ufps-red" id="categoria" name="categoria">
                            <option value="instructor">Instructor</option>
                            <option value="auxiliar">Auxiliar</option>
                            <option value="asistente">Asistente</option>
                            <option value="asociado">Asociado</option>
                            <option value="titular">Titular</option>
                        </select>
                    <br><br>
                    8. Tipo de Vinculaci�n:
                        <select class="ufps-input ufps-red" id="tipoVinculacion" name="tipoVinculacion">
                            <option value="tiempoCompleto">Tiempo Completo</option>
                            <option value="medioTiempo">Medio Tiempo</option>
                            <option value="ocasional">Ocasional</option>
                        </select> 
                    <br><br>
                    9. T�tulo Pregrado:
                    <input class="ufps-input ufps-red" type="text" id="tituloPregrado" name="tituloPregrado" placeholder="ingeniero..." required="required">
                    <br><br>  
                    10. Celular:
                    <input class="ufps-input ufps-red" type="number" id="celular" name="celular" placeholder="3331234567" min="0" max="9999999999" required="required">
                    
                </div>
                <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-4">
                    
                    11. Correo Institucional: 
                    <input class="ufps-input ufps-red" type="email" id="correoInstitucional" name="correoInstitucional" placeholder="a@b" required="required">
                    <br><br> 
                    12. Correo Personal:
                    <input class="ufps-input ufps-red" type="email" id="correoPersonal" name="correoPersonal" placeholder="a@b" required="required">
                    <br><br> 
                    13. A�os de Experiencia:
                    <input class="ufps-input ufps-red" type="number" id="anoExperiencia" name="anoExperiencia" min="0" max="99" required="required">
                    <br><br> 
                    14. Fecha Nacimiento:
                    <input class="ufps-input ufps-red" type="date" id="fechaNacimiento" name="fechaNacimiento" required="required">
                    <br><br> 
                    15.Direcci�n Residencia:
                    <input class="ufps-input ufps-red" type="text" id="direccionResidencia" name="direccionResidencia" placeholder="calle/avenida" required="required">
                </div>
                <br>    
            <p align="center"><input class="ufps-btn" type="submit" value="Actualizar"></p>
    
        </form><!--Aqui se termina el div del area de trabajo-->
        </div>
        </div>
        <!--Aqui empieza el footer, el pie de pagina de la aplicacion, nombre de la
        universidad, programa, materia y desarrolladores-->
        
        <!--Aqui coloco el footer, OJO con include-->
        <jsp:include page="../../plantilla/footer.jsp"/>  
                                                                                                                                                                                                                                                                                                                 