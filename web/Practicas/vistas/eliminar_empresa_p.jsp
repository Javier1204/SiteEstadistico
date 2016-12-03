<%-- 
    Document   : eliminar_empresa_p
    Created on : 23/11/2016, 08:14:30 AM
    Author     : Usuario
--%>

<%@page import="Practicas.DTO.empresaDTO"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   

String NIT=request.getParameter("nit");

Facade f = new Facade();
empresaDTO p= new empresaDTO();

p.setNIT(NIT);

String r = f.eliminarEmpresa(NIT);//corralo
request.getSession().setAttribute("respuesta_eliminar_entidad", r);
%>

    
<%
response.sendRedirect("mostrar_empresa.jsp");

%>
