<%-- 
    Document   : index
    Created on : 16/12/2016, 07:10:17 AM
    Author     : Jordan
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    ICuenta cuenta=null;
    String codigo=null;
    
    if(session.getAttribute("usuario")!=null){
        cuenta=(ICuenta)session.getAttribute("usuario");
    }
    
    if(cuenta!=null){
        codigo=cuenta.getUser();
        boolean coordinador=cuenta.containRol("Coordinador practicas");
        boolean estudiante= cuenta.containRol("Estudiante");
        boolean administrador = cuenta.containRol("Administrador");
        boolean m=cuenta.containModulo("Practicas");
        
        if(coordinador || administrador){
             response.sendRedirect("index_1.jsp");
        }else if(estudiante){
             response.sendRedirect("index_estudiante.jsp");
        }else {
            %>
                Error: para ingresar a este modulo debe ser Administrador o Coordinador de practicas o Estudiante
            <%
        }
        
    }
    
%> 
