<%-- 
    Document   : registrarActividad_pro
    Created on : 2/11/2016, 03:47:39 PM
    Author     : JAVIER
--%>


<%@page import="internacionalizacion.Modelo.DTO.Actividad_Estudiante"%>
<%@page import="internacionalizacion.Modelo.DTO.Convenio"%>
<%@page import="internacionalizacion.Modelo.DAO.DAOConvenio"%>
<%@page import="internacionalizacion.Modelo.DTO.Actividad"%>
<%@page import="internacionalizacion.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");    
String convenio = request.getParameter("convenio");
System.out.println("Codigo de convenio es: "+convenio);
String nombre = request.getParameter("nombre");
String duracion = request.getParameter("duracion");
String creacion = request.getParameter("creacion");
String terminacion =request.getParameter("terminacion");
short semestre =Short.parseShort(request.getParameter("semestre"));
String hora=request.getParameter("hora");
String responsable = request.getParameter("responsable");
String tipoactividad = request.getParameter("tipoactividad");
String lugar = request.getParameter("lugar"); 
String descripcion = request.getParameter("descripcion");

Facade f = new Facade();
Actividad a = new Actividad();
a.setNombre(nombre);
a.setDescripcion(descripcion);
a.setDuracion(duracion);
a.setIdconvenio(convenio);
a.setHora(hora);
a.setLugar(lugar);
a.setResponsable(responsable);
a.setTipoactividad(tipoactividad);
a.setFechacreacion(creacion);
a.setFechaterminacion(terminacion);
a.setSemestre(semestre);
boolean registro = f.RegistrarActividad(a);


//Codigo para el registro de los estudiantes, se debe recorrer el array gracias a request parameter
//dado por el name del input y se debe enviar por POST los datos de los estudiantes???
//String [] estudiantes = request.getParameterValues("estudiante");
Actividad_Estudiante act = null;
String [] est = request.getParameterValues("estudiantes");
Actividad actividad = f.consultarActividad_By_IDConvenio(convenio);
System.out.println("El id de la actividad es: "+actividad.getId());
int idactividad = actividad.getId();

for(String cod: est){
     act = new Actividad_Estudiante();
     act.setCodigoestudiante(cod);         
     act.setIdactividad(idactividad);
     
     f.RegistrarActividad_Estudiante(act);
}



request.getSession().setAttribute("respuesta_actividad", registro);
response.sendRedirect("registrarActividad.jsp");

%>

