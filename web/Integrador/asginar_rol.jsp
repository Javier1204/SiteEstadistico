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
    List<RolDTO> roles= gestion.listarRoles();  
%>
<script src="js/ajax.js"></script>   
<div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Asignar Roles</h1></center>
        <center><label id="divError"></label></center>
        <div method="post" action="javascript:actualizarPrivilegios()" name="registro" class="form" id="registro">
            <div>
                <label >Nombre usuario</label><br>
                <input type="text" required name="nombre_usuario" id="nombre_usuario" placeholder="Nombre de usuario" class="ufps-input ufps-black" />
                <input type="button" name="btnBuscar" onclick="javascript:buscarRoles()" id="btnBuscar" class="ufps-btn" value="Buscar"/>
            </div>
            <div id="campo">
            <label> Rol </label>
            <table id="table" class="ufps-table ufps-text-left">
                   <% for(int i=0; i<roles.size(); i++){    
                   %>
                <tr>
                    <td> <input style="width: 40px;" type="checkbox" title="<%=roles.get(i).getDescripcion()%>" name="checkRol" id="<%=roles.get(i).getRol()%>" value="<%=roles.get(i).getRol()%>"/> <%=roles.get(i).getRol() %> </td>
                </tr> 
                <% } %>
            </table>       
            </div>
            <input type="submit" class="ufps-btn acomodarBtn" value="Asignar">
        </form>
        
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>