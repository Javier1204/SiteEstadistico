<%-- 
    Document   : consultaAsesoria
    Created on : 12/10/2016, 09:53:21 AM
    Author     : Diego Leal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Asesoria Docentes</title>

        <!--Estilos plantilla dada por grupo integrador-->
        <link href="../public/css/ufps.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/default.min.css">
        <!--Bootstrap-->
        <link rel="stylesheet" href="diseno/css/bootstrap.css"/>
        <link rel="stylesheet" href="diseno/css/toastr.css">
        <link rel="stylesheet" href="diseno/css/estilos.css"/>

    </head>
    <body>
        <jsp:include page="../plantilla/header.jsp"></jsp:include> 

        <div class="barraIzq">
            <div class="ref">
                <a href="index.jsp">
                    Registrar Asesoria
                </a>
            </div>
            <div class="ref">
                <a href="consultaAsesoria.jsp">
                    Consultar horario
                </a>
            </div>
            <div class="ref">
                <a href="administrador.jsp">
                    Administrador
                </a>
            </div>
            <div class="ref">
                <a href="registrarHorario.jsp">
                    Mi horario
                </a>
            </div>
        </div>

        <div class="ufps-container">
            <div class="ufps-col-desktop-12 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
                <div class="ufps-col-desktop-2 ufps-col-desktop-offset-1 ufps-col-netbook-2 ufps-col-tablet-4 ufps-col-mobile-6">
                    <label>Tpo de consulta</label>
                    <br/>
                    <input type="radio" id="tipoConsulta" name="tipoConsulta" value="codigo" onclick="buscaCodigo()"/>Código
                    <br/>
                    <input type="radio" id="tipoConsulta" name="tipoConsulta" value="nombre" onclick="buscaNombre()"/>Nombre
                </div>
                <div class="ufps-col-desktop-2 ufps-col-desktop-offset-2 ufps-col-netbook-2 ufps-col-netbook-offset-2 ufps-col-tablet-4 ufps-col-mobile-6">
                    <label>Consulta por</label>
                    <br/>
                    <input type="radio" id="tipoConsulta" name="consultaPor" value="docente" onclick="ocultarGrupo()"/>Docente
                    <br/>
                    <input type="radio" id="tipoConsulta" name="consultaPor" value="materia" onclick="mostrarGrupo()"/>Materia
                </div>
                <div id="selectGrupo" class="ufps-col-desktop-2 ufps-col-desktop-offset-2 ufps-col-netbook-2 ufps-col-netbook-offset-2 ufps-col-tablet-4 ufps-col-mobile-4 ufps-col-mobile-offset-4" style="display: none;">
                    <label>Grupo</label>
                    <select class="form-control" id="grupoMateria" style="width: auto;">
                        <option>Seleccione el grupo</option>
                        <option>A</option>
                        <option>B</option>
                        <option>C</option>
                        <option>D</option>
                        <option>E</option>
                        <option>F</option>
                    </select>
                </div>
            </div>
            <div class="ufps-col-desktop-12 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
                <div class="ufps-col-desktop-8 ufps-col-desktop-offset-3 ufps-col-netbook-8 
                     ufps-col-netbook-offset-2 ufps-col-tablet-10 ufps-col-tablet-offset-1 ufps-col-mobile-12"
                     id="busqueda">

                </div>
            </div>
            <div class="ufps-col-desktop-12 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
                <div class="ufps-col-desktop-2 ufps-col-desktop-offset-5 ufps-col-netbook-4 ufps-col-netbook-offset-4 ufps-col-tablet-6 ufps-col-tablet-offset-3 ufps-col-mobile-8 ufps-col-mobile-offset-3">
                    <button type="submit" class="ufps-btn" onclick="buscarHorario()">Consultar</button>
                </div>
            </div>
            <br/>
            <div class="ufps-col-desktop-12 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
                <div class="ufps-col-desktop-4 ufps-col-desktop-offset-5 ufps-col-netbook-4 ufps-col-netbook-offset-5 ufps-col-tablet-6 ufps-col-tablet-offset-4 ufps-col-mobile-10 ufps-col-mobile-offset-2">
                    <h4>NOMBRE DOCENTE</h4>
                </div>
                <table class="ufps-table">
                    <thead>
                        <tr>
                            <td align="center"><strong>Nombre</strong></td>
                            <td align="center"><strong>Día</strong></td>
                            <td align="center"><strong>Hora asesoria</strong></td>
                        </tr>
                    </thead>
                    <tbody id="horarios">
                    </tbody>
                </table>
            </div>
        </div>
        <script src="diseno/js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <!--Scripts dados por grupo integrador-->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/highlight.min.js"></script>
        <script src="../public/js/ufps.js"></script>

        <!--bootstrap-->
        <script src="diseno/js/bootstrap.js" type="text/javascript"></script>
        <script src="diseno/js/blockUI.js" type="text/javascript"></script>
        <script src="diseno/js/scripts.js" type="text/javascript"></script>
        <script src="diseno/js/toastr.js" type="text/javascript"></script>
    </body>
</html>

