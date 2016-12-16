<%-- 
    Document   : procesarCambiarPass
    Created on : 15/12/2016, 05:29:40 PM
    Author     : Lenovo
--%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String codigo=request.getParameter("user");
    String nombre=request.getParameter("nombre");
%>
<div id="modal-MU" class="ufps-modal">
    <div class="ufps-modal-content">
        <div class="ufps-modal-header ufps-modal-header-red">
            <span class="ufps-modal-close">×</span>
            <h2><%=nombre%></h2>
        </div>
        <div class="ufps-modal-body">
            <div>
                <label class="text-left">Código</label><br>
                <input type="text"  name="id" id="codigoM" class="ufps-input ufps-black" disabled="true" value="<%=codigo%>" required />
            </div>
            <div>
                <label class="text-left">Nombre</label><br>
                <input type="text"  name="id" id="nomrbeM" class="ufps-input ufps-black"  disabled="true" value="<%=nombre%>" required />
            </div>
            <div>
                <label class="text-left">Nueva Contraseña</label><br>
                <input type="password" name="id" id="passM" class="ufps-input ufps-black" required />
            </div>
            <div>
                <label class="text-left">Confirmar Contraseña</label><br>
                <input type="password" name="id" id="confirmacion" class="ufps-input ufps-black" required />
            </div>
            <button onclick="javascript:modificarPass()" class="ufps-btn ufps-btn-green">Modificar Contraseña</button>
            <div id="loading"></div>
        </div>
        <div class="ufps-modal-footer">
            <h3>Modificar Contraseña</h3>
        </div>
        
    </div>
</div>

