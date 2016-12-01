<%-- 
    Document   : modificarRol
    Created on : 27/11/2016, 04:05:15 PM
    Author     : javie
--%>

<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.DTOs.RolDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  String nombre= request.getParameter("rol");
  String descripcion= request.getParameter("descripcion");
%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<script src="js/ajax.js"></script>   
<script src="js/ajax.js"></script>   
    <div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Actualizar rol</h1></center>
        <center><label id="divError"></label></center>
        <form method="post" action="javascript:modificarRol()" name="registro" class="form" id="registro">
            <div>
                <label >Rol</label><br>
                <input type="text" name="rol" readonly="true" id="rol" value="<%=nombre%>" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Descripcion</label><br>
                <textarea style="height: 80px;" name="descripcion" id="descripcion" class="ufps-input ufps-black" ><%=descripcion%> </textarea>
            </div>  
             
            <input type="submit" class="ufps-btn acomodarBtn" value="Modificar">
        </form>
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>