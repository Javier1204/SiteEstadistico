<%-- 
    Document   : procesarAgregarModuloModal
    Created on : 11/12/2016, 09:58:59 AM
    Author     : Lenovo
--%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<div id="modal-AModulo" class="ufps-modal">
    <div class="ufps-modal-content">
        <div class="ufps-modal-header ufps-modal-header-red">
            <span class="ufps-modal-close">×</span>
            <h2>Agregar Módulo</h2>
        </div>
        <div class="ufps-modal-body">
            <div>
                <label class="text-left">NOMBRE</label><br>
                <input type="text"  name="id" id="nombre-modulo" class="ufps-input ufps-black" required />
            </div>
            <div>
                <label class="text-left">Descripcion</label><br>
                <!--<input type="text"  name="id" id="nombre" class="ufps-input ufps-black" required value=""/>-->
                <textarea style="height: 80px;" name="descripcion" id="descripcion-modulo" class="ufps-input ufps-black" required ></textarea>
            </div>
            <div>
                <label class="text-left">URL</label><br>
                <input type="" name="id" id="url-modulo" class="ufps-input ufps-black" placeholder="SiteEstadistico/nombreCarpeta/index.jsp" required>
                
            </div>
            <center><button onclick="javascript:registrarModulo2()" class="ufps-btn ufps-btn-green">Agregar Módulo</button></center>
            <div id="loading"></div>
        </div>
        <div class="ufps-modal-footer">
            <h3>Agregar nuevo modulo</h3>
        </div>
        
    </div>
</div>
