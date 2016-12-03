<%-- 
    Document   : editar_convenio_p
    Created on : 24/11/2016, 11:04:34 PM
    Author     : Usuario
--%>

<%@page import="Practicas.DTO.convenioDTO"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   
String idconvenio=request.getParameter("id");
String nombreConvenio=request.getParameter("nombre");
String descripcion=request.getParameter("descripcion");
String vigencia=request.getParameter("vigencia");
String estado=request.getParameter("estado");
String fechainicio = request.getParameter("fechaCreacion");
String fechafin=request.getParameter("fechaTerminacion");
String fecha_radicacion=request.getParameter("fecha_radicacion");
int idempresa=Integer.parseInt(request.getParameter("entidad"));

Facade f = new Facade();
convenioDTO p= new convenioDTO();
System.out.print(p.toString());

p.setIdconvenio(idconvenio);
p.setNombreConvenio(nombreConvenio);
p.setDescripcion(descripcion);
p.setVigencia(vigencia);
p.setEstado(estado);
p.setFechainicio(fechainicio);
p.setFechafin(fechafin);
p.setIdempresa(idempresa);
p.setFecha_radicacion(fecha_radicacion);
String r = f.editarConvenio(p);//corralo

request.getSession().setAttribute("respuesta_entidad", r);
%>

    
<%
response.sendRedirect("Editar_convenio.jsp?id=" + idconvenio);

%>
</html>
