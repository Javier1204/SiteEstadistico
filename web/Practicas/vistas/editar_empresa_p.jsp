<%-- 
    Document   : editar_empresa_p
    Created on : 23/11/2016, 09:41:02 AM
    Author     : Usuario
--%>

<%@page import="Practicas.DTO.empresaDTO"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   
String nombreEmpresa=request.getParameter("nombres");
String NIT=request.getParameter("nit");
String sectorEmpresa=request.getParameter("actEmpresa");
String tipoAmbito=request.getParameter("tipoEmpresa");
String telefono =request.getParameter("telefono");
String direccion=request.getParameter("direccion");

Facade f = new Facade();
empresaDTO p= new empresaDTO();
System.out.print(p.toString());

p.setNombreEmpresa(nombreEmpresa);
p.setNIT(NIT);
p.setSectorEmpresa(sectorEmpresa);
p.setTipoAmbito(tipoAmbito);
p.setTelefono(telefono);
p.setDireccion(direccion);
String r = f.editarEmpresa(p);//corralo

request.getSession().setAttribute("respuesta_entidad", r);
%>

    
<%
response.sendRedirect("editar_empresa.jsp?nit=" + NIT);

%>
</html>
