<%-- 
    Document   : cargarDatos_pro
    Created on : 16/12/2016, 06:46:52 AM
    Author     : Edna helen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String codigoDoc=request.getParameter("codigoSel");

    request.getSession().setAttribute("codigo",codigoDoc);
      response.sendRedirect("../observaciones.jsp");

%>
