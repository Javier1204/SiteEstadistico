<%-- 
    Document   : registrarRF
    Created on : 24/11/2016, 04:49:22 PM
    Author     : javie
--%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<%
  IGestionUsuarios gestor = GestionUsuario.getInstance();  
  List<ModuloDTO> modulos= gestor.listarModulo();
%>
<script src="js/ajax.js"></script> 
    <div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Registrar requerimiento funcional</h1></center>
        <center><label id="divError"></label></center>
        <form method="post" action="javascript:registrarRF()" name="registro" class="form" id="registro">
            <div>
                <label >Modulo</label><br>
                <select id="selectMod" name="selectMod" class="ufps-input">
                    <option value=""> Seleccione opción</option>
                    <% for(ModuloDTO dto: modulos){%>
                    <option value="<%=dto.getNombre()%>"><%=dto.getNombre()%></option>
                    <% } %>
                </select>
            </div>
            <div>
                <label >Id</label><br>
                <input type="text" onchange="#" name="id" id="id" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Nombre</label><br>
                <input type="text" name="nombre" id="nombre" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Url</label><br>
                <input type="text" name="url" id="url" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Descripcion</label><br>
                <textarea style="height: 80px;" name="descripcion" id="descripcion" placeholder="Descripción" class="ufps-input ufps-black" > </textarea>
            </div>  
            
            <input type="submit" class="ufps-btn acomodarBtn" value="Registrar">
        </form>
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>