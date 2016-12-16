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
        boolean m=cuenta.containModulo("Practicas");
        
        if(coordinador){
             response.sendRedirect("index_1.jsp");
        }
        if(estudiante){
             response.sendRedirect("index_estudiante.jsp");
        }
        
    }
    
%> 
