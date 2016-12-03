<%-- 
    Document   : registrar_convenio_pro
    Created on : 6/11/2016, 10:09:39 AM
    Author     : Usuario
--%>


<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="internacionalizacion.Modelo.DTO.Tipo_actividades"%>
<%@page import="Practicas.DTO.convenioDTO"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.Facade.Facade"%>
<%
    
String idconvenio=request.getParameter("id");
String nombreConvenio=request.getParameter("nombre");
String descripcion=request.getParameter("descripcion");
String estado="Aprobado";
String fechainicio = request.getParameter("fechacreacion");
 String[] fecha1 = fechainicio.split("-");
String fechafin=request.getParameter("fechaterminacion");
String[] fecha2 = fechafin.split("-");
String fecha_radicacion=request.getParameter("fecha_radicacion");
int idempresa=Integer.parseInt(request.getParameter("entidad"));
String tipoConvenio="Especifico";
Calendar calendar1 = new GregorianCalendar(Integer.parseInt(fecha1[0]), Integer.parseInt(fecha1[1]), Integer.parseInt(fecha1[2])); 
Date f1 = new Date(calendar1.getTimeInMillis());
Calendar calendar2 = new GregorianCalendar(Integer.parseInt(fecha2[0]), Integer.parseInt(fecha2[1]), Integer.parseInt(fecha2[2])); 
Date f2 = new Date(calendar2.getTimeInMillis());
    
long diferencia = ( f2.getTime() - f1.getTime() ) / (1000 * 60 * 60 * 24);

int meses = (int) diferencia / 30;
    System.out.println(meses);
   
String vigencia = meses+"";
Facade f = new Facade();
convenioDTO p= new convenioDTO();
p.setIdconvenio(idconvenio);
p.setNombreConvenio(nombreConvenio);
p.setDescripcion(descripcion);
p.setVigencia(vigencia);
p.setEstado(estado);
p.setFechainicio(fechainicio);
p.setFechafin(fechafin);
p.setIdempresa(idempresa);
p.setFecha_radicacion(fecha_radicacion);
p.setTipoConvenio(tipoConvenio);
String r = f.registrarConvenio(p);//corralo

boolean [] actividades = new boolean [6];
actividades[5]=true;

Tipo_actividades act = new Tipo_actividades();
String id = f.consultarConvenio(nombreConvenio).getIdconvenio();
System.out.println("El id del convenio es------------------"+id);
act.setIdconvenio(id);
act.setPractica(actividades[5]);

f.RegistrarTipo_Actividades(act);





request.getSession().setAttribute("respuesta_convenio", r);
%>

    
<%
response.sendRedirect("registro_convenio.jsp");

%>
