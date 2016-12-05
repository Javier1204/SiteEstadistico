<%-- 
    Document   : registrarPonente
    Created on : 26/11/2016, 10:41:21 PM
    Author     : WILSON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          String cedula= request.getParameter("cedula");
          String nombre = request.getParameter("nombre");
          String apellido = request.getParameter("apellido");
          String nivel = request.getParameter("nivel");
          String vinculacion = request.getParameter("vinculacion");
          String correo = request.getParameter("correo");  
        %>
    </body>
</html>
