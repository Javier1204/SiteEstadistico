<%-- 
    Document   : modificarRol
    Created on : 27/11/2016, 04:05:15 PM
    Author     : javie
--%>

<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.DTOs.RolDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    List<RolDTO> roles = gestor.listarRoles();
%>   
<jsp:include page="../plantilla/header.jsp"></jsp:include>
        <!--Contenido-->
        <div  class="ufps-container" id="contenido">
            <h1 class="text-center" style="text-align: center">Listado de roles</h1>
            <table class="ufps-table" cellspacing="0" width="100%">
                <thead>
                    <tr>

                        <th>Rol</th>
                        <th>DESCRIPCION</th>
                        <th>Acción</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (RolDTO dto : roles) {%>
                    <tr>
                        <td><center><%= dto.getRol()%></center></td>
                        <td><center><%= dto.getDescripcion()%></center></td>
                        <td><a class="ufps-btn ufps-btn-light" href="modificarRol.jsp?rol=<%=dto.getRol() %>&descripcion=<%=dto.getDescripcion()%>">Modificar</a> </td>
                        <td><a class="ufps-btn" href="procesar/eliminarRol.jsp?rol=<%=dto.getRol() %>&descripcion=<%=dto.getDescripcion()%>">Eliminar</a> </td>
                    </tr>
                <% }%>
                </tbody>
            </table>
        </div>         
<jsp:include page="../plantilla/footer.jsp"></jsp:include>
