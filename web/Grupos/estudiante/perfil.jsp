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
        request.setAttribute("estudiante", fachada.getUsuario());
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
                        <h1 class="ufps-red">Bienvenido</h1>
                        <div class="ufps-col-mobile-12 ufps-col-tablet-6 bordeGris">
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <h3 class="ufps-red">Nombre</h3>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <h4>${estudiante.persona.nombres} ${estudiante.persona.apellidos}</h4>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <h3 class="ufps-red">Código</h3>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <h4>${estudiante.persona.codigo}</h4>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <h3 class="ufps-red">Programa al que Pertenece<%%></h3>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <h4>${estudiante.persona.programaacademico}</h4>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <h3 class="ufps-red">Semestre</h3>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                <h4>${estudiante.persona.semestre}</h4>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>
                        </div>
                            
                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                        <div class="ufps-col-mobile-12 ufps-text-center">
                            <a href="bitacora.jsp" class="ufps-btn">Ver Bitácora</a>
                        </div>
                    </div>
                    </div>
                    
                    <br>
                    <br>
                </div>
            </section>
            <jsp:include page="../assets/footer.jsp" /> 
        </div>
    </body>
</html>