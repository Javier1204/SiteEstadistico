<%-- 
    Document   : index
    Created on : 12/10/2016, 08:31:11 AM
    Author     : Diego Leal
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
     ICuenta cuenta = (ICuenta) session.getAttribute("usuario");
     if (cuenta == null) {
     response.sendRedirect("../index.jsp");
     } else {
     if (cuenta.containRol("Docente")) {
            
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
        <link href="../public/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/default.min.css">
        <!--Bootstrap-->
        <link rel="stylesheet" href="diseno/css/bootstrap.css"/>
        <!--Mis estilos: Diego Leal-->
        <link rel="stylesheet" href="diseno/css/toastr.css"/>
        <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
        <link href="diseno/css/estilos.css" rel="stylesheet">

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

                <div class="ufps-col-desktop-10 ufps-col-desktop-push-1 ufps-col-netbook-10 ufps-col-tablet-10 ufps-col-mobile-10">
                    <div class="ufps-col-desktop-5 ufps-col-netbook-5 ufps-col-tablet-6 ufps-col-mobile-12">
                    <jsp:useBean id="controlador" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
                    <%
                        
                        String codDoc = cuenta.getUser();
                        //Capturar el codigo del docente
                        //String codDoc = "22";
                        String rta = controlador.consultarMateriasDocentes(codDoc);
                        System.out.println("CONSULTA:: " + rta + "::");

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
                        <%   if (!rta.isEmpty()) {
                                System.out.println("Es vacia");
                                String v1[] = rta.split(":");
                                if (v1.length > 0) {
                                    for (int i = 0; i < v1.length; i++) {
                                        String v2[] = v1[i].split(";");
                                        String m = v2[0] + " - " + v2[1] + " - " + v2[2];
                        %>
                        <option><%=m%></option>
                        <%
                                    }
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="ufps-col-desktop-5 ufps-col-netbook-5 ufps-col-tablet-6 ufps-col-mobile-12">
                    <label>Código Estudiante</label>
                    <select class="form-control" style="width: auto;" id="estudiantesMateria">
                        <option>Seleccione el estudiante</option>
                        <!--<option>1150683 - Edinson Caicedo Silva</option>-->
                    </select>
                </div>
                <div class="ufps-col-desktop-2 ufps-col-netbook-2">
                    <input type="checkbox" id="chFecha" checked data-toggle="toggle" data-on="Asignar fecha<br>automática" data-off="Asignar fecha<br>manual" onchange="cargarFecha()">
                </div>
            </div>
            <div class="ufps-col-desktop-11 ufps-col-desktop-push-1 ufps-col-netbook-12 ufps-col-tablet-12 ufps-col-mobile-12">
                <div class="ufps-col-desktop-8 ufps-col-netbook-8 ufps-col-tablet-12 ufps-col-mobile-12">
                    <label>Tema tratado</label>
                    <input type="text" class="ufps-input-line" id="temaTratado" placeholder="Tema tratado en la asesoria"
                           style="width: 70%;"/>

                </div>
                <div class="ufps-col-desktop-3" style="margin-top: 10px; display: none;" id="fechaAseso">
                    <%
                        Calendar c1 = GregorianCalendar.getInstance();
                        System.out.println("Fecha actual: " + c1.getTime().toLocaleString());

                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        System.out.println("Fecha Formateada: " + sdf.format(c1.getTime()));
                        String f2 = sdf.format(c1.getTime());
                        c1.add(Calendar.DATE, -8);
                        System.out.println("Fecha Formateada: " + sdf.format(c1.getTime()));
                        String f1 = sdf.format(c1.getTime());
                        int hora = c1.get(Calendar.HOUR_OF_DAY);
                        int minuto = c1.get(Calendar.MINUTE);
                        String horaAseso = "";
                        if (hora < 10) {
                            horaAseso = "0" + hora + ":" + minuto + ":00";
                        } else {
                            horaAseso = hora + ":" + minuto + ":00";
                        }

                        System.out.println("hora actual: " + horaAseso);
                    %>
                    <input type="date" class="form-control" id="fechaAsesoria" min="<%=f1%>" max="<%=f2%>"/>
                    <input type="time" class="form-control" id="horaAsesoria" value="<%=horaAseso%>" max="22:00:00" min="06:00:00" step="1"/>
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

                <tbody id="asesoriasRegistradas">
                    <%//Consultar las asesorias de la semana
                        //enviar el codiggo del docente

                        String asesorias = controlador.consultarAsesoriasAnteriores(codDoc);
                        System.out.println("rrta::: " + asesorias);
                        if (!asesorias.isEmpty()) {
                            System.out.println("Es vacia las asesorias");
                            String v1[] = asesorias.split("#");
                            System.out.println("este es el split:: " + v1[0]);
                            if (v1.length > 0) {
                                for (int i = 0; i < v1.length; i++) {
                                    System.out.println("Ingreso:: " + i + " con:: " + v1[i] + " tamaño v1= " + v1.length);
                                    //fecha, cod_est, doc_docente, cod_materia, grupo, tema, hora
                                    String v2[] = v1[i].split(";");
                                    String nombreEstudiante = controlador.consultarNombreEst(v2[1]);
                                    System.out.println("Este es el estudiante:::: " + nombreEstudiante);
                                    String nombreAsignatura = controlador.consultarNombreMat(v2[3]);
                                    System.out.println("Este es el nombre de la asignatura  ::: " + nombreAsignatura);
                    %>
                    <tr>
                        <td align="center"><%=v2[3]%></td>
                        <td align="center"><%=nombreAsignatura%></td>
                        <td align="center"><%=v2[4]%></td>
                        <td align="center"><%=nombreEstudiante%></td>
                        <td align="center"><%=v2[1]%></td>
                        <td align="center"><%=v2[0]%></td>
                        <td align="center"><%=v2[6]%></td>
                    </tr>
                    <%
                                }
                            }
                        }
                    %>
                </tbody>
            </table>


            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header" style="text-align: center;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Registrar asesorias externa a la carga académica</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="ufps-col-desktop-4">
                                    <label>Cod. estudiante</label>
                                    <input type="number" class="form-control" id="codEstExterno" placeholder="Código Estudiante"/>
                                </div>
                                <div class="ufps-col-desktop-8">
                                    <label>Nombre del estudiante</label>
                                    <input type="text" class="form-control" id="nombreEstExterno" placeholder="Nombre del estudiante"/>
                                </div>

                                <div class="ufps-col-desktop-4">
                                    <label>Fecha asesoria</label>
                                    <input type="date" class="form-control" id="fechaAsesoriaExterna" value="<%=f2%>" min="<%=f1%>" max="<%=f2%>"/>
                                </div>
                                <div class="ufps-col-desktop-4">
                                    <label>Hora asesoria</label>
                                    <input type="time" class="form-control" id="horaAsesoriaExterna" value="<%= horaAseso%>" step="1"/>
                                </div>
                                <div class="ufps-col-desktop-4">
                                    <label>Código de la materia</label>
                                    <input type="number" class="form-control" id="codigoAsesoriaExterna" placeholder="Código de la materia">
                                </div>
                                <div class="ufps-col-desktop-12">
                                    <label>Nombre de la materia</label>
                                    <input type="text" class="form-control" id="nombreAsesoriaExterna" placeholder="Nombre de la materia">
                                </div>
                                <div class="ufps-col-desktop-12">
                                    <label>Tema tratado</label>
                                    <input type="text" class="form-control" id="temaAsesoriaExterna" placeholder="Tema tratado">
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            <button type="button" class="ufps-btn" onclick="registrarAsesoriaExterna()">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-3 col-lg-offset-1">
                <button type="button" class="ufps-btn btn-primary" onclick="asesoriasDocentes()">Mis asesorias</button>
            </div>
            <div class="col-lg-4 col-lg-push-4">
                <button type="submit" class="ufps-btn" data-toggle="modal" data-target="#myModal">ASESORIAS EXTERNA</button>
            </div>
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
        <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
        <script src="diseno/js/bootstrap.js" type="text/javascript"></script>
        <script src="diseno/js/blockUI.js" type="text/javascript"></script>
        <script src="diseno/js/scripts.js" type="text/javascript"></script>
        <script src="diseno/js/toastr.js" type="text/javascript"></script>
    </body>
</html>
