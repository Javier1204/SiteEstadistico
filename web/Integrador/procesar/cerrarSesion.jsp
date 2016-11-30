<%-- 
    Document   : cerrarSesion
    Created on : 14/10/2016, 03:03:30 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   session.setAttribute("usuario",null);
   response.sendRedirect("../login.jsp");
%>
