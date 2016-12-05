<%-- 
    Document   : cerrarSesion
    Created on : Nov 9, 2016, 7:51:52 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.invalidate();
    response.sendRedirect("../login.jsp");
%>