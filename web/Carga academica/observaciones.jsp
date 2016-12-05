<%--/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/11/2016*/--%>
<%@page import="CargaAcademica.DAO.DAOCargaAcademica"%>
<!--Aqui coloco el header, OJO con include-->
<jsp:include page="diseno.jsp"/>
<jsp:include page="../plantilla/header.jsp"/>

<!--Contenido-->
<!--Aqui empieza el area de trabajo, que cambiara dependiendo de las funcionalidades
a la cual se quiera tener acceso, segun el boton, o accion ejecutada tras un clic, y 
en relacion al tipo de usuario, esta seccion sera dinamica, el resto de vistas estaran
dentro de un div-->
<div class="ufps-container-fluid">
    <div class="ufps_row">


        <!--AQUI VA TODO EL CODIGO DINAMICO QUE CAMBIA SEGUN LAS INFORMACION, FUNCION Y USUARIO-->

        <h1 align="center">Registro de Observaciones</h1>
        <!--Aqui se tiene las observaciones hechas-->

        <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-12">

            <h3>Profesor:</h3>
            <!--aqui cargo en combo los registrados en bd y selecciona-->
            <select class="ufps-input ufps-red" id="docente" name="docente" align="center">

                <%DAOCargaAcademica c = new DAOCargaAcademica();
                    String profes[] = c.consultarDocentes().split(",");

                    for (int i = 0; i < profes.length; i++) {
                        String ing[] = profes[i].split("-");
                        String cod = ing[0];
                        String nom = ing[1];

                %>
                <option value="<%=cod%>"><%=cod%>-<%=nom%></option>   

                <%}%>
            </select>
            <br>
            <%String profeq[] = c.consultarDocenciaDeDocente("6").split(",");%>
            <!--FORMULARIO--->
            <form action="procesar/observaciones_pro.jsp" >
                <div id="docenciam" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-12" align="center">     
                    <table class="ufps-table ufps-card">
                        <tr><th colspan="6" align="center"><h3>Actividades de Docencia:</h3></th></tr>
                        <tr align="center"><th>Código</th><th>Grupo</th><th>Nombre</th><th>Créditos</th><th>#Estudiantes</th><th>Nivel</th></tr>

                        <%String cod = "";
                            String gru = "";
                            String nom = "";
                            String cre = "";
                            String est = "";
                            String niv = "";
                            for (int i = 0; i < profeq.length; i++) {
                                String ing[] = profeq[i].split("-");
                                cod = ing[0];
                                gru = ing[1];
                                nom = ing[2];
                                cre = ing[3];
                                est = ing[4];
                                niv = ing[5];
                        %>
                        <tr align="center"><td><%=cod%></td><td><%=gru%></td><td><%=nom%></td><td><%=cre%></td><td><%=est%></td><td><%=niv%></td></tr>
                                <%}%>
                        <tr align="center"><td colspan="4"><input class="ufps-input" type="text" id="observacion" name="observacion" placeholder="Observación"></td>

                            <td colspan="2">
                                <input id="tipo" value="docencia" name="tipo" type="hidden">
                                <input  type="submit" id="opcion" name="opcion" value="Aprobar" class="ufps-btn-green ">
                                <input  type="submit" id="opcion" name="opcion" value="Rechazar" class="ufps-btn ">
                            </td></tr>
                    </table>
                    <br><br>
                </div> 

            </form> 

            <%String profew[] = c.consultarInvestigacionDeDocente("23").split(",");%>
            <form action="procesar/observaciones_pro.jsp">

                <div id="investigacionm" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-12" align="center">     
                    <table class="ufps-table ufps-card">
                        <tr><th colspan="6" align="center"><h3>Actividades de Investigación:</h3></th></tr>
                        <tr align="center"><th>Código</th><th>Actividad</th><th>Responsabilidad</th><th>Unidad</th><th>Institución</th><th>Horas Semana</th></tr>

                        <%String codd = "";
                            String gruu = "";
                            String nomm = "";
                            String cree = "";
                            String estt = "";
                            String nivv = "";
                            for (int i = 0; i < profew.length; i++) {
                                String ing[] = profew[i].split("-");
                                codd = ing[0];
                                gruu = ing[1];
                                nomm = ing[2];
                                cree = ing[3];
                                estt = ing[4];
                                nivv = ing[5];
                        %>
                        <tr align="center"><td><%=codd%></td><td><%=gruu%></td><td><%=nomm%></td><td><%=cree%></td><td><%=estt%></td><td><%=nivv%></td></tr>
                                <%}%>
                        <tr align="center"><td colspan="4"><input class="ufps-input" type="text" id="observacion1" name="observacion1" placeholder="Observación"></td>

                            <td colspan="2">
                                <input id="tipo"  name="tipo" value="investigacion" type="hidden">
                                <input type="submit" id="opcion" name="opcion" value="Aprobar" class="ufps-btn-green ">
                                <input type="submit" id="opcion" name="opcion" value="Rechazar" class="ufps-btn ">
                            </td></tr>
                    </table><br><br>
                </div>
            </form>  

            <%String profey[] = c.consultarExtensionDeDocente("22").split(",");%>
            <form action="procesar/observaciones_pro.jsp">
                <div id="investigacionm" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-12" align="center">     
                    <table class="ufps-table ufps-card">
                        <tr><th colspan="6" align="center"><h3>Actividades de Extensión:</h3></th></tr>
                        <tr align="center"><th>Id</th><th>Nombre</th><th>Responsabilidad</th><th>Unidad</th><th>Programa</th><th>Horas</th><th>Descripcion</th></tr>

                        <%String coddd = "";
                            String gruuu = "";
                            String nommm = "";
                            String creee = "";
                            String esttt = "";
                            String nivvv = "";
                            String desvvv = "";
                            for (int i = 0; i < profey.length; i++) {
                                String ing[] = profey[i].split("-");
                                coddd = ing[0];
                                gruuu = ing[1];
                                nommm = ing[2];
                                creee = ing[3];
                                esttt = ing[4];
                                nivvv = ing[5];
                                desvvv = ing[6];
                        %>
                        <tr align="center"><td><%=coddd%></td><td><%=gruuu%></td><td><%=nommm%></td><td><%=creee%></td><td><%=esttt%></td><td><%=nivvv%></td><td><%=desvvv%></td></tr>
                                <%}%>
                        <tr align="center"><td colspan="4"><input class="ufps-input" type="text" id="observacion2" name="observacion2" placeholder="Observación"></td>

                            <td colspan="2">
                                <input id="tipo" name="tipo" value="extension" type="hidden">
                                <input type="submit" id="opcion" name="opcion" value="Aprobar" class="ufps-btn-green ">
                                <input type="submit" id="opcion" name="opcion" value="Rechazar" class="ufps-btn ">
                            </td></tr>
                    </table><br><br>
                </div>
            </form> 

            <%String profez[] = c.consultarAdministracionDeDocente("1").split(",");%>
            <form action="procesar/observaciones_pro.jsp">
                <div id="investigacionm" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-12" align="center">     
                    <table class="ufps-table ufps-card">
                        <tr><th colspan="6" align="center"><h3>Actividades de Administración:</h3></th></tr>
                        <tr align="center"><th>id</th><th>Cargo</th><th>Horas_Semana</th><th>Otra</th><th>Hora</th></tr>

                        <%String coddz = "";
                            String gruuz = "";
                            String nommz = "";
                            String creez = "";
                            String esttz = "";
                            String nivvz = "";
                            for (int i = 0; i < profez.length; i++) {
                                String ing[] = profez[i].split("-");
                                coddz = ing[0];
                                gruuz = ing[1];
                                nommz = ing[2];
                                creez = ing[3];
                                esttz = ing[4];
                        %>
                        <tr align="center"><td><%=coddz%></td><td><%=gruuz%></td><td><%=nommz%></td><td><%=creez%></td><td><%=esttz%></td></tr>
                                <%}%>
                        <tr align="center"><td colspan="4"><input class="ufps-input" type="text" id="observacion3" name="observacion3" placeholder="Observación"></td>

                            <td colspan="2">
                                <input id="tipo" name="tipo" value="administracion" type="hidden">
                                <input type="submit" id="opcion" name="opcion" value="Aprobar" class="ufps-btn-green ">
                                <input type="submit" id="opcion" name="opcion" value="Rechazar" class="ufps-btn ">
                            </td></tr>
                    </table><br><br>
                </div>
            </form>

            <%String profezz[] = c.consultarOtrasDeDocente("1").split(",");%>
            <form action="procesar/observaciones_pro.jsp">
                <div id="investigacionm" class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-12" align="center">     
                    <table class="ufps-table ufps-card">
                        <tr><th colspan="6" align="center"><h3>Otras Actividades:</h3></th></tr>
                        <tr align="center"><th>Id</th><th>Nombre</th><th>Horas Semana</th></tr>

                        <%String codl = "";
                            String grul = "";
                            String noml = "";
                            for (int i = 0; i < profezz.length; i++) {
                                String ing[] = profezz[i].split("-");
                                codl = ing[0];
                                grul = ing[1];
                                noml = ing[2];
                        %>
                        <tr align="center"><td><%=codl%></td><td><%=grul%></td><td><%=noml%></td></tr>
                                <%}%>
                        <tr align="center"><td colspan="4"><input class="ufps-input" type="text" id="observacion3" name="observacion3" placeholder="Observación"></td>

                            <td colspan="2">
                                <input id="tipo" value="otra" name="tipo" type="hidden">
                                <input type="submit" id="opcion" name="opcion" value="Aprobar" class="ufps-btn-green ">
                                <input type="submit" id="opcion" name="opcion" value="Rechazar" class="ufps-btn ">
                            </td></tr>
                    </table><br><br>
                </div>
            </form>
        </div>
        <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-12" align="center">
            <input class="ufps-btn" type="submit" id="registrar" name="registrar" value="guardar">
            <a href="index.jsp">Atrás</a>
        </div>


        <!--Aqui se termina el div del area de trabajo-->
    </div>
</div>

<!--Aqui empieza el footer, el pie de pagina de la aplicacion, nombre de la
universidad, programa, materia y desarrolladores-->

<!--Aqui coloco el footer, OJO con include-->
<jsp:include page="../plantilla/footer.jsp"/>                                                                                                                                                                                                                                                                                                                