<%-- 
    Document   : asignarRF
    Created on : 24/11/2016, 04:49:05 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.RequerimientosFDTO"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
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
<script src="js/ajax.js"></script>   
<div class="ufps-container ufps-fix-navbar-fixed">
    <center> <h1>Asignar privilegios</h1></center>
    <center><label id="divError"></label></center>
    <form method="post" action="javascript:actualizarPrivilegios()" name="registro" class="form" id="registro">
        <div>
            <label >Rol</label><br>
            <select id="selectMod" name="selectMod" class="ufps-input">
                <option value=""> Seleccione opción</option>
                <% for (RolDTO dto : roles) {%>
                <option value="<%=dto.getRol()%>"><%=dto.getRol()%></option>
                <% } %>
            </select>
            <input type="button" name="btnBuscar" onclick="javascript:buscarPrivilegios()" id="btnBuscar" class="ufps-btn" value="Buscar"/>
        </div>
        <div id="campo">
            <%
                IGestionUsuarios gestor = GestionUsuario.getInstance();
                List<ModuloDTO> modulos = gestor.listarModulo();
                int i = 0;
            %>
            <% for (ModuloDTO mod : modulos) {%>
            <h2 class="text-center" style="text-align: center">Requerimientos funcionales <%= mod.getNombre()%></h2>
            <% List<RequerimientosFDTO> reqs = gestor.listarRF(mod.getNombre());
               if(!reqs.isEmpty()){
            %>
            <table id="table" class="ufps-table ufps-text-left">
                <% for (RequerimientosFDTO d : reqs) {
                        if (i == 0) {
                %>
                <tr>
                    <% } i++;%>
                    <td> <input style="width: 40px;" type="checkbox" title="<%=d.getId()%>" name="checkRol" id="<%=d.getId()%>" value="<%=d.getId()%>"/> <%=d.getId()%> </td>
                        <% if (i == 3) { i=0;%>
                </tr> 
                <% }
                    }%>
            </table>  
            <% }else{ %>
                
            <label>El módulo <%= mod.getNombre()%> no tiene RFs </label>
           <% } }%>
        </div>
        <input type="submit" class="ufps-btn acomodarBtn" value="Asignar">
    </form>

</div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>