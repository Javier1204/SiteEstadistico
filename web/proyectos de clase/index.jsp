<%-- 
    Document   : index
    Created on : 4/12/2016, 10:15:46 AM
    Author     : tuto2
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% ICuenta cuenta = null;
            if (session.getAttribute("usuario") != null) {
                cuenta = (ICuenta) session.getAttribute("usuario");
                if (cuenta.containRol("Docente")) {
                    response.sendRedirect("inicioDoc.jsp");
                } else if (cuenta.containRol("Estudiante")) {
                    response.sendRedirect("inicioEst.jsp");
                }else{
                    response.sendRedirect("../index.jsp");
                }
            }else {
                response.sendRedirect("../index.jsp");
            }
        %>

        
    </body>
</html>
