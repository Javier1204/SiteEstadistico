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
    <link href="css/integrador.css" rel="stylesheet" type="text/css"/>
    <script src="js/ajax.js"></script>
    <!--Contenido-->
    <div  class="ufps-container" id="contenido">
        <h1 class="text-center" style="text-align: center">Listado de roles</h1>
        <div class="ufps-row" >

            <div class="f-integrador" id="registro">
                <table class="ufps-table ufps-table-inserted" cellspacing="0" width="100%">
                    <thead>
                        <tr>

                            <th>ROL</th>
                            <th>DESCRIPCÓN</th>
                            <th>MODIFICAR</th>
                            <th>ELIMINAR</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% for (RolDTO dto : roles) {%>
                    <tr>
                        <td><%= dto.getRol()%></td>
                        <td><%= dto.getDescripcion()%></td>
                        <td><a class="ufps-btn ufps-btn-light" onclick="javascript:modalMUsuario('<%=dto.getRol()%>')" >Modificar</a> </td>
                        <td><a class="ufps-btn" href="procesar/eliminarRol.jsp?rol=<%=dto.getRol()%>&descripcion=<%=dto.getDescripcion()%>">Eliminar</a> </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <center>
                <button class="ufps-btn ufps-btn-green" onclick="javascript:modalAUsuario()">Agregar Nuevo Rol</button>
            </center>
            <div id="modalMR"></div>
        </div> 
    </div>
</div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>
