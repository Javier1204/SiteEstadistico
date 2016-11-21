<%-- 
    Document   : registrar_tutor_pro
    Created on : 6/11/2016, 10:16:46 PM
    Author     : Usuario
--%>

<%@page import="Practicas.DTO.tutor_empresaDTO"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   
String nombreTutor=request.getParameter("nombres");
String telefono=request.getParameter("telefono");
String cargo=request.getParameter("cargo");
String email=request.getParameter("email");
Facade f = new Facade();
tutor_empresaDTO p= new tutor_empresaDTO();

p.setNombreTutor(nombreTutor);
p.setTelefono(telefono);
p.setCargo(cargo);
p.setEmail(email);
String r = f.registrarTutor(p);//corralo
request.getSession().setAttribute("respuesta_tutor_pro", r);
%>

    
<%
response.sendRedirect("registro_Tutor.jsp");

%>