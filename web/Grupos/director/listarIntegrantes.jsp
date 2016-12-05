<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : listarIntegrantes
    Created on : 8/11/2016, 02:20:09 PM
    Author     : Zuly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="../css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-1.11.0.min.js" type="text/javascript"></script>
        <script src="../js/ufps.min.js"></script>
        <script src="../js/gestionIntegrantes.js" type="text/javascript"></script>
    </head>
    <jsp:useBean id="fachada" class="gruposinvestigacion.fachada.Fachade" scope="session" ></jsp:useBean>
    <jsp:useBean id="grupo" class="gruposinvestigacion.model.dto.InvestigacionGrupo" scope="session" ></jsp:useBean>
    <%
        request.setAttribute("integrantes", grupo.getIntegrantes());
    %>

    <style>
        .bordeGris{
            border-radius: 10px 10px 10px 10px;
            -moz-border-radius: 10px 10px 10px 10px;
            -webkit-border-radius: 10px 10px 10px 10px;
            border: 2px solid #A0A0A0;
        }
    </style>
    <body onload="listarDocentes(), listarIntegrantesPorGrupo(<%=grupo.getCodigocolciencias()%>)">
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
                        <h1 class="ufps-red">Integrantes</h1>

                        <button id="btnMostrarDivRegistro" class="ufps-btn"><i class="fa fa-plus-circle fa-lg" aria-hidden="true"></i></button>
                        <div id="divRegistro" hidden="true">
                            <button id="btnOcultarDivRegistro" class="ufps-btn"><i class="fa fa-times fa-lg" aria-hidden="true"></i></button>

                            <form id="formRegistrarIntegrante">
                                <h2>Registrar Integrante</h2>

                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <label><h3>Tipo</h3></label>
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <select class="ufps-input" name="tipoIntegrante" id="tipoIntegrante">
                                        <option value="1" selected="true">Docente</option>
                                        <option value="2">Estudiante</option>
                                    </select>
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                                </div>

                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <label><h3>Nuevo Integrante</h3></label>
                                </div>
                                <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                    <select class="ufps-input" name="selectIntegrante" id="selectIntegrante">
                                    </select>
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
                                <th>Código</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Tipo</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                                </thead>
                                <tbody id="tablaIntegrantes">
                                    <c:forEach var="integrante" items="${integrantes}">
                                        <tr>
                                            <td>${integrante.codigo}</td>
                                            <td>${integrante.persona.nombres}</td>
                                            <td>${integrante.persona.apellidos}</td>
                                            <c:choose>
                                                <c:when test="${integrante.tipo==1}">
                                                    <td>Docente</td>
                                                </c:when>
                                                <c:when test="${integrante.tipo==2}">
                                                    <td>Estudiante</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>Director</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${integrante.estado==true}">
                                                    <td>Activo</td>
                                                </c:when>
                                                <c:when test="${integrante.estado==false}">
                                                    <td>Inactivo</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>Director</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${integrante.estado==true}">
                                                    <td><div class='ufps-tooltip'><button onclick='desactivarIntegrante(this)'  id="${integrante.codigo}" class='ufps-btn'><i class='fa fa-trash-o' aria-hidden='true'></i></button><span class='ufps-tooltip-content-top'>Desactivar</span></div></td>
                                                            </c:when>
                                                            <c:when test="${integrante.estado==false}">
                                                    <td><div class='ufps-tooltip'><button onclick='activarIntegrante(this)'  id="${integrante.codigo}" class='ufps-btn'><i class='fa fa-check' aria-hidden='true'></i></button><span class='ufps-tooltip-content-top'>Desactivar</span></div></td>
                                                            </c:when>
                                                            <c:otherwise>
                                                    <td>Director</td>
                                                </c:otherwise>
                                            </c:choose>
                                        </tr>
                                    </c:forEach>
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