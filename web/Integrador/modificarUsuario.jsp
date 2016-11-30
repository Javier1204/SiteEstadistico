<%-- 
    Document   : modificarUsuario
    Created on : 27/11/2016, 04:06:21 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<%
  String user= request.getParameter("user");
  String pass= request.getParameter("password");
%>
<script src="js/ajax.js"></script>   
<div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Registrar usuario</h1></center>
        <center><label id="divError"></label></center>
        <form method="post" action="javascript:modificarUsuario()" name="registro" class="form" id="registro">
            <div>
                <label >Nombre usuario</label><br>
                <input type="text" name="nombre_usuario" id="nombre_usuario" value="<%=user%>" readonly="true" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Contraseña</label><br>
                <input type="password" name="password" id="password" value="<%= pass%>" class="ufps-input ufps-black" />
            </div>        
            <input type="submit" class="ufps-btn acomodarBtn" value="Modificar" >
        </form>
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>