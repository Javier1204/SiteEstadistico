<%-- 
    Document   : registrarEntidad_pro
    Created on : 29/10/2016, 04:02:31 PM
    Author     : HeinerV

esta clase es temporal 
--%>


<%@page import="facade.facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    
String nombre=request.getParameter("nombre");
String representante=request.getParameter("representante");
String sector=request.getParameter("sector");
String ambito=request.getParameter("ambito");
String tipo=request.getParameter("tipo");
int telefono =Integer.parseInt(request.getParameter("telefono"));
String pais=request.getParameter("pais");

facade f = new facade();
String r = f.registrarEntidad(nombre);
%>
<script type="text/javascript">
    alert("<%= r %>");
</script>
    
<%
response.sendRedirect("registrarEntidad.jsp");

%>