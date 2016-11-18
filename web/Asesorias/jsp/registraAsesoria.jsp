<%-- 
    Document   : registraAsesoria
    Created on : 1/11/2016, 07:44:43 PM
    Author     : DiegoLeal
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="asesoria" class="asesorias.DTO.Asesoria" scope="session"></jsp:useBean>
<jsp:useBean id="controlador" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
<%
    String materia = new String(request.getParameter("materia").getBytes("ISO-8859-1"), "UTF-8");
    String estudiante = new String(request.getParameter("estudiante").getBytes("ISO-8859-1"), "UTF-8");
    String tema = new String(request.getParameter("tema").getBytes("ISO-8859-1"), "UTF-8");
    
    System.out.println("materia:: " + materia + " estudiante: " + estudiante + " tema:: " + tema); 
    //Registrar la asesoria
    // cargar: codAsignatura, nombre Asignatura, grupo, NombreEstudiante, codigoEst
    String v1[] = materia.split(" - ");
    String codigoMateria = v1[0];
    String nombreMateria = v1[1];
    String grupo = v1[2];
    
    String v2[] = estudiante.split(" - ");
    String codigoEst = v2[0];
    String nombre = v2[1];

    Calendar c = new GregorianCalendar();

    int año = c.get(Calendar.YEAR);
    int mes = c.get(Calendar.MONTH);
    int dia = c.get(Calendar.DAY_OF_MONTH);
    int hora = c.get(Calendar.HOUR_OF_DAY);
    int minuto = c.get(Calendar.MINUTE);
    
    String fecha = año + "-" + mes + "-" + dia;
    
    asesoria.setFecha(fecha);
    //Sacarlo del atributo session
    asesoria.setCod_docente("1151111");
    asesoria.setCod_est(codigoEst);
    asesoria.setTema(tema);
    asesoria.setGrupo(grupo);
    asesoria.setHora(hora + ":" +minuto);
    asesoria.setCod_m(codigoMateria);
    System.out.println("ASESORIA:: " + asesoria.toString());
    
    String rta = controlador.registrarAsesoria(asesoria);
    String msg = "<tr>"
            + "<td align='center'>1151111</td>"
            + "<td align='center'>" + nombreMateria + "</td>"
            + "<td align='center'>" + grupo + "</td>"
            + "<td align='center'>" + "Nombre del estudiante" + "</td>"
            + "<td align='center'>" + estudiante + "</td>"
            + "<td align='center'>" + fecha + "</td>"
            + "<td align='center'>" + hora + ":" +minuto +"</td></tr>";
    out.print(msg);
%>

