<%-- 
    Document   : asignarRF
    Created on : 24/11/2016, 04:49:05 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.RolDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<%
    IGestionUsuarios gestion = GestionUsuario.getInstance();
    List<RolDTO> roles= gestion.listarRoles();  
%>
<script src="js/ajax.js"></script>   
<div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Asignar Requerimiento Funcionales</h1></center>
        <center><label id="divError"></label></center>
        <form method="post" action="javascript:actualizarPrivilegios()" name="registro" class="form" id="registro">
            <div>
                <label >Rol</label><br>
                <select id="selectMod" name="selectMod" class="ufps-input">
                    <option value=""> Seleccione opción</option>
                    <% for(RolDTO dto: roles){%>
                    <option value="<%=dto.getRol()%>"><%=dto.getRol()%></option>
                    <% } %>
                </select>
            </div>
            <div id="campo">
                
            </div>
            <input type="submit" class="ufps-btn acomodarBtn" value="Asignar">
        </form>
        
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>