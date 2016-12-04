<%-- 
    Document   : asignarRF
    Created on : 24/11/2016, 04:49:05 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.RequerimientosFDTO"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.DTOs.RolDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<%
    IGestionUsuarios gestion = GestionUsuario.getInstance();
    List<RolDTO> roles = gestion.listarRoles();
%>
<link href="css/integrador.css" rel="stylesheet" type="text/css"/>
<script src="js/ajax.js"></script>   
<div class="ufps-container ">
    <h1>Asignar privilegios</h1>
    <div class=" ufps-container" >

        
        <div class="ufps-row" >

            <div class="f-integrador" id="registro"><!-- method="POST" action="javascrip:actualzarPrivilegio()"--> 
                <div>
                    <div class="ufps-tooltip">
                        <label >Rol</label><br>
                    </div>
                    <select id="selectMod" name="selectMod" class="ufps-input" onchange="javascript:buscarPrivilegios()">
                        <option value=""> Seleccione opción</option>
                        <% for (RolDTO dto : roles) {%>
                        <option value="<%=dto.getRol()%>"><%=dto.getRol()%></option>
                        <% } %>
                    </select>
                </div>
                    <!--<center><img src='img/load.gif' > </center>-->
                <div id="campo">
                      
                </div>

            </div>
            <div id="modal"></div>
        </div> 
    </div>

</div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>