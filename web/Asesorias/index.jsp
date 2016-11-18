<%-- 
    Document   : index
    Created on : 12/10/2016, 08:31:11 AM
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
        <link href="../public/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/default.min.css">
        <!--Bootstrap-->
        <link rel="stylesheet" href="diseno/css/bootstrap.css"/>
        <!--Mis estilos: Diego Leal-->
        <link rel="stylesheet" href="diseno/css/toastr.css"/>

    </head>
    <body>

        <header>
            <center> <img id="banner" src="public/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header>
        <div class="ufps-navbar ufps-navbar-light" id="menuPrincipal">
            <div class="ufps-container">
                <div class="ufps-navbar-brand">
                    <div class="ufps-btn-menu" onclick="toggleMenu('menuPrincipal')">
                        <div class="ufps-btn-menu-bar"></div>
                        <div class="ufps-btn-menu-bar"></div>
                        <div class="ufps-btn-menu-bar"></div>
                    </div>
                    Site Estadístico
                </div>
                <div class="ufps-navbar-left">

                    <a href="" class="ufps-navbar-btn">Inicio</a>
                    <a href="" class="ufps-navbar-btn">Registrar asesoria</a>
                    <a href="" class="ufps-navbar-btn">Consultar asesoria</a>
                </div>
                <div class="ufps-navbar-right">
                    <div class="ufps-navbar-corporate">
                        <a href="" class="ufps-navbar-btn"> Administrador </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="ufps-container">
            <div class="ufps-col-desktop-12 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
                <div class="ufps-col-desktop-4 ufps-col-desktop-offset-2 ufps-col-netbook-5 ufps-col-netbook-offset-1 ufps-col-tablet-6 ufps-col-mobile-12">
                    <jsp:useBean id="controlador" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
                    <%
                        
                        //Capturar el codigo del docente
                        String rta = controlador.consultarMateriasDocentes("1150833");
                        System.out.println("CONSULTA:: " + rta + "::");
                        String v1[] = rta.split(":");
                        //codigoAsinatura, grupo, nombre
                        /*String v1[] = new String[4];
                        v1[0] = "115111 - Programación orientda a objetos - A";
                        v1[1] = "115112 - Programación orientda a objetos - B";
                        v1[2] = "115113 - Estructura de datos - B";
                        v1[3] = "115114 - Analisis de algoritmos - C";*/
                    %>


                    <label>Materia</label>
                    <select class="form-control" style="width: auto;" id="materia" onchange="cargarEstudiantes()">
                        <option>Seleccione la materia</option>
                        <%
                            for (int i = 0; i < v1.length; i++) {
                                String v2[] = v1[i].split(";");
                                String m = v2[0] + " - " + v2[1] + " - " + v2[2];
                        %>
                        <option><%=m%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="ufps-col-desktop-4 ufps-col-desktop-offset-2 ufps-col-netbook-5 ufps-col-netbook-offset-1 ufps-col-tablet-6 ufps-col-mobile-12">
                    <label>Código Estudiante</label>
                    <select class="form-control" style="width: auto;" id="estudiantesMateria">
                        <option>Seleccione el estudiante</option>
                    </select>
                </div>
            </div>
            <div class="ufps-col-desktop-12 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
                <div class="ufps-col-desktop-10 ufps-col-desktop-push-2" >
                    <label>Tema tratado</label>
                    <input type="text" class="ufps-input-line" id="temaTratado" placeholder="Tema tratado en la asesoria"
                           style="width: 70%;"/>
                </div>
            </div>
            <div class="ufps-col-desktop-12 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
                <div class="ufps-col-desktop-2 ufps-col-desktop-offset-5 ufps-col-netbook-4 ufps-col-netbook-offset-4 ufps-col-tablet-4 ufps-col-tablet-offset-4 ufps-col-mobile-6 ufps-col-mobile-offset-3">
                    <button type="submit" class="ufps-btn" onclick="registrarAsesoria()">Registrar</button>
                </div>
            </div>
        </div>
        <br>
        <div class="ufps-col-desktop-12 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
            <div class="ufps-col-desktop-4 ufps-col-desktop-offset-5 ufps-col-netbook-4 ufps-col-netbook-offset-5 ufps-col-tablet-6 ufps-col-tablet-offset-4 ufps-col-mobile-12">
                <h4>ASESORIAS DE LA SEMANA</h4>
            </div>
        </div>

        <div class="ufps-col-desktop-10 ufps-col-desktop-offset-1 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
            <table class="ufps-table">
                <thead>
                    <tr>
                        <td align="center"><strong>Cód Asig.</strong></td>
                        <td align="center"><strong>Nombre asignatura</strong></td>
                        <td align="center"><strong>Grupo</strong></td>
                        <td align="center"><strong>Nombre del estudiante</strong></td>
                        <td align="center"><strong>Código est</strong></td>
                        <td align="center"><strong>Fecha</strong></td>
                        <td align="center"><strong>Hora</strong></td>
                    </tr>
                </thead>
                <%
                    //Consultar las asesorias de la semana
                %>
                <tbody id="asesoriasRegistradas">

                </tbody>
            </table>
        </div>
        <!--<footer>
            <div class="ufps-container ufps-footer">
                <h3>Universidad Francisco de Paula Santander</h3>
                <p>Programa Ingeniería de Siste
        <!--Scripts dada por grupo integradormas</p>
</div>   
</footer>-->

        <script src="diseno/js/jquery-2.1.4.min.js"></script>
        <!--Scripts dados por grupo integrador-->
        <script src="../public/js/ufps.js"></script>
        <!--bootstrap-->
        <script src="diseno/js/tether.min.js" type="text/javascript"></script>
        <script src="diseno/js/bootstrap.js" type="text/javascript"></script>
        <script src="diseno/js/scripts.js" type="text/javascript"></script>
        <script src="diseno/js/toastr.js" type="text/javascript"></script>
    </body>
</html>
