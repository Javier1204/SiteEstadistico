<%-- 
    Document   : registrarActividad
    Created on : 26/11/2016, 10:04:08 PM
    Author     : WILSON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actividades Formacion-Registrar Actividades</title>
    </head>
    <body>
        <%    
          String nombre = request.getParameter("nombre");
          String ponente = request.getParameter("ponente"); 
          String convenio = request.getParameter("convenio"); 
          String tipo = request.getParameter("tipo"); 
          String fechainicio = request.getParameter("fechainicio"); 
          String fechafin = request.getParameter("horafin"); 
          String lugar = request.getParameter("lugar");          
          String organizador = request.getParameter("organizador");   
        %>
    </body>
</html>
