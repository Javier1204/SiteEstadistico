<%-- 
    Document   : login
    Created on : 14/10/2016, 03:03:01 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<script src="js/ajax.js" ></script>
        <div class="contenidologin">
            <center><h2>Iniciar sesión</h2></center>
            <form method="post" action="javascript:ingresar()" name="login" class="form" id="login">
                <center> <label>Ingresa tus datos para iniciar sesión</label></center>
                <input type="text" name="nombre_usuario" id="nombre_usuario" placeholder="Nombre de usuario" class="ufps-input ufps-black" />
                <input type="password" name="contraseña" id="password" placeholder="Contraseña" class="ufps-input ufps-black" />
                <input type="submit" class="ufps-btn ufps-btn-light" name="ingresar" id="ingresar" value="Ingresar" />
                <center><label id="divError"> </label></center>
            </form>
        </div>

<jsp:include page="../plantilla/footer.jsp"></jsp:include>
    