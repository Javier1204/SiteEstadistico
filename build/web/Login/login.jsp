<%-- 
    Document   : login
    Created on : 14/10/2016, 03:03:01 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<script src="js/ajax.js"></script>
        <div class="contenido">
            <center><h2>Iniciar sesión</h2></center>
            <form method="post" action="javascript:ingresar()" name="login" class="form" id="login">
                <center> <label>Ingresa tus datos para iniciar sesión</label></center>
                <input type="text" name="nombre_usuario" id="nombre_usuario" placeholder="Nombre de usuario" class="ufps-input ufps-red" />
                <input type="password" name="contraseña" id="password" placeholder="Contraseña" class="ufps-input ufps-red" />
                <select class="ufps-input ufps_red" id="tipo" >
                    <option selected >
                        No seleccion
                    </option>
                    <option>
                        super administrador
                    </option>                  
                    <option>
                        Cliente
                    </option>
                </select>
                <input type="submit" class="ufps-btn ufps-btn-light" name="ingresar" id="ingresar" value="Ingresar" />
                <label id="divError"> </label>
            </form>
        </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>