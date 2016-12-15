<%-- 
    Document   : consultarProyectos
    Created on : 1/11/2016, 02:12:45 PM
    Author     : tuto2
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="academico.DTO.GrupoDTO"%>
<%@page import="academico.Facade.Facade"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="../plantilla/header.jsp"/>
<script type="text/javascript" src="jsDoc/cambioForm.js"></script>
<body>
    <% ICuenta cuenta = null;
        if (session.getAttribute("usuario") != null) {
            cuenta = (ICuenta) session.getAttribute("usuario");
            if (cuenta.containRol("Estudiante")) {
                response.sendRedirect("inicioEst.jsp");
            } else if (!cuenta.containRol("Docente")) {
                response.sendRedirect("../index.jsp");
            }
        } else {
            response.sendRedirect("../index.jsp");
        }

    %>
    <%Facade fachada = new Facade();
    %>
    <div class="ufps-container">
        <div class="ufps_row">
            <!--Aqui ingreso toda la informacion personal del docente-->
            <form align="center" name="formConsulProyectos" 
                  id="formInicioProyectos" action="javascript:cargarProyectos()" method="post">

                <%
                    ArrayList<GrupoDTO> lista = fachada.asignaturasDoc(cuenta.getUser());

                %>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-6">
                    <div class="form-group">
                        <label for="grupos">Consultar proyecto del grupo:</label>
                        <select id="grupos" name="" class="ufps-input" >
                            <option value="">--Seleccione una opcion--</option>
                            <%for (GrupoDTO dto : lista) {

                            %>
                            <option value="<%=dto.getCod_grupo()%>"><%=dto.getCod_asign() + " - " + dto.getNombre()%></option>
                            <%}
                            %>
                        </select>
                    </div>
                </div>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-6">
                    <div class="form-group">
                        <label for="key">Keyword</label>
                        <input type="text" class="ufps-input" id="key">
                    </div>

                </div>
                <button type="submit" class="ufps-btn">Cargar</button>

            </form>
        </div>
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
