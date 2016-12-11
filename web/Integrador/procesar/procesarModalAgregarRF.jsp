<%-- 
    Document   : procesarModalAgregarRF
    Created on : 7/12/2016, 11:15:43 PM
    Author     : Lenovo
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    String modulo = request.getParameter("modulo");

%>
<div id="modal-RF" class="ufps-modal">
    <div class="ufps-modal-content">
        <div class="ufps-modal-header ufps-modal-header-red">
            <span class="ufps-modal-close">×</span>
            <h2><%=modulo%></h2>
        </div>
        <div class="ufps-modal-body">
            <div>
                <label class="text-left">Id</label><br>
                <input type="text"  name="id" id="id" class="ufps-input ufps-black" placeholder="Ejemplo <RF1>"required />
            </div>
            <div>
                <label class="text-left">Nombre</label><br>
                <input type="text"  name="id" id="nombre" class="ufps-input ufps-black" required />
            </div>
            <div>
                <label class="text-left">URL</label><br>
                <input type="text" name="id" id="url" class="ufps-input ufps-black" placeholder="nombreCarpeta/vista.jsp" required />
            </div>
            <button onclick="registarRoles('<%=modulo%>')" class="ufps-btn ufps-btn-green">Registrar requerimiento funcional</button>
            <div id="loading"></div>
        </div>
        <div class="ufps-modal-footer">
            <h3>Registrar requerimiento funcional</h3>
        </div>
        
    </div>
</div>

