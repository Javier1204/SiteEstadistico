<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : login
    Created on : Nov 4, 2016, 3:28:39 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
        <meta charset="utf-8">
        <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Metaetiqueta para la correcta visualización en dispositivos moviles-->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0">
        <title>Iniciar Sesión</title>
        <!--Añada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
        <link href="css/ufps.min.css" rel="stylesheet">
        <!--Librerías para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script src="js/ufps.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>        
        <script src="js/login.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="ufps-container">
            <jsp:include page="assets/menu.jsp" /> 
            <br>
            <br>

            <section>
                <div class="ufps-row">
                    <div class="ufps-black ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-netbook-offset-3 ufps-col-desktop-6 ufps-col-desktop-offset-3">
                        <form class="ufps-black" id="formLogin" action="<%=application.getContextPath()%>/LoginServlet" method="POST">
                            <h2 class="ufps-text-center ufps-red">Iniciar Sesión</h2>

                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Código</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="codigo" id="codigo" placeholder="Código:" class="ufps-input ufps-green" required/>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>


                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6">
                                <label><h3>Contraseña</h3></label>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6">
                                <input type="password" name="contrasena" id="contrasena" class="ufps-input ufps-green" required/>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-netbook-12 ufps-col-desktop-12 ufps-text-center">
                                <input type="submit"  value="Ingresar" class="ufps-btn" />
                            </div>

                            <div id="divCargando" class="ufps-col-mobile-12 ufps-col-netbook-12 ufps-col-desktop-12 ufps-text-center" hidden="true">
                                <img src="img/CirculoCargando.gif" />
                            </div>
                        </form>
                    </div>

                </div>
            </section>            
            <jsp:include page="assets/footer.jsp" /> 
        </div>
    </body>
</html>
