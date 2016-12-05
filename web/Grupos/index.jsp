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
        <link href="css/ufps.min.css" rel="stylesheet">
        <!--Librerías para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script src="js/ufps.min.js"></script>
    </head>
    <body>
        <!--Contenido-->


        <div class="ufps-container">
            <jsp:include page="assets/menu.jsp" /> 

            <br>
            <br>
            <section>
                <div class="ufps-row">
                    <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-4" > 
                        <div class="ufps-card">
                            <img src="img/gidis.jpg" alt="Imagen del card">
                            <div class="ufps-card-caption ufps-black">
                                <h4><b>GIDIS</b></h4>
                                <p>Grupo de Investigación y Desarrollo de Ingeniería de Software</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-4" > 
                        <div class="ufps-card">
                            <img src="img/gipe.jpg" alt="Imagen del card">
                            <div class="ufps-card-caption ufps-black">
                                <h4><b>GIPE</b></h4>
                                <p>Grupo de Investigación en Proyección Empresarial</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-4" > 
                        <div class="ufps-card ufps-black">
                            <img src="img/cinera.jpg" alt="Imagen del card">
                            <div class="ufps-card-caption">
                                <h4><b>CINERA</b></h4>
                                <p>Grupo de Investigación Contable</p>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>




            <jsp:include page="assets/footer.jsp" /> 
        </div>
    </body>
</html>