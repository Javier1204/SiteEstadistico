<%-- 
    Document   : listarUsuario
    Created on : 27/11/2016, 10:06:55 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.RolDTO"%>
<%@page import="gestionUsuarios.Cuenta"%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.DTOs.UsuarioDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    List<UsuarioDTO> usuarios = gestor.listarUsuarios();
    List<RolDTO> roles = gestor.listarRoles();
%>   
<jsp:include page="../plantilla/header.jsp"></jsp:include>
    <!--Contenido-->
    <script src="js/ajax.js"></script>
    <div  class="ufps-container" id="contenido">
        <h1 class="text-center" style="text-align: center">Listado de usuarios</h1>
        <div>                    
            <select id="selectMod" name="selectMod" class="ufps-input" onchange="javascript:filtrar()">
                <option value=""> Seleccione opción</option>
            <% for (RolDTO dto : roles) {%>
            <option value="<%=dto.getRol()%>"><%=dto.getRol()%></option>
            <% } %>
        </select>
    </div>
    <div id="info">
        <table class="ufps-table" cellspacing="0" width="100%">
            <thead>
                <tr>

                    <th>Nombre usuario</th>
                    <th>Constraseña</th>
                    <th>Acción</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <% for (UsuarioDTO dto : usuarios) {%>
                <tr>
                    <td><center><%= dto.getUssername()%></center></td>
            <td><center><%= dto.getPassword()%></center></td>
            <td><center><a href="modificarUsuario.jsp?user=<%=dto.getUssername()%>&password=<%=dto.getPassword()%>">Modificar</a></center> </td>
            <td><center><a href="procesar/eliminarUsuario.jsp?user=<%=dto.getUssername()%>&password=<%=dto.getPassword()%>">Eliminar</a></center> </td>
            </tr>
            <% }%>
            </tbody>
        </table>
    </div>
</div>         
<jsp:include page="../plantilla/footer.jsp"></jsp:include>
