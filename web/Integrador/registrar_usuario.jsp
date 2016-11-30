<%-- 
    Document   : registrar_usuario
    Created on : 23/11/2016, 12:34:37 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.RolDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.ControlGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    IGestionUsuarios gestion = GestionUsuario.getInstance();
    List<ModuloDTO> modulos = gestion.listarModulo();
    List<RolDTO> roles= gestion.listarRoles();
%>    
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<script src="js/ajax.js"></script>   
<div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Registrar usuario</h1></center>
        <center><label id="divError"></label></center>
        <form method="post" action="javascript:registrarUsuario()" name="registro" class="form" id="registro">
            <div>
                <label >Nombre usuario</label><br>
                <input type="text" name="nombre_usuario" id="nombre_usuario" placeholder="Nombre de usuario" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Contraseña</label><br>
                <input type="password" name="password" id="password" placeholder="Password" class="ufps-input ufps-black" />
            </div>  
            <label> Rol </label>
            <table id="table" class="ufps-table ufps-text-left">
                   <% for(int i=0; i<roles.size(); i++){    
                   %>
                <tr>
                    <td> <input style="width: 40px;" type="checkbox" title="<%=roles.get(i).getDescripcion()%>" name="checkRol" id="<%=roles.get(i).getRol()%>" value="<%=roles.get(i).getRol()%>"/> <%=roles.get(i).getRol() %> </td>
                </tr> 
                <% } %>
            </table>            
            <input type="submit" class="ufps-btn acomodarBtn" value="Registrar" >
        </form>
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>