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
<link href="css/integrador.css" rel="stylesheet" type="text/css"/>
<script src="js/ajax.js"></script>   
<div class="ufps-container ">
    <h1>Asignar privilegios</h1>
    <div class=" ufps-container" >
             
        <label id="divError" class="ufps-col-pc-8"></label>
        <div class="ufps-row" >

            <form method="post" action="javascript:actualizarPrivilegios()" name="registro"  class="f-integrador" id="registro">
                <div>
                    <label >Rol</label><br>
                    <select id="selectMod" name="selectMod" class="ufps-input" onchange="javascript:buscarPrivilegios()">
                        <option value=""> Seleccione opción</option>
                        <% for (RolDTO dto : roles) {%>
                        <option value="<%=dto.getRol()%>"><%=dto.getRol()%></option>
                        <% } %>
                    </select>
                </div>
                <div id="campo">
                    <%
                        IGestionUsuarios gestor = GestionUsuario.getInstance();
                        List<ModuloDTO> modulos = gestor.listarModulo();
                        
                    %>
                    <% for (ModuloDTO mod : modulos) {int i = 0;%>
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
                                    <td> <input style="width: 40px;" type="checkbox" title="<%=d.getId()%>" name="checkRol" id="<%=d.getId()%>" value="<%=d.getId()%>"/> <%=d.getId()%> </td>
                                        <% if (i == 3) {
                                                i = 0;%>
                                </tr> 
                                <% }
                                    }%>
                            </table> 

                            <% } else {%>

                            <label>El módulo <%= mod.getNombre()%> no tiene RFs </label>
                            <% }%>
                        </div>
                    </div>
                    <%
                        }%>
                        
                </div>
                <input type="submit" class="ufps-btn acomodarBtn" value="Asignar">
            </form>
        </div> 
    </div>

</div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>