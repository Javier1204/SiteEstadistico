<%-- 
    Document   : asignarRF
    Created on : 24/11/2016, 04:49:05 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<script src="js/ajax.js"></script>   
<div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Asignar Requerimiento Funcionales</h1></center>
        <center><label id="divError"></label></center>
        <form method="post" action="javascript:actualizarPrivilegios()" name="registro" class="form" id="registro">
            <div>
                <label >Nombre usuario</label><br>
                <input type="text" name="nombre_usuario" id="nombre_usuario" placeholder="Nombre de usuario" class="ufps-input ufps-black" />
                <input type="button" name="btnBuscar" onclick="javascript:buscarPrivilegios()" id="btnBuscar" class="ufps-btn" value="Buscar"/>
            </div>
            <div id="campo">
                
            </div>
            <input type="submit" class="ufps-btn acomodarBtn" value="Asignar">
        </form>
        
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>