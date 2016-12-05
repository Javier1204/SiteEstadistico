<%-- 
    Document   : consultarHorario
    Created on : 1/11/2016, 09:39:18 PM
    Author     : DiegoLeal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
<%
    String tipoConsulta = request.getParameter("tipoConsulta").toString();
    String consultaPor = request.getParameter("consultaPor").toString();
    String grupo = request.getParameter("grupo").toString();
    String entrada = new String(request.getParameter("entrada").getBytes("ISO-8859-1"), "UTF-8");

    System.out.println(tipoConsulta + " : " + consultaPor + " : " + grupo + " : " + entrada);
    String rta = "";
    String msg = "";
    if (tipoConsulta.equals("nombre")) {
        //Busca por nombre
        if (consultaPor.equals("docente")) {
            //Busca docente por nombre
            String rta1 = controlador.consultarDocenteNombre(entrada);
            System.out.println("consulta por docente nombre:: " + rta1);
            String v1[] = rta1.split("#");
            if (v1.length > 0) {
                for (int i = 0; i < v1.length; i++) {
                    //dia, horaIni, horaFin, nombre, apellidos
                    String v2[] = v1[i].split(";");
                    String dia = "";
                    if (v2[0].equals("1")) {
                        dia = "Lunes";
                    } else if (v2[0].equals("2")) {
                        dia = "Martes";
                    } else if (v2[0].equals("3")) {
                        dia = "Miércoles";
                    } else if (v2[0].equals("4")) {
                        dia = "Jueves";
                    } else if (v2[0].equals("5")) {
                        dia = "Viernes";
                    }

                    System.out.println("este es el dia:: " + dia);
                    msg += "<tr>"
                            + "<td align='center'>" + v2[3] + " " + v2[4] + "</td>"
                            + "<td align='center'>" + dia + "</td>"
                            + "<td align='center'>" + v2[1] + " - " + v2[2] + "</td>"
                            + "</tr>";
                }
                out.print(msg);
            } else {
                out.print("vacio");
            }

        } else {
            //Busca materia por nombre
            String rta1 = controlador.consultarMateriaNombre(entrada, grupo);
            String v1[] = rta1.split("#");
            if (v1.length > 0) {
                for (int i = 0; i < v1.length; i++) {
                    //a.dia, a.hora_ini, a.hora_fin, m.nombre
                    String v2[] = v1[i].split(";");
                    String dia = "";
                    if (v2[0].equals("1")) {
                        dia = "Lunes";
                    } else if (v2[0].equals("2")) {
                        dia = "Martes";
                    } else if (v2[0].equals("3")) {
                        dia = "Miércoles";
                    } else if (v2[0].equals("4")) {
                        dia = "Jueves";
                    } else if (v2[0].equals("5")) {
                        dia = "Viernes";
                    }
                    msg += "<tr>"
                            + "<td align='center'>" + v2[3] + "</td>"
                            + "<td align='center'>" + dia + "</td>"
                            + "<td align='center'>" + v2[1] + " - " + v2[2] + "</td>"
                            + "</tr>";
                }
                out.print(msg);
            } else {
                out.print("vacio");
            }
        }
    } else {
        //Busca por codigo
        if (consultaPor.equals("docente")) {
            //Busca docente por codigo
            String rta1 = controlador.consultarDocenteCodigo(entrada);
            System.out.println("consulta por docente codigo:: " + rta1);
            String v1[] = rta1.split("#");
            if (v1.length > 0) {
                for (int i = 0; i < v1.length; i++) {
                    //dia, horaIni, horaFin, nombre, apellidos
                    String v2[] = v1[i].split(";");
                    String dia = "";
                    if (v2[0].equals("1")) {
                        dia = "Lunes";
                    } else if (v2[0].equals("2")) {
                        dia = "Martes";
                    } else if (v2[0].equals("3")) {
                        dia = "Miércoles";
                    } else if (v2[0].equals("4")) {
                        dia = "Jueves";
                    } else if (v2[0].equals("5")) {
                        dia = "Viernes";
                    }
                    msg += "<tr>"
                            + "<td align='center'>" + v2[3] + " " + v2[4] + "</td>"
                            + "<td align='center'>" + dia + "</td>"
                            + "<td align='center'>" + v2[1] + " - " + v2[2] + "</td>"
                            + "</tr>";
                }
                out.print(msg);
            } else {
                out.print("vacio");
            }
        } else {
            //Busca materia por codigo
            String rta1 = controlador.consultarMateriaCodigo(entrada, grupo);
            //dia, horaIni, horaFin, nombre
            String v1[] = rta1.split("#");
            if (v1.length > 0) {
                for (int i = 0; i < v1.length; i++) {
                    String v2[] = v1[i].split(";");
                    String dia = "";
                    if (v2[0].equals("1")) {
                        dia = "Lunes";
                    } else if (v2[0].equals("2")) {
                        dia = "Martes";
                    } else if (v2[0].equals("3")) {
                        dia = "Miércoles";
                    } else if (v2[0].equals("4")) {
                        dia = "Jueves";
                    } else if (v2[0].equals("5")) {
                        dia = "Viernes";
                    }
                    msg += "<tr>"
                            + "<td align='center'>" + v2[3] + "</td>"
                            + "<td align='center'>" + dia + "</td>"
                            + "<td align='center'>" + v2[1] + " - " + v2[2] + "</td>"
                            + "</tr>";
                }
                out.print(msg);
            } else {
                out.print("vacio");
            }
        }
    }
%>
