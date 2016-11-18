<%-- 
    Document   : consultarProyectos
    Created on : 1/11/2016, 02:12:45 PM
    Author     : tuto2
--%>

<%@page import="academico.DTO.GrupoDTO"%>
<%@page import="academico.Facade.Facade"%>
<%@page import="java.util.ArrayList"%>
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
            <form align="center" name="formConsulProyectos" 
                  id="formInicioProyectos" action="javascript:cargarProyectos()" method="post">

               <% ArrayList<GrupoDTO> lista = fachada.asignaturasDoc("1150833");
                    
                %>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12">
                    <div class="form-group">
                        <label for="grupos">Consultar proyecto del grupo:</label>
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
                    <button type="submit" class="ufps-btn">Cargar</button>
                </div>
            </form>
                        <form align="center" name="formConsulProyectos2" 
                  id="formInicioProyectos2" action="registrarEquipos.jsp" method="post">
                <input hidden="true" type="number" class="ufps-input" id="num_equipos2"name="num_equipos2">
                <div id="cargaPro"class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12" >

                </div>
                <div id="div">

                </div>
            </form>
        </div>
    </div>
</body>
</html>
