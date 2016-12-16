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
    <link href="css/integrador.css" rel="stylesheet" type="text/css"/>
    <!--Contenido-->
    <script src="js/ajax.js"></script>
    <div  class="ufps-container" id="contenido">
        <h1 class="text-center" style="text-align: center">Listado de usuarios</h1>
        <div class="ufps-row" >

            <div class="f-integrador" id="registro">
                <div id="estado"></div>
                <div><center>            
                        <label>Filtrar por:</label><select style="max-width: 200px" id="selectMod" name="selectMod" class="ufps-input" onchange="javascript:filtrar()">
                            <option value=""> Seleccione opción</option>
                        <% for (RolDTO dto : roles) {%>
                        <option value="<%=dto.getRol()%>"><%=dto.getRol()%></option>
                        <% } %>
                    </select>
                    <button onclick="modalAUsuario()" class="ufps-btn ufps-btn-green">
                        Agregar nuevo usuario
                    </button>
                    <button onclick="javascript:sincronizarUsuarios()" class="ufps-btn ufps-btn-light ufps-tooltip">
                        Sincronizar Docentes y Estudiantes
                        <span class="ufps-tooltip-content-bottom">Los nuevos usuarios tendrán como contraseña "12345"</span>
                    </button>
                </center>
            </div>
            <div id="info">
                <table class="ufps-table ufps-table-inserted" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>CÓDIGO</th>
                            <th>NOMBRE</th>
                            <th>MODIFICAR</th>
                            <th>ELIMINAR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (UsuarioDTO dto : usuarios) {%>
                        <tr>
                            <td><%= dto.getUssername()%></td>
                            <td><%= dto.getNombre()%></td>

                            <td><button onclick="javascript:modalMUsuario('<%=dto.getUssername()%>', '<%=dto.getNombre()%>')" class="ufps-btn ufps-btn-light" >Modificar</button> </td>
                            <td><button onclick="javascript:eliminarUsuario('<%=dto.getUssername()%>')" class="ufps-btn" href="procesar/eliminarUsuario.jsp?user=<%=dto.getUssername()%>&password=<%=dto.getPassword()%>">Eliminar</button></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <div id="modalMU"></div>
        </div> 
    </div>
</div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>
