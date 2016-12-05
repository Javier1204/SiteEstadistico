<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : gestionarLineas
    Created on : Nov 28, 2016, 10:20:41 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="fachada" class="gruposinvestigacion.fachada.Fachade" scope="session" ></jsp:useBean>
<jsp:useBean id="grupo" class="gruposinvestigacion.model.dto.InvestigacionGrupo" scope="session" ></jsp:useBean>
<%
    request.setAttribute("lineas", fachada.listarLineasDeInvestigacion(grupo));
%>
<!DOCTYPE html>
<html>
    <head>
        <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
        <meta charset="utf-8">
        <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Metaetiqueta para la correcta visualización en dispositivos moviles-->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0">
        <title>Lineas de Inv.</title>
        <!--Añada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
        <link href="../css/ufps.min.css" rel="stylesheet">
        <!--Librerías para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="../js/jquery-1.11.0.min.js" type="text/javascript"></script>
        <link href="../css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="../js/ufps.min.js"></script>
        <script src="../js/gestionLineas.js" type="text/javascript"></script>
    </head>
    <body onload="listarLineas(<%=grupo.getCodigocolciencias()%>)">
        <!--Contenido-->

        <div class="ufps-container">
            <jsp:include page="../assets/director/menu.jsp" /> 

            <br>
            <br>
            <section>
                <div class="ufps-row ufps-table">
                    <br>
                    <br>
                    <div class="ufps-black ufps-col-mobile-12">

                        <h2 class="ufps-red">Gestión de Líneas de Investigación</h2>

                        <h4>Desde esta sección podrás agregar, modificar o eliminar Líneas de investigación de tu grupo.</h4>
                        <button id="btnMostrarDivRegistro" class="ufps-btn"><i class="fa fa-plus-circle fa-lg" aria-hidden="true"></i></button>
                    </div>

                    <div class="ufps-black ufps-col-mobile-12">
                        <div id="divRegistro" hidden="true">
                            <button id="btnOcultarDivRegistro" class="ufps-btn"><i class="fa fa-times fa-lg" aria-hidden="true"></i></button>
                            <input type="hidden" id="codigoColciencias" value="<%=grupo.getCodigocolciencias()%>" />
                            <form id="formRegistrarLinea">
                            <h2>Registrar Línea</h2>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Nombre</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="nombre" id="nombre" class="ufps-input ufps-green" required/>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>


                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Objetivos</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="objetivos" id="objetivos" class="ufps-input ufps-green" required/>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>


                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Descripción</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="descripcion" id="descripcion" class="ufps-input ufps-green" required/>
                            </div>

                            <input type="hidden" name="accion" value="1" />
                            <div class="ufps-col-mobile-12 ufps-col-netbook-12 ufps-col-desktop-12 ufps-text-center">
                                <input type="submit" value="Registrar" class="ufps-btn" />
                            </div>
                        </form>
                        </div>
                    </div>

                    <div class="ufps-black ufps-col-mobile-12">

                        <table class="ufps-table ufps-text-center">
                            <thead>
                            <th>Nombre</th>
                            <th>Objetivos</th>
                            <th>Descripción</th>
                            <th colspan="2">Acciones</th>
                            </thead>
                            <tbody id="tablaLineas">
                            </tbody>

                        </table>

                    </div>

                    <div class="ufps-black ufps-col-mobile-12" id="divModificarLinea" hidden="true">
                        <form id="formModificarLinea">
                            <h2>Modificar Línea</h2>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Nombre</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="nombre" id="nombreModificar" class="ufps-input ufps-green" required/>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>


                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Objetivos</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="objetivos" id="objetivosModificar" class="ufps-input ufps-green" required/>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>


                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Descripción</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="descripcion" id="descripcionModificar" class="ufps-input ufps-green" required/>
                            </div>

                            <input type="hidden" name="codigoLinea" id="codigoLineaModificar" />
                            <input type="hidden" name="accion" value="2" />
                            <div class="ufps-col-mobile-12 ufps-col-netbook-12 ufps-col-desktop-12 ufps-text-center">
                                <input type="submit" value="Modificar" class="ufps-btn" />
                            </div>
                        </form>
                    </div>
                    <br>
                    <br>
                </div>

                <div id="divCargando" class="ufps-col-mobile-12 ufps-col-netbook-12 ufps-col-desktop-12 ufps-text-center" hidden="true">
                    <img src="../img/CirculoCargando.gif" />
                </div>
            </section>
            <jsp:include page="../assets/footer.jsp" /> 
        </div>
    </body>
</html>