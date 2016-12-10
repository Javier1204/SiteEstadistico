<%-- 
    Document   : procesarModificarRFModal
    Created on : 9/12/2016, 10:01:07 PM
    Author     : Lenovo
--%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.DTOs.RequerimientosFDTO"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    String modulo = request.getParameter("modulo");
    String rf=request.getParameter("rf");
    IGestionUsuarios gu=GestionUsuario.getInstance();
    RequerimientosFDTO rfDTO=gu.obtenerRF(modulo, rf);
    
%>
<div id="modal-RF" class="ufps-modal">
    <div class="ufps-modal-content">
        <div class="ufps-modal-header ufps-modal-header-red">
            <span class="ufps-modal-close">×</span>
            <h2><%=modulo%></h2>
        </div>
        <div class="ufps-modal-body">
            <div>
                <h5 class="ufps-text-left">ID</h5>
                <input type="text"  name="id" id="id" class="ufps-input ufps-black" value="<%=rfDTO.getId()%>" disabled="true" required />
            </div>
            <div>
                <h5 class="ufps-text-left">NOMBRE</h5>
                <input type="text"  name="id" id="nombre" class="ufps-input ufps-black" value="<%=rfDTO.getNombre()%>"  required />
            </div>
            <div>
                <h5 class="ufps-text-left">URL</h5>
                <input type="text" name="id" id="url" class="ufps-input ufps-black" value="<%=rfDTO.getUrl()%>"  required />
            </div>
            <button onclick="javascript:modificarRF('<%=modulo%>') " class="ufps-btn ufps-btn-light">Modificar requerimiento funcional</button>
            <div id="loading"></div>
        </div>
        <div class="ufps-modal-footer">
            <h3>Modificar requerimiento funcional</h3>
        </div>
        
    </div>
</div>