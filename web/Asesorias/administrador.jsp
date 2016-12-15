<%-- 
    Document   : consultaAsesoria
    Created on : 12/10/2016, 09:53:21 AM
    Author     : Diego Leal
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    ICuenta cuenta = (ICuenta) session.getAttribute("usuario");
    if (cuenta == null) {
        response.sendRedirect("../index.jsp");
    } else {
        if (cuenta.containRol("Coordinador Asesorías")) {

        } else {
            response.sendRedirect("../index.jsp");
        }
    }
%>
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
        <link rel="stylesheet" href="diseno/css/estilos.css">

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
                <div class="ufps-col-desktop-10 ufps-col-desktop-push-2 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
                    <div class="ufps-col-desktop-2 ufps-col-netbook-2 ufps-col-tablet-2 ufps-col-mobile-4">
                        <label>Periodo</label>
                        <select class="form-control" id="periodoInforme">
                            <option>1</option>
                            <option>2</option>
                        </select>
                    </div>
                    <div class="ufps-col-desktop-2 ufps-col-netbook-2 ufps-col-tablet-2 ufps-col-mobile-4">
                        <label>Año</label>
                        <select class="form-control" id="anoInforme">
                        <%
                            int año = 2000;
                            for (int i = 1; i < 18; i++) {
                        %>
                        <option><%=año%></option>
                        <%
                                año = 2000 + i;
                            }
                        %>
                    </select>
                </div>
                <div class="ufps-col-desktop-2 ufps-col-netbook-2 ufps-col-tablet-2 ufps-col-mobile-4">
                    <label>Filtro</label>
                    <select>
                        <option>Seleccione un filtro</option>
                        <option>Horas por docente</option>
                        <option>Cantidad de asesorias por docente</option>
                        <option></option>
                    </select>
                </div>
                <div class="ufps-col-desktop-2 ufps-col-netbook-2 ufps-col-tablet-2 ufps-col-mobile-4" style="margin-top: 15px;">
                    <button type="button" class="ufps-btn" onclick="generarInforme()">Generar informe</button>
                </div>
                <div class="ufps-col-desktop-2 ufps-col-netbook-2 ufps-col-tablet-2 ufps-col-mobile-4" style="margin-top: 15px;" id="descargarArchivo">

                </div>
            </div>
            <div class="ufps-col-desktop-12 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">

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

