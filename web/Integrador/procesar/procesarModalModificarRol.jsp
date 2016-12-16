<%-- 
    Document   : procesarModalModificarRol
    Created on : 15/12/2016, 08:34:37 PM
    Author     : Lenovo
--%>
<%@page import="gestionUsuarios.DTOs.RolDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String rol=request.getParameter("rol");
    IGestionUsuarios gu=GestionUsuario.getInstance();
    RolDTO rolDTO=gu.obtenerRol(rol);
    
%>
<div id="modal-MR" class="ufps-modal">
    <div class="ufps-modal-content">
        <div class="ufps-modal-header ufps-modal-header-red">
            <span class="ufps-modal-close">×</span>
            <h2><%=rolDTO.getRol()%></h2>
        </div>
        <div class="ufps-modal-body">
            <div>
                <label class="text-left">Rol</label><br>
                <input type="text"  name="id" id="rolR" class="ufps-input ufps-black" disabled="true" value="<%=rolDTO.getRol()%>" required />
            </div>
            <div>
                <label class="text-left">Descripción</label><br>
                <textarea style="height: 80px;" name="descripcionR" id="descripcionR" class="ufps-input ufps-black" ><%=rolDTO.getDescripcion()%> </textarea>                
            </div>
            <button onclick="javascript:modificarRol2()" class="ufps-btn ufps-btn-green">Agregar</button>
            <div id="loading"></div>
        </div>
        <div class="ufps-modal-footer">
            <h3>Agregar Nuevo Usuario</h3>
        </div>
        
    </div>
</div>