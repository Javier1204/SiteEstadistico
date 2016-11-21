<%-- 
    Document   : registrar_convenio_pro
    Created on : 6/11/2016, 10:09:39 AM
    Author     : Usuario
--%>


<%@page import="Practicas.DTO.convenioDTO"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>

<%@page import="Practicas.Facade.Facade"%>
<%
    
String nombreConvenio=request.getParameter("nombre");
String descripcion=request.getParameter("descripcion");
String vigencia=request.getParameter("vigencia");
String estado=request.getParameter("estado");
String fechainicio = request.getParameter("fechacreacion");
String fechafin=request.getParameter("fechaterminacion");
int idempresa=Integer.parseInt(request.getParameter("entidad"));



Facade f = new Facade();
convenioDTO p= new convenioDTO();
p.setNombreConvenio(nombreConvenio);
p.setDescripcion(descripcion);
p.setVigencia(vigencia);
p.setEstado(estado);
p.setFechainicio(fechainicio);
p.setFechafin(fechafin);
p.setIdempresa(idempresa);
String r = f.registrarConvenio(p);//corralo

request.getSession().setAttribute("respuesta_convenio", r);
%>

    
<%
response.sendRedirect("registro_convenio.jsp");

%>
