<%-- 
    Document   : RegistrarEmpresa_p
    Created on : 5/11/2016, 04:47:46 PM
    Author     : Usuario
--%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Practicas.DTO.empresaDTO"%>
<!DOCTYPE html>
<%
   
String nombreEmpresa=request.getParameter("nombres");
String NIT=request.getParameter("nit");
String sectorEmpresa=request.getParameter("actEmpresa");
String tipoAmbito=request.getParameter("tipoEmpresa");
String telefono =request.getParameter("telefono");
String direccion=request.getParameter("tipo");
Facade f = new Facade();
empresaDTO p= new empresaDTO();

p.setNombreEmpresa(nombreEmpresa);
p.setNIT(NIT);
p.setSectorEmpresa(sectorEmpresa);
p.setTipoAmbito(tipoAmbito);
p.setTelefono(telefono);
p.setDireccion(direccion);
String r = f.registrarEmpresa(p);//corralo
request.getSession().setAttribute("respuesta_entidad", r);
%>

    
<%
response.sendRedirect("registro_empresas.jsp");

%>