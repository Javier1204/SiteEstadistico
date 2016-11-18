<%-- 
    Document   : creacionProyecto
    Created on : 1/11/2016, 01:59:22 PM
    Author     : tuto2
--%>

<%@page import="academico.DTO.GrupoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="academico.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../plantilla/docente/header.jsp"/>
<script type="text/javascript" src="js/cambioForm.js"></script>
<body>


    <%Facade fachada = new Facade();
    %>
    <div class="ufps-container">
        <div class="ufps_row">
            <!--Aqui ingreso toda la informacion personal del docente-->
            <form align="center" name="formInicioProyectos" 
                  id="formInicioProyectos" action="javascript:cargarEquipos()" method="post">

                <h1 align="center">Iniciar proyectos</h1>

                <% ArrayList<GrupoDTO> lista = fachada.asignaturasDoc("1150833");

                %>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-4">
                    <div class="form-group">
                        <label for="grupos">Seleccione grupo:</label>
                        <select id="grupos" name="" class="ufps-input" onchange="javascript:cambio2()">
                            <option value="">--Seleccione una opcion--</option>
                            <%for (GrupoDTO dto : lista) {

                            %>
                            <option value="<%=dto.getCod_grupo()%>"><%=dto.getCod_asign() + " - " + dto.getNombre()%></option>
                            <%}
                            %>
                        </select>
                    </div>
                </div>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-4">
                    <div class="form-group">
                        <label for="num_equipos">Numero de equipos de trabajo</label>
                        <input type="number" class="ufps-input" id="num_equipos" onchange="javascript:cambio()">
                    </div>

                </div>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-4">
                    <div class="form-group">
                        <label for="num_equipos">Fecha maxima subir entregables</label>
                        <input type="date" class="ufps-input" id="num_equipos" >
                    </div>

                </div>
                <br></br>
                <div class="form-group">
                    <button type="submit" class="ufps-btn">Crear</button>
                </div>
            </form>
            <form align="center" name="formInicioProyectos2" 
                  id="formInicioProyectos2" action="registrarEquipos.jsp" method="post">
                <input hidden="true" type="number" class="ufps-input" id="num_equipos2"name="num_equipos2">
                <input hidden="true" type="number" class="ufps-input" id="cod_grupo"name="cod_grupo">
                <div id="equipos"class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12" >

                </div>
                <div id="div">

                </div>
            </form>
        </div>
    </div>
</body>
</html>