<%-- 
    Document   : creacionProyecto
    Created on : 1/11/2016, 01:59:22 PM
    Author     : tuto2
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="academico.DTO.GrupoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="academico.Facade.Facade"%>
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
            <form align="center" name="formInicioProyectos" 
                  id="formInicioProyectos" action="javascript:cargarEquipos()" method="post">

                <h1 align="center">Iniciar proyectos</h1>

                <% ArrayList<GrupoDTO> lista = fachada.asignaturasDoc(cuenta.getUser());
                    System.out.println(lista.size());
                %>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-3">
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
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-3">
                    <div class="form-group">
                        <label for="num_equipos">Numero de proyectos de trabajo</label>
                        <input type="number" min="1"class="ufps-input" id="num_equipos" onchange="javascript:cambio()">
                    </div>

                </div>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-3">
                    <div class="form-group">
                        <label for="fecha">Fecha maxima subir entregables</label>
                        <input type="date" class="ufps-input" id="fecha" >
                    </div>
                </div>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-3"id="mod">
                    <div class="form-group">
                        <fieldset>
                            <input type="checkbox" id="check" name="check" value="1" /> ¿Desea que el estudiante modifique la información del proyecto? <br></br>
                        </fieldset>
                    </div>
                </div>
                        
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-3" id="cant" hidden="true">
                    <div class="form-group">
                        <label for="num_equipos3">Numero de Equipos de trabajo</label>
                        <input type="number" min="1"class="ufps-input" id="num_equipos3" onchange="javascript:cambio3()">
                    </div>

                </div>
                <input hidden="true" type="number" class="ufps-input" id="num_equipos4"name="num_equipos4">
                <br></br>
                <div class="form-group">
                    <button type="submit" class="ufps-btn">Crear</button>
                </div>
            </form>
            <form align="center" name="formInicioProyectos2" 
                  id="formInicioProyectos2" action="registrarEquipos.jsp" method="post">
                <input hidden="true" type="number" class="ufps-input" id="num_equipos2"name="num_equipos2">
                <input hidden="true" type="number" class="ufps-input" id="cod_grupo"name="cod_grupo">
                <input hidden="true" type="text" class="ufps-input" id="fecha_max"name="fecha_max">
                <div id="equipos" >

                </div>
                <div id="div">

                </div>
            </form>
        </div>
    </div>
</body>
</html>