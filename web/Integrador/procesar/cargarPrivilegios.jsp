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

        <table id="table" class="ufps-table ufps-text-left">
            <% for (RequerimientosFDTO d : reqs) {
                    if (i == 0) {
            %>
            <tr>
                <% }
                    i++;%>
                <td> 
                    <input  style="width: 40px;" type="checkbox" title="<%=d.getId()%>" name="checkRol" id="<%=d.getId()%>"/><%=d.getId()%>
                </td>
                <% if (i == 3) {
                        i = 0;%>
            </tr> 
            <% }
                }%>
        </table> 

        <% } else {%>

        <label>El módulo <%= mod.getNombre()%> no tiene RFs </label>
        <% }%>
        <button onclick="javascript:cargarNoRF('<%=mod.getNombre()%>')" class="ufps-btn-green" >Agregar</button>

    </div>

</div>

<%
    }%>


<% } else {%>
<%= mensaje%>
<% }%>