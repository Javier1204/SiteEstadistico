<%-- 
    Document   : cargarNotRolUsuario
    Created on : 4/12/2016, 06:45:38 PM
    Author     : Lenovo
--%>
<%@page import="gestionUsuarios.DTOs.UsuarioDTO"%>
<%@page import="gestionUsuarios.DTOs.RolDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.DTOs.RequerimientosFDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.DTOs.PrivilegioDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%
    request.setCharacterEncoding("UTF-8");
    String usuario = request.getParameter("usuario");
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    UsuarioDTO userDTO = gestor.obtenerUsuario(usuario);
    List<RolDTO> roles = gestor.cargarNotRolUsuario(usuario);
    if (roles == null) {
%>
<div class="ufps-container">
    <div id="modal-mod-rol" class="ufps-modal" style="display: none;">
        <div class="ufps-modal-content">
            <div class="ufps-modal-header ufps-modal-header-red">
                <span class="ufps-modal-close">×</span>
                <h2><%=userDTO.getNombre()%></h2>
            </div>
            <div class="ufps-modal-body">
                <p>Roles no asignados al usuario <%=userDTO.getNombre()%></p>
                <p>Error al conectar con la base de datos</p>
            </div>
            <div class="ufps-modal-footer">
                <h3>Asingnación de roles</h3>
            </div>
        </div>
    </div>
</div>
<%
} else if (roles.isEmpty()) {
%>
<div class="ufps-container">
    <div id="modal-mod-rol" class="ufps-modal" style="display: none;">
        <div class="ufps-modal-content">
            <div class="ufps-modal-header ufps-modal-header-red">
                <span class="ufps-modal-close">×</span>
                <h2><%=userDTO.getNombre()%> </h2>
            </div>
            <div class="ufps-modal-body">
                <p>Roles no asignados al usuario <%=userDTO.getNombre()%></p>
                <p>El usuario <%=userDTO.getNombre()%> ya tienen todos los roles asignados%></p>
            </div>
            <div class="ufps-modal-footer">
                <h3>Asingnación de roles</h3>
            </div>
        </div>
    </div>
</div>
<%
} else {
%>
<div class="ufps-container">
    <div id="modal-mod-rol" class="ufps-modal" style="display: none;">
        <div class="ufps-modal-content">
            <div class="ufps-modal-header ufps-modal-header-red">
                <span class="ufps-modal-close">×</span>
                <h2><%=userDTO.getNombre()%> </h2>
            </div>
            <div class="ufps-modal-body">
                <p>Roles no asignados al usuario <%=userDTO.getNombre()%></p>   
                <table id="table" class="ufps-table ufps-table-inserted ufps-text-left">
                    <thead>
                    <th>SELECCÓN</th>
                    <th>ROL</th>
                    <th>DESCRIPCIÓN</th>
                    </thead>
                    <%
                        for (RolDTO rol : roles) {
                    %>
                    <tr>
                        <td><center> <input style="width: 40px;" type="checkbox" name="checkRolA" id="<%=rol.getRol()%>"/></center></td>
                    <td><p><%=rol.getRol()%></p></td>
                    <td><p><%=rol.getDescripcion()%></p></td>
                    </tr> 
                    <%
                        }
                    %>

                </table>
                    <center><button class="ufps-btn ufps-btn-green" onclick="asignarRoles('<%=usuario%>')" >Asignar roles seleccionados</button></center>
                <div id="asignarRolesR"></div>
            </div>
            <div class="ufps-modal-footer">
                <h3>Asingnación de roles</h3>
            </div>
        </div>
    </div>
</div>

<%
    }
%>

