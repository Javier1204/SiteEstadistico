<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">


    <head>
        <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
        <meta charset="utf-8">
        <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Metaetiqueta para la correcta visualización en dispositivos moviles-->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0">
        <title>Grupos de Investigación</title>
        <!--Añada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
        <link href="../css/ufps.min.css" rel="stylesheet">
        <!--Librerías para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script src="../js/ufps.min.js"></script>
    </head>
    <jsp:useBean id="fachada" class="gruposinvestigacion.fachada.Fachade" scope="session" ></jsp:useBean>
    <%
        request.setAttribute("usuario", fachada.getUsuario());
    %>

    <style>
        .bordeGris{
            border-radius: 10px 10px 10px 10px;
            -moz-border-radius: 10px 10px 10px 10px;
            -webkit-border-radius: 10px 10px 10px 10px;
            border: 2px solid #b33540;
        }
    </style>
    <body>
        <!--Contenido-->


        <div class="ufps-container">
            <jsp:include page="../assets/estudiante/menu.jsp" /> 

            <br>
            <br>
            <section>
                <div class="ufps-row ufps-table">
                    <br>
                    <br>
                    <div class="ufps-col-mobile-12 ufps-col-tablet-2">
                        <br>

                        <div class="ufps-card">
                            <img src="../img/docentechica.jpg" class="ufps-img-responsive" />
                        </div>
                    </div>

                    <div class="ufps-black ufps-col-mobile-12 ufps-col-tablet-10">
                        <h1 class="ufps-red">Modificar</h1>
                        <div class="ufps-col-mobile-12 ufps-col-tablet-6 bordeGris">
                            
                            <form class="ufps-black" action="../util/editarDatos.jsp" method="POST">
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <h3 class="ufps-red">Nombre</h3>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <input type="text" name="nombre" value="${usuario.nombre}" class="ufps-input ufps-green" required/>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <h3 class="ufps-red">Apellido</h3>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <input type="text" name="apellido" value="${usuario.apellido}" class="ufps-input ufps-green" required/>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <h3 class="ufps-red">Contraseña</h3>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <input type="password" name="contrasena" class="ufps-input ufps-green"/>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>
                            
                            <div class="ufps-col-mobile-12 ufps-col-netbook-12 ufps-col-desktop-12 ufps-text-center">
                                <input type="submit" value="Guardar Cambios" class="ufps-btn" />
                            </div>
                            </form>
                        </div>
                    </div>
                </div>

            </section>
            <jsp:include page="../assets/footer.jsp" /> 
        </div>
    </body>
</html>