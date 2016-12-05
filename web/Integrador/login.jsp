<%-- 
    Document   : login
    Created on : 14/10/2016, 03:03:01 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
history.forward();
</script>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
    <script src="js/ajax.js" ></script>
    <div id="divLoad" class="ufps-container"></div>
    <div class="contenidologin">
        <center><h2>Iniciar sesión</h2></center>
        <form method="post" action="javascript:ingresar()" name="login" class="form" id="login">
            <center> <label>Ingresa tus datos para iniciar sesión</label></center>
            <input type="text" name="nombre_usuario" id="nombre_usuario" placeholder="Nombre de usuario" class="ufps-input ufps-black" required/>
            <input type="password" name="contraseña" id="password" placeholder="Contraseña" class="ufps-input ufps-black" required/>
            <input type="submit" class="ufps-btn ufps-btn-light" name="ingresar" id="ingresar" value="Ingresar" />
            <div id="divLoad" class="ufps-container"></div>
            <div id="modal-login" class="ufps-modal" style="display: none;">
                <div class="ufps-modal-content">
                    <div class="ufps-modal-header ufps-modal-header-red">
                        <span class="ufps-modal-close">×</span>
                        <h2>Datos incorrectos</h2>
                    </div>
                    <div class="ufps-modal-body">
                        <p>Usuario o contraseña incorrectos</p>
                    </div>
                    <div class="ufps-modal-footer">
                        <h3>Alerta</h3>
                    </div>
                </div>
            </div>
        </form>
    </div>

<jsp:include page="../plantilla/footer.jsp"></jsp:include>
