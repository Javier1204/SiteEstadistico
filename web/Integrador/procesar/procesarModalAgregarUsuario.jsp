<%-- 
    Document   : procesarModalAgregarUsuario
    Created on : 15/12/2016, 07:41:25 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<div id="modal-AU" class="ufps-modal">
    <div class="ufps-modal-content">
        <div class="ufps-modal-header ufps-modal-header-red">
            <span class="ufps-modal-close">×</span>
            <h2>Agregar Nuevo usuario</h2>
        </div>
        <div class="ufps-modal-body">
            <div>
                <label class="text-left">Codigo</label><br>
                <input type="text"  name="id" id="codigoA" class="ufps-input ufps-black" required />
            </div>
            <div>
                <label class="text-left">Contraseña</label><br>
                <input type="text"  name="id" id="passA" class="ufps-input ufps-black"  required />
            </div>
            <div>
                <label class="text-left">Confirmar Contraseña</label><br>
                <input type="password" name="id" id="confirmacion" class="ufps-input ufps-black" required />
            </div>
            <button onclick="javascript:agregarUsuario()" class="ufps-btn ufps-btn-green">Agregar</button>
            <div id="loading"></div>
        </div>
        <div class="ufps-modal-footer">
            <h3>Agregar Nuevo Usuario</h3>
        </div>
        
    </div>
</div>

