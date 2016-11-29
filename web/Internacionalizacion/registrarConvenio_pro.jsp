<%-- 
    Document   : registroConvenio_pro
    Created on : 3/11/2016, 01:40:56 AM
    Author     : HeinerV
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="Internacionalizacion.Modelo.DTO.Tipo_actividades"%>
<%@page import="java.util.ArrayList"%>

<%@page import="Internacionalizacion.Facade.Facade"%>
<%
    request.setCharacterEncoding("UTF-8");
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    String radicado = request.getParameter("radicado");
    String tipo = request.getParameter("tipo_convenio");
    String fecharadicacion = request.getParameter("fecharadicacion");
    
    String estado = "Aprobado";
    String fechainicio = request.getParameter("fechainicio");
    String[] fecha1 = fechainicio.split("-");
    String fechaterminacion = request.getParameter("fechaterminacion");
    String[] fecha2 = fechaterminacion.split("-");
    
    
    Calendar calendar1 = new GregorianCalendar(Integer.parseInt(fecha1[0]), Integer.parseInt(fecha1[1]), Integer.parseInt(fecha1[2])); 
    Date f1 = new Date(calendar1.getTimeInMillis());
    Calendar calendar2 = new GregorianCalendar(Integer.parseInt(fecha2[0]), Integer.parseInt(fecha2[1]), Integer.parseInt(fecha2[2])); 
    Date f2 = new Date(calendar2.getTimeInMillis());
    
    long diferencia = ( f2.getTime() - f1.getTime() ) / (1000 * 60 * 60 * 24);
    
    System.out.println(fecharadicacion);
    
    int entidad = Integer.parseInt(request.getParameter("entidad"));   
    
    int meses = (int) diferencia / 30;
    System.out.println(meses);
   
    String vigencia = meses+"";
    boolean[] actividades = new boolean[6];

    if (request.getParameter(
            "movilidad") != null) {

        actividades[0] = true;
        //System.out.print(actividades[0]);
    }

    if (request.getParameter(
            "pasantia") != null) {
        actividades[1] = true;
        //System.out.print(actividades[1]);
    }

    if (request.getParameter(
            "extension") != null) {
        actividades[2] = true;
        //System.out.print(actividades[2]);
    }

    if (request.getParameter(
            "investigacion") != null) {
        actividades[3] = true;
        //System.out.print(actividades[3]);
    }

    if (request.getParameter(
            "social") != null) {
        actividades[4] = true;
        //System.out.print(actividades[4]);
    }

    if (request.getParameter(
            "practica") != null) {
        actividades[5] = true;
        //System.out.print(actividades[5]);
    }

    Facade f = new Facade();

    String r = f.registrarConvenio(radicado, nombre, descripcion, fecharadicacion, fechainicio, fechaterminacion, vigencia, estado, tipo, entidad);
    Tipo_actividades act = new Tipo_actividades();
    String id = f.consultarConvenio(nombre).getId();

    System.out.println(
            "El id del convenio es------------------" + id);
    act.setIdconvenio(id);

    act.setMovilidad(actividades[0]);
    act.setPasantia(actividades[1]);
    act.setExtension(actividades[2]);
    act.setInvestigacion(actividades[3]);
    act.setSocial(actividades[4]);
    act.setPractica(actividades[5]);

    f.RegistrarTipo_Actividades(act);

    request.getSession().setAttribute("respuesta_convenio", r);
%>


<%
    response.sendRedirect("registrarConvenio.jsp");

%>