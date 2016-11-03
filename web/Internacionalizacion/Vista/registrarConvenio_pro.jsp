<%-- 
    Document   : registroConvenio_pro
    Created on : 3/11/2016, 01:40:56 AM
    Author     : HeinerV
--%>

<%@page import="java.util.ArrayList"%>

<%@page import="internacionalizacion.Facade.Facade"%>
<%
    
String nombre=request.getParameter("nombre");
String descripcion=request.getParameter("descripcion");
String vigencia=request.getParameter("vigencia");
String tipo=request.getParameter("tipo_convenio");
String estado=request.getParameter("estado");
String fechacreacion =request.getParameter("fechacreacion");
String fechaterminacion=request.getParameter("fechaterminacion");
int entidad=Integer.parseInt(request.getParameter("entidad"));

ArrayList<String> a= new ArrayList<String>();

if(request.getParameter("movilidad")!=null){
    a.add(request.getParameter("movilidad"));
}
if(request.getParameter("pasantia")!=null){
    a.add(request.getParameter("pasantia"));
}
if(request.getParameter("extension")!=null){
    a.add(request.getParameter("extension"));
}


Facade f = new Facade();
String r = f.registrarConvenio(nombre,descripcion,vigencia,tipo,estado, fechacreacion,fechaterminacion,entidad,a);
request.getSession().setAttribute("respuesta_convenio", r);
%>

    
<%
response.sendRedirect("registrarConvenio.jsp");

%>