<%-- 
    Document   : listarRF
    Created on : 28/11/2016, 10:54:42 AM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.RequerimientosFDTO"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    List<ModuloDTO> modulos = gestor.listarModulo();
%>   
<jsp:include page="../plantilla/header.jsp"></jsp:include>
    <script src="js/ajax.js"></script> 
    <link href="css/integrador.css" rel="stylesheet" type="text/css"/>
    <div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Asignar Roles</h1></center>
        <center><label id="divError"></label></center>
        <div name="registro" class="f-integrador ufps-container" id="registro">
        <% for (ModuloDTO mod : modulos) {%>
        <div class="ufps-accordion" style="text-align: center">
            <button class="ufps-btn-accordion"><h4 class="text-center">Requerimientos funcionales <%= mod.getNombre()%></h4></button>
            <div class="ufps-accordion-panel">
                <% List<RequerimientosFDTO> reqs = mod.getRequerimientos();
                    if (!reqs.isEmpty()) {
                %>

                <div id="formPE<%=mod.getNombre()%>">
                    <table id="table" class="ufps-table ufps-table-inserted ufps-text-left">
                        <thead>
                        <th>SELECCIÓN</th>
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>ACCIÓN</th>
                        </thead>
                        <%
                            //int i = 0;
                            for (RequerimientosFDTO rfDTO : reqs) {
                        %>
                        <tr>
                            <td>
                                <input  style="width: 40px;" type="checkbox" title="<%=rfDTO.getId()%>" name="checkRFE<%=mod.getNombre()%>" id="<%=rfDTO.getId()%>" value="<%=rfDTO.getId()%>"/> 
                            </td>
                            <td>
                                <%=rfDTO.getId()%>        
                            </td>
                            <td>
                                <%=rfDTO.getNombre()%>
                            </td>
                            <td>
                                <button class="ufps-btn ufps-btn-light" onclick="javascript:modalMRF('<%=mod.getNombre()%>', '<%=rfDTO.getId()%>')">modificar</button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <div class="ufps-btn-group">
                        <button onclick="javascript:modalARF('<%=mod.getNombre()%>')" class="ufps-btn ufps-btn-green acomodarBtn" >Agregar nuevo Requerimiento</button>  
                        <button onclick="javascript:eliminarRF('<%=mod.getNombre()%>')" class="ufps-btn acomodarBtn" >Eliminar Seleccionados</button>  
                    </div>
                    <div id="loading<%=mod.getNombre()%>"></div>
                </div> 

                <% } else {%>

                <label>El módulo <%= mod.getNombre()%> no tiene RFs </label>
                <% }%>



            </div>

        </div>
        <%    }%>

    </div>
    <div id="modal-ARF"></div>
</div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>
