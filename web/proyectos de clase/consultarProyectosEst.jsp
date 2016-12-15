<%-- 
    Document   : consultarProyectos
    Created on : 30/11/2016, 09:18:53 AM
    Author     : tuto2
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="academico.DTO.ProyectoDTO"%>

<%@page import="academico.Facade.Facade"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../plantilla/header.jsp"/>
<script type="text/javascript" src="jsEst/cambioForm.js"></script>
<body>
    <% ICuenta cuenta = null;
        if (session.getAttribute("usuario") != null) {
            cuenta = (ICuenta) session.getAttribute("usuario");
            if (cuenta.containRol("Docente")) {
                response.sendRedirect("inicioDoc.jsp");
            } else if (!cuenta.containRol("Estudiante")) {
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


            <% ArrayList<ProyectoDTO> lista = fachada.listarProyectos(cuenta.getUser());

            %>
            <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12">
                <table class="ufps-table">
                    <thead>
                        <tr>
                            <th data-field="codigo">Codigo</th>
                            <th  data-field="nombre">Nombre</th>
                            <th  data-field="nom_proyecto">Nombre proyecto </th>
                            <th  data-field="nom_equipo">Nombre equipo </th>
                            <th  data-field="modificar">Modificar</th>
                            <th  data-field="subir_entregable">Subir entregable</th>

                        </tr>
                    </thead>
                    <% for (ProyectoDTO dto : lista) {
                            if (lista.isEmpty()) {
                    %>
                    <tr>
                        <td  data-field="codigo" colspan="6"><center>No se han registrado proyectos</center></td>
                    </tr>
                    <% } else {%>
                    <tr>
                        <td  data-field="codigo"><%=dto.getProyecto_id()%></td>
                        <td data-field="nombre"><%=dto.getProyecto_name()%></td>
                        <td  data-field="nom_proyecto"><%=dto.getProyecto_id()%></td>
                        <td  data-field="nom_equipo"><%=dto.getEquipo_encargado()%></td>
                        <td  data-field="modificar">
                            <%if (dto.isModificable()) {
                            %><button  onclick="location='informacionProyecto.jsp?id=<%=dto.getProyecto_id()%>&nombre=<%=dto.getProyecto_name()%>&keywords=<%=dto.getKeywords()%>&descripcion=<%=dto.getDesc()%>'" class="ufps-btn">Modificar</button>
                            <%
                                } else {%>
                            <button disabled="disabled" type="submit" class="ufps-btn">Modificar</button>
                            <%
                                    }%>
                        </td>
                        <td  data-field="subir_entregable">
                            <button   onclick="location='subirEntregables.jsp?proyecto=<%=dto.getProyecto_id()%>'"class="ufps-btn">Subir entregable</button>
                        </td>
                    </tr>
                    <%}
                        }
                    %>
                </table>
            </div>


        </div>


    </div>
</div>
</body>
</html>
