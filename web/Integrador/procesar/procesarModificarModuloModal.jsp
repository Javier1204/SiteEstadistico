<%-- 
    Document   : procesarModificarModuloModal
    Created on : 11/12/2016, 08:55:40 AM
    Author     : Lenovo
--%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String modulo = request.getParameter("modulo");
    IGestionUsuarios gu=GestionUsuario.getInstance();
    ModuloDTO mod=gu.obtenerModulo(modulo);
%>
<!DOCTYPE html>
<div id="modal-MModulo" class="ufps-modal">
    <div class="ufps-modal-content">
        <div class="ufps-modal-header ufps-modal-header-red">
            <span class="ufps-modal-close">×</span>
            <h2><%=mod.getNombre()%></h2>
        </div>
        <div class="ufps-modal-body">
            <div>
                <label class="text-left">NOMBRE</label><br>
                <input type="text"  name="id" id="nombre-modulo" class="ufps-input ufps-black" disabled="true" value="<%=mod.getNombre()%>" required />
            </div>
            <div>
                <label class="text-left">Descripcion</label><br>
                <!--<input type="text"  name="id" id="nombre" class="ufps-input ufps-black" required value="<%=mod.getDescripcion()%>"/>-->
                <textarea style="height: 80px;" name="descripcion" id="descripcion-modulo" class="ufps-input ufps-black" ><%=mod.getDescripcion()%> </textarea>
            </div>
            <div>
                <label class="text-left">URL</label><br>
                <input type="" name="id" id="url-modulo" class="ufps-input ufps-black" value="<%=mod.getUrl()%>" placeholder="nombreCarpeta/vista.jsp" required>
                
            </div>
            <button onclick="javascript:modificarModulo2()" class="ufps-btn ufps-btn-green">Modificar Módulo</button>
            <div id="loading"></div>
        </div>
        <div class="ufps-modal-footer">
            <h3>Modificar módulo</h3>
        </div>
        
    </div>
</div>