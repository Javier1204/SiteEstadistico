<%-- 
    Document   : cargarNoRFModulo
    Created on : 3/12/2016, 11:06:02 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.DTOs.RequerimientosFDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.DTOs.PrivilegioDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%
    request.setCharacterEncoding("UTF-8");
    String modulo = request.getParameter("modulo");
    String rol = request.getParameter("rol");
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    ModuloDTO dto = gestor.cargarNotRFModulo(modulo, rol);
    List<RequerimientosFDTO> rfs = dto.getRequerimientos();
    System.out.println("Llego hasta aqui: cargarNoRFModulo");
    if (rfs == null) {
%>

<div id="modal-mod-rf" class="ufps-modal" style="display: none;">
    <div class="ufps-modal-content">
        <div class="ufps-modal-header-red">
            <span class="ufps-modal-close">×</span>
            <h2><%=modulo%></h2>
        </div>
        <div class="ufps-modal-body">
            <p>Requerimientos funcionales no asignados a <%=rol%></p>
            <p>Error al conectar con la base de datos</p>
        </div>
        <div class="ufps-modal-footer">
            <h3>Asingnación Requerimientos funcionales</h3>
        </div>
    </div>
</div>
<%
        return;
    }
    if (rfs.isEmpty()) {
%>

<div id="modal-mod-rf" class="ufps-modal" style="display: none;">
    <div class="ufps-modal-content">
        <div class="ufps-modal-header ufps-modal-header-red">
            <span class="ufps-modal-close">×</span>
            <h2><%=modulo%></h2>
        </div>
        <div class="ufps-modal-body">
            <p>Requerimientos funcionales no asignados a <%=rol%></p>
            <p>No existen requerimientos funcionales en este modulo que pueda asignar.</p>
        </div>
        <div class="ufps-modal-footer">
            <h3>Asingnación Requerimientos funcionales</h3>
        </div>
    </div>
</div>

<%
        return;
    }
%>
<div id="modal-mod-rf" class="ufps-modal" style="display: none;">
    <div class="ufps-modal-content">
        <div class="ufps-modal-header ufps-modal-header-red">
            <span class="ufps-modal-close">×</span>
            <h2><%=modulo%></h2>
        </div>
        <div class="ufps-modal-body">
            <p class="ufps-text-center">Requerimientos funcionales no asignados al rol <%=rol%></p>
            <form id="formP">
                <table id="table" class="ufps-table ufps-table-inserted ufps-text-left">
                    <thead>
                    <th>SELECCÓN</th>
                    <th>ID</th>
                    <th>NOMBRE</th>
                    </thead>
                    <%
                        int i = 0;
                        for (RequerimientosFDTO rfDTO : rfs) {
                    %>
                    <tr>
                        <td>
                            <input  style="width: 40px;" type="checkbox" title="<%=rfDTO.getId()%>" name="checkP" id="<%=rfDTO.getId()%>" value="<%=rfDTO.getId()%>"/> 
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
            </form>
                <button onclick="javascript:asignarPrivilegios('<%=modulo%>','<%=rol%>')"  class="ufps-btn ufps-btn-green acomodarBtn" >Asignar requerimientos seleccionados</button>
        </div>
        <div id="rAsignacion"></div>
        <div class="ufps-modal-footer">
            <h3>Asingnación Requerimientos funcionales</h3>
        </div>
    </div>
</div>
