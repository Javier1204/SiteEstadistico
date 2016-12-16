<%-- 
    Document   : procesarModalAgregarRol
    Created on : 15/12/2016, 09:08:44 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="modal-ARol" class="ufps-modal">
    <div class="ufps-modal-content">
        <div class="ufps-modal-header ufps-modal-header-red">
            <span class="ufps-modal-close">×</span>
            <h2>Agregar nuevo rol</h2>
        </div>
        <div class="ufps-modal-body">
            <div>
                <label class="text-left">Rol</label><br>
                <input type="text"  name="id" id="rolR" class="ufps-input ufps-black" required />
            </div>
            <div>
                <label class="text-left">Descripcion</label><br>
                <textarea style="height: 80px;" name="descripcion" id="descripcionR" class="ufps-input ufps-black" > </textarea>
            </div>
            <button onclick="javascript:agregarRol()" class="ufps-btn ufps-btn-green">Agregar rol</button>
            <div id="loading"></div>
        </div>
        <div class="ufps-modal-footer">
            <h3>Agregar nuevo rol</h3>
        </div>

    </div>
</div>
