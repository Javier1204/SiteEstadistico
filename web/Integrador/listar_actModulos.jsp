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
    <script src="js/ajax.js"></script> 
    <link href="css/integrador.css" rel="stylesheet" type="text/css"/>
    <div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Modulos</h1></center>
        <table class="ufps-table ufps-table-inserted" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>NOMBRE</th>
                    <th>DESCRIPCIÓN</th>
                    <th>URL</th>
                    <th>MODIFICAR</th>
                    <th>ELIMINAR</th>
                </tr>
            </thead>
            <tbody>
            <% for (ModuloDTO dto : modulos) {%>
            <tr>
                <td><center><%= dto.getNombre()%></center></td>
        <td><div><p><%= dto.getDescripcion()%></p></div></td>
        <td><center><p><%= dto.getUrl()%></p></center></td>
        <td><center><button class="ufps-btn ufps-btn-light" onclick="javascript:modalMModulo('<%=dto.getNombre()%>')">Modificar</button></center> </td>
        <td><center><a class="ufps-btn" href="procesar/eliminarModulo.jsp?nombre=<%=dto.getNombre()%>&descripcion=<%=dto.getDescripcion()%>&url=<%=dto.getUrl()%>">Eliminar</a></center> </td>
        </tr>
        <% }%>
        </tbody>
    </table>
    <center><button onclick="javascript:modalAModulo()" class="ufps-btn ufps-btn-green">Agregar nuevo módulo</button></center>
    <div id="modal-modificar"></div>
    <div id="modal-agregar"></div>
</div>         
<jsp:include page="../plantilla/footer.jsp"></jsp:include>
