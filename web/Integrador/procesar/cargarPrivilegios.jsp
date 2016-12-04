<%-- 
    Document   : cargarPrivilegios
    Created on : 30/11/2016, 09:04:51 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.DTOs.RequerimientosFDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.DTOs.PrivilegioDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");
    System.out.println("Entra");
    String rol = request.getParameter("rol");
    String mensaje = "";
    boolean exito = false;
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    PrivilegioDTO dto = gestor.cargarPrivilegio(rol);
    List<ModuloDTO> modulos = dto.getModulos();
    List<ModuloDTO> notModulos = gestor.cargarNoModuloRol(rol);
    if (!modulos.isEmpty()) {
        exito = true;
    } else {
        mensaje = "2";
    }
    if (exito) {
%>
<%

%>
<% for (ModuloDTO mod : modulos) {
        int i = 0;%>
<div class="ufps-accordion" style="text-align: center">
    <button class="ufps-btn-accordion"><h4 class="text-center">Requerimientos funcionales <%= mod.getNombre()%></h4></button>
    <div class="ufps-accordion-panel">
        <% List<RequerimientosFDTO> reqs = mod.getRequerimientos();
            if (!reqs.isEmpty()) {
        %>

        <div id="formPE<%=mod.getNombre()%>">
            <table id="table" class="ufps-table ufps-table-inserted ufps-text-left">
                <thead>
                <th>SELECCÓN</th>
                <th>ID</th>
                <th>NOMBRE</th>
                </thead>
                <%
                    //int i = 0;
                    for (RequerimientosFDTO rfDTO : reqs) {
                %>
                <tr>
                    <td>
                        <input  style="width: 40px;" type="checkbox" title="<%=rfDTO.getId()%>" name="check<%=mod.getNombre()%>" id="<%=rfDTO.getId()%>" value="<%=rfDTO.getId()%>"/> 
                    </td>
                    <td>
                        <%=rfDTO.getId()%>        
                    </td>
                    <td>
                        <%=rfDTO.getNombre()%>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <div class="ufps-btn-group">
                <button onclick="javascript:cargarNoRF('<%=mod.getNombre()%>')" class="ufps-btn ufps-btn-green acomodarBtn" >Asignar nuevo</button>  
                <button onclick="javascript:eliminarPrivilegios('<%=mod.getNombre()%>', '<%=rol%>')" class="ufps-btn acomodarBtn" >Eliminar Seleccionados</button>  
            </div>
        </div> 

        <% } else {%>

        <label>El módulo <%= mod.getNombre()%> no tiene RFs </label>
        <% }%>



    </div>

</div>
<%

%>
<div>

</div>
<%    }%>


<% } else {%>
<p class="text-center">El rol <%=rol%> no tiene asignado ningun requerimiento funcional</p>
<% }%>
<center>
    <div class="ufps-dropdown" id="dropdown4">
        <button onclick="openDropdown('dropdown4')" class="ufps-dropdown-btn ufps-dropdown-light">Asignar Requerimiento de otro módulo</button>
        <div class="ufps-dropdown-content">
            <%
                for (ModuloDTO nMod : notModulos) {

            %>
            <a style="cursor:pointer;" onclick="javascript:cargarNoRF('<%=nMod.getNombre()%>')"><%=nMod.getNombre()%></a>
            <%
                }
            %>
        </div>
    </div> 
</center>