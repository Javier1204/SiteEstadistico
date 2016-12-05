<%-- 
    Document   : consultaEstudiantesMateria
    Created on : 7/11/2016, 07:06:40 PM
    Author     : DiegoLeal
--%>
<%@page import="asesorias.Controller.ControladorAsesorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String codigoMateria = request.getParameter("codigoMateria").toString();
    String grupo = request.getParameter("grupo").toString();
    
    
    System.out.println("codigoMateria:: " + codigoMateria + " grupo:: " + grupo);
    ControladorAsesorias controlador = new ControladorAsesorias();
    String rta = controlador.consultarEstudiantes(codigoMateria, grupo);
    System.out.println("Esta es la rta de la consulta de estudiantes:: " + rta);
    if(rta.isEmpty()){
        System.out.println("RTA:: " + rta);
        out.print("no");
    }else{
        out.print(rta);
    }
%>
