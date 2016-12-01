<%-- 
    Document   : listar_actModulos
    Created on : 28/11/2016, 10:24:48 AM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="java.util.List"%>
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
        <h1 class="text-center" style="text-align: center">Listado de modulos</h1>
        <table class="ufps-table" cellspacing="0" width="100%">
            <thead>
                <tr>

                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>URL</th>
                    <th>Acción</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
            <% for (ModuloDTO dto : modulos) {%>
            <tr>
                <td><center><%= dto.getNombre()%></center></td>
                <td><div><p><%= dto.getDescripcion()%></p></div></td>
                <td><center><p><%= dto.getUrl()%></p></center></td>
                <td><center><a  class="ufps-btn ufps-btn-light" href="modificarModulo.jsp?nombre=<%=dto.getNombre()%>&descripcion=<%=dto.getDescripcion()%>&url=<%=dto.getUrl()%>">Modificar</a></center> </td>
                <td><center><a class="ufps-btn" href="procesar/eliminarModulo.jsp?nombre=<%=dto.getNombre()%>&descripcion=<%=dto.getDescripcion()%>&url=<%=dto.getUrl()%>">Eliminar</a></center> </td>
            </tr>
        <% }%>
        </tbody>
    </table>
</div>         
<jsp:include page="../plantilla/footer.jsp"></jsp:include>
