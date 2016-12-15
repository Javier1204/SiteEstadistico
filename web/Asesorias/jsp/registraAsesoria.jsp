<%-- 
    Document   : registraAsesoria
    Created on : 1/11/2016, 07:44:43 PM
    Author     : DiegoLeal
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="asesoria" class="asesorias.DTO.Asesoria" scope="session"></jsp:useBean>
<jsp:useBean id="controlador" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
<%
    String materia = new String(request.getParameter("materia").getBytes("ISO-8859-1"), "UTF-8");
    String estudiante = new String(request.getParameter("estudiante").getBytes("ISO-8859-1"), "UTF-8");
    String tema = new String(request.getParameter("tema").getBytes("ISO-8859-1"), "UTF-8");
    String fecha = new String(request.getParameter("fecha").getBytes("ISO-8859-1"), "UTF-8");
    String hora = new String(request.getParameter("hora").getBytes("ISO-8859-1"), "UTF-8");

    System.out.println("materia:: " + materia + " estudiante: " + estudiante + " tema:: " + tema);
    //Registrar la asesoria
    // cargar: codAsignatura, nombre Asignatura, grupo, NombreEstudiante, codigoEst
    String v1[] = materia.split(" - ");
    String codigoMateria = v1[0];
    String nombreMateria = v1[2];
    String grupo = v1[1];
    System.out.println("código materia: " + codigoMateria + " nombre materua: " + nombreMateria + " grupo: " + grupo);

    String v2[] = estudiante.split(" - ");
    String codigoEst = v2[0];
    String nombre = v2[1];
    String f = "";
    Calendar c = new GregorianCalendar();
    String horaReal = "";
    if (fecha.equals("auto")) {
        int año = c.get(Calendar.YEAR);
        int mes = c.get(Calendar.MONTH) + 1;
        int dia = c.get(Calendar.DAY_OF_MONTH);
        int horaSys = c.get(Calendar.HOUR_OF_DAY);
        int minuto = c.get(Calendar.MINUTE);

        String fechaSistema = año + "-" + mes + "-" + dia;
        f = fechaSistema;
        asesoria.setFecha(fechaSistema);
        asesoria.setHora(horaSys + ":" + minuto);
        horaReal = horaSys + ":" + minuto;
    } else {
        asesoria.setFecha(fecha);
        asesoria.setHora(hora);
        f = fecha;
        horaReal = hora;
    }

    //Sacarlo del atributo session
    ICuenta cuenta = (ICuenta) session.getAttribute("usuario");
    String codDoc = cuenta.getNombre();
    asesoria.setCod_docente(codDoc);
    asesoria.setCod_est(codigoEst);
    asesoria.setTema(tema);
    asesoria.setGrupo(grupo);
    
    asesoria.setCod_m(codigoMateria);
    System.out.println("ASESORIA:: " + asesoria.toString());

    String rta = controlador.registrarAsesoria(asesoria);

    if (rta.equals("exito")) {
        String a[] = estudiante.split(" - ");
        String msg = "<tr>"
                + "<td align='center'>" + asesoria.getCod_docente() + "</td>"
                + "<td align='center'>" + nombreMateria + "</td>"
                + "<td align='center'>" + grupo + "</td>"
                + "<td align='center'>" + a[1] + "</td>"
                + "<td align='center'>" + a[0] + "</td>"
                + "<td align='center'>" + f + "</td>"
                + "<td align='center'>" + horaReal + "</td></tr>";
        out.print(msg);
    } else {
        out.print("error");
    }
%>

