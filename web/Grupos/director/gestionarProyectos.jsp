<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : gestionarProyectos
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
        <script src="../js/gestionProyectos.js" type="text/javascript"></script>
    </head>
    <jsp:useBean id="fachada" class="gruposinvestigacion.fachada.Fachade" scope="session" ></jsp:useBean>
    <jsp:useBean id="grupo" class="gruposinvestigacion.model.dto.InvestigacionGrupo" scope="session" ></jsp:useBean>

    <%
        request.setAttribute("lineas", fachada.listarLineasDeInvestigacion(grupo));
        request.setAttribute("integrantes", fachada.listarIntegrantesPorGrupo(grupo));
    %>
    <style>
        .bordeGris{
            border-radius: 10px 10px 10px 10px;
            -moz-border-radius: 10px 10px 10px 10px;
            -webkit-border-radius: 10px 10px 10px 10px;
            border: 2px solid #A0A0A0;
        }
    </style>
    <body onload="listarProyectos(<%=grupo.getCodigocolciencias()%>)">
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
                        <h1 class="ufps-red">Proyectos</h1>

                        <button id="btnMostrarDivRegistro" class="ufps-btn"><i class="fa fa-plus-circle fa-lg" aria-hidden="true"></i></button>
                        <div id="divRegistro" hidden="true">
                            <button id="btnOcultarDivRegistro" class="ufps-btn"><i class="fa fa-times fa-lg" aria-hidden="true"></i></button>

                            <form id="formRegistrarProyecto">
                                <h2>Registrar Proyecto</h2>

                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <label><h3>Línea de Investigación</h3></label>
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <select class="ufps-input" name="lineainvestigacion" id="lineainvestigacion">
                                        <c:forEach var="linea" items="${lineas}">
                                            <option value="${linea.codigolinea}">${linea.nombre}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <label><h3>Nombre Proyecto</h3></label>
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6">
                                    <input type="text" name="nombreproyecto" id="nombreproyecto" class="ufps-input ufps-green" required/>
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <label><h3>Líder</h3></label>
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <select class="ufps-input" name="integrante_codigoLider" id="integrante_codigoLider">
                                        <c:forEach var="integrante" items="${integrantes}">
                                            <option value="${integrante.codigo}">${integrante.persona.nombres} ${integrante.persona.apellidos}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6">
                                    <label><h3>Fecha de Inicio</h3></label>
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6">
                                    <input type="date" name="fechainicio" id="fechainicio" class="ufps-input ufps-green" required/>
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                                </div>
                                
                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6">
                                    <label><h3>Fecha de Fin</h3></label>
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6">
                                    <input type="date" name="fechafin" id="fechafin" class="ufps-input ufps-green" required/>
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <label><h3>Tipo de Financiamiento</h3></label>
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6">
                                    <input type="text" name="tipoFinanciamiento" id="tipoFinanciamiento" class="ufps-input ufps-green" required/>
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                                </div>
                                <input type="hidden" id="codigoColciencias" name="codigoColciencias" value="<%=grupo.getCodigocolciencias()%>" />
                                <input type="hidden" name="accion" value="1" />
                                <div class="ufps-col-mobile-12 ufps-col-netbook-12 ufps-col-desktop-12 ufps-text-center">
                                    <input type="submit" value="Registrar" class="ufps-btn" />
                                </div>
                            </form>
                        </div>

                        <div class="ufps-black ufps-col-mobile-12">
                            <table class="ufps-table ufps-text-center">
                                <thead>
                                <th>Nombre</th>
                                <th>Líder</th>
                                <th>Fecha de Inicio</th>
                                <th>Fecha de Fin</th>
                                <th>Tipo de Financiamiento</th>
                                </thead>
                                <tbody id="tablaProyectos">
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