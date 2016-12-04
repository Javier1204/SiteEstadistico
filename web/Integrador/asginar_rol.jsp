<%-- 
    Document   : asginar_rol
    Created on : 23/11/2016, 01:32:46 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.RolDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<%
    IGestionUsuarios gestion = GestionUsuario.getInstance();
    List<RolDTO> roles = gestion.listarRoles();
%>
<link href="css/integrador.css" rel="stylesheet" type="text/css"/>
<script src="js/ajax.js"></script>   
<div class="ufps-container ufps-fix-navbar-fixed">
    <center> <h1>Asignar Roles</h1></center>
    <center><label id="divError"></label></center>

    <div method="post" action="javascript:actualizarRoles()" name="registro" class="f-integrador ufps-container" id="registro">
        <div>
            <label >Nombre usuario</label><br>
            <input type="text" required name="nombre_usuario" id="nombre_usuario" placeholder="Nombre de usuario" class="ufps-input ufps-black" />
            <input type="button" name="btnBuscar" onclick="javascript:buscarRoles()" id="btnBuscar" class="ufps-btn ufps-btn-light" value="Buscar"/>
        </div>
        <div id="campo">
            <label> Rol </label>
            <table id="table" class="ufps-table ufps-table-inserted ufps-text-left">
                <thead>
                <th>SELECCÓN</th>
                <th>ROL</th>
                <th>DESCRIPCIÓN</th>
                </thead>
                <% for (int i = 0; i < roles.size(); i++) {
                %>
                <tr>
                    <td> <input style="width: 40px;" type="checkbox" name="checkRol" id="<%=roles.get(i).getRol()%>"/>  </td>
                    <td><p><%=roles.get(i).getRol()%> </p></td>
                    <td><p><%=roles.get(i).getDescripcion()%> </p></td>
                </tr> 
                <% }%>
            </table>       
        </div>
        <input type="submit" class="ufps-btn ufps-btn-green acomodarBtn" value="Asignar">
        </form>

    </div>

</div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>