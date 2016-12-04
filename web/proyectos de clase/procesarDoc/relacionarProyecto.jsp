<%-- 
    Document   : relacionarProyecto
    Created on : 30/11/2016, 03:19:38 PM
    Author     : tuto2
--%>

<%@page import="academico.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% int numero = Integer.parseInt(request.getParameter("numero"));
    String[][] especi = new String[numero][2];
    for (int x = 0; x < numero; x++) {

        especi[x][0] = request.getParameter("cod_est" + x);
        especi[x][1] = request.getParameter("cod_equipo" + x);

    }
    Facade fachada = new Facade();
    fachada.asignarEstudianteAEquipo(especi);
    
%>
<%="1"%>