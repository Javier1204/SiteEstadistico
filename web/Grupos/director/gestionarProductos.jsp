<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : gestionarProductos
    Created on : Dec 2, 2016, 6:44:23 AM
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
        <title>Grupos de Investigación</title>
        <!--Añada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
        <link href="../css/ufps.min.css" rel="stylesheet">
        <!--Librerías para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <link href="../css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-1.11.0.min.js" type="text/javascript"></script>
        <script src="../js/ufps.min.js"></script>
        <script src="../js/gestionProductos.js" type="text/javascript"></script>
    </head>
    <jsp:useBean id="fachada" class="gruposinvestigacion.fachada.Fachade" scope="session" ></jsp:useBean>
    <jsp:useBean id="grupo" class="gruposinvestigacion.model.dto.InvestigacionGrupo" scope="session" ></jsp:useBean>

    <%
        request.setAttribute("proyectos", fachada.listarProyectosPorGrupo(grupo));
        request.setAttribute("tiposDeProducto", fachada.listarTiposDeProducto());
    %>
    <style>
        .bordeGris{
            border-radius: 10px 10px 10px 10px;
            -moz-border-radius: 10px 10px 10px 10px;
            -webkit-border-radius: 10px 10px 10px 10px;
            border: 2px solid #A0A0A0;
        }
    </style>
    <body>
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
                        <h1 class="ufps-red">Productos</h1>

                        <button id="btnMostrarDivRegistro" class="ufps-btn"><i class="fa fa-plus-circle fa-lg" aria-hidden="true"></i></button>
                        <div id="divRegistro" hidden="true">
                            <button id="btnOcultarDivRegistro" class="ufps-btn"><i class="fa fa-times fa-lg" aria-hidden="true"></i></button>

                            <form id="formRegistrarProducto">
                                <h2>Registrar Producto</h2>

                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <label><h3>Tipo De Producto</h3></label>
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <select class="ufps-input" name="tipoDeProducto" id="tipoDeProducto">
                                        <c:forEach var="tipo" items="${tiposDeProducto}">
                                            <option value="${tipo.codigo}">${tipo.descripcion}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <label><h3>Proyecto al Que Pertenece</h3></label>
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <select class="ufps-input" name="proyecto" id="proyecto">
                                        <option value="0" disabled="true" selected="true">Seleccione el Proyecto</option>
                                        <c:forEach var="proyecto" items="${proyectos}">
                                            <option value="${proyecto.codigoproyecto}">${proyecto.nombreproyecto}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <label><h3>Información Técnica</h3></label>
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6">
                                    <input type="text" name="informacionTecnica" id="informacionTecnica" class="ufps-input ufps-green" required/>
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                                </div>

                                <input type="hidden" id="codigoProyecto" name="codigoProyecto" />
                                <input type="hidden" name="accion" value="1" />
                                <div class="ufps-col-mobile-12 ufps-col-netbook-12 ufps-col-desktop-12 ufps-text-center">
                                    <input type="submit" value="Registrar" class="ufps-btn" />
                                </div>
                            </form>
                        </div>

                        <div class="ufps-black ufps-col-mobile-12">

                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <select class="ufps-input" name="selecProyecto" id="selecProyecto" onchange="listarProductos()">
                                    <option value="0" disabled="true" selected="true">Seleccione el Proyecto</option>
                                    <c:forEach var="proyecto" items="${proyectos}">
                                        <option value="${proyecto.codigoproyecto}">${proyecto.nombreproyecto}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <table class="ufps-table ufps-text-center">
                                <thead>
                                <th>Código</th>
                                <th>Tipo de Producto</th>
                                <th>Información Técnica</th>
                                </thead>
                                <tbody id="tablaProductos">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </section>
            <jsp:include page="../assets/footer.jsp" /> 
        </div>
    </body>
</html>