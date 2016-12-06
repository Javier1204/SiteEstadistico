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
    String vigencia = request.getParameter("vigencia");
    String estado = "Aprobado";
    String fechainicio = request.getParameter("fechainicio");
    String[] fecha1 = fechainicio.split("-");
    //String fechaterminacion = request.getParameter("fechaterminacion");
    //String[] fecha2 = fechaterminacion.split("-");
    System.out.println(fechainicio);
    
    Calendar calendar1 = new GregorianCalendar(Integer.parseInt(fecha1[0]), Integer.parseInt(fecha1[1]), Integer.parseInt(fecha1[2])); 
    //Date f1 = new Date(calendar1.getTimeInMillis());
    //Calendar calendar2 = new GregorianCalendar(Integer.parseInt(fecha2[0]), Integer.parseInt(fecha2[1]), Integer.parseInt(fecha2[2])); 
    //Date f2 = new Date(calendar2.getTimeInMillis());
    
    //long dias = ( f2.getTime() - f1.getTime() ) / (1000 * 60 * 60 * 24);
    
    calendar1.add(Calendar.MONTH, Integer.parseInt(vigencia));//para pasarle por meses
    //calendar1.add(Calendar.DAY_OF_YEAR, (int)(Integer.parseInt(vigencia)*30));//calcula la cantidad de dias de los meses
    //System.out.println(fecharadicacion);
    String fechaterminacion = calendar1.get(Calendar.YEAR)+"-"+calendar1.get(Calendar.MONTH)+"-"+calendar1.get(Calendar.DATE);     
    
    int entidad = Integer.parseInt(request.getParameter("entidad"));   
    
    //int meses = (int) diferencia / 30;
    //System.out.println(meses);
   
    //String vigencia = meses+"";
    boolean[] actividades = new boolean[6];

    if (request.getParameter(
            "movilidad") != null) {

        actividades[0] = true;
       System.out.print(actividades[0]);
    }

    if (request.getParameter(
            "pasantia") != null) {
        actividades[1] = true;
        System.out.print(actividades[1]);
    }

    if (request.getParameter(
            "extension") != null) {
        actividades[2] = true;
        System.out.print(actividades[2]);
    }

    if (request.getParameter(
            "investigacion") != null) {
        actividades[3] = true;
        System.out.print(actividades[3]);
    }

    if (request.getParameter(
            "social") != null) {
        actividades[4] = true;
        System.out.print(actividades[4]);
    }

    if (request.getParameter(
            "practica") != null) {
        actividades[5] = true;
       System.out.print(actividades[5]);
    }

    Facade f = new Facade();

    String r = f.registrarConvenio(radicado, nombre, descripcion, fecharadicacion, fechainicio, fechaterminacion, vigencia, estado, tipo, entidad);
    Tipo_actividades act = new Tipo_actividades();
    String id = f.consultarConvenio(radicado).getId();
System.out.println(r+" va la otra mrd");
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
System.out.println(r+" termino de registrar  la otra mrd");
    request.getSession().setAttribute("respuesta_convenio", r);
%>


<%
    response.sendRedirect("registrarConvenio.jsp");

%>