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

boolean [] actividades = new boolean [6];

if(request.getParameter("movilidad")!=null){
    actividades[0]=true;
}
if(request.getParameter("pasantia")!=null){
    actividades[1]=true;
}
if(request.getParameter("extension")!=null){
    actividades[2]=true;
}
if(request.getParameter("investigacion")!=null){
    actividades[3]=true;
}
if(request.getParameter("social")!=null){
    actividades[4]=true;
}
if(request.getParameter("practica")!=null){
    actividades[5]=true;
}


Facade f = new Facade();
String r = f.registrarConvenio(nombre,descripcion,vigencia,tipo,estado, fechacreacion,fechaterminacion,entidad,actividades);
request.getSession().setAttribute("respuesta_convenio", r);
%>

    
<%
response.sendRedirect("registrarConvenio.jsp");

%>