<%-- 
    Document   : listarRF
    Created on : 28/11/2016, 10:54:42 AM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.RequerimientosFDTO"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    List<ModuloDTO> modulos = gestor.listarModulo();
%>   
<jsp:include page="../plantilla/header.jsp"></jsp:include>
    <!--Contenido-->
    <div  class="ufps-container" id="contenido">
    <% for (ModuloDTO mod : modulos) {%>
    <h2 class="text-center" style="text-align: center">Requerimientos funcionales <%= mod.getNombre()%></h2>
    <% List<RequerimientosFDTO> reqs = gestor.listarRF(mod.getNombre()); %>
            <table class="ufps-table" cellspacing="0" width="100%">
                <thead>
                    <tr>

                        <th>ID</th>
                        <th>Nombre</th>
                        <th>URL</th>
                        <th>Acción</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (RequerimientosFDTO dto : reqs) { %>
                    <tr>
                        <td><center><%= dto.getId()%></center></td>
                <td><center><%= dto.getNombre() %></center></td>
                <td><center><%= dto.getUrl() %></center></td>
                <td><center><a href="modificarRF.jsp?modulo=<%=mod.getNombre()%>&id=<%=dto.getId()%>&nombre=<%=dto.getNombre()%>&url=<%=dto.getUrl()%>">Modificar</a></center> </td>
                <td><center><a href="procesar/eliminarRF.jsp?modulo=<%=mod.getNombre()%>&id=<%=dto.getId()%>&nombre=<%=dto.getNombre()%>&url=<%=dto.getUrl()%>">Eliminar</a></center> </td>
                </tr>
        <% }%>
        </tbody>
    </table>
    <% }%>
</div>         
<jsp:include page="../plantilla/footer.jsp"></jsp:include>
