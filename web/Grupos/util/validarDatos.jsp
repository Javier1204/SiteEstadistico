<%-- 
    Document   : validarDatos
    Created on : Nov 9, 2016, 7:14:44 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="gruposinvestigacion.fachada.Fachade" id="fachada" scope="session"/>

<%
    String codigo = request.getParameter("codigo");
    String contrasena = request.getParameter("contrasena");
    
    boolean esValido = fachada.login(codigo, contrasena);
    
    if(esValido){
        short tipo = fachada.getUsuario().getTipo();
        String ruta = "";
        
        switch(tipo){
            case 1:
                ruta="admin/perfil.jsp";
                break;
            case 2:
                ruta="docente/perfil.jsp";
                break;
            case 3:
                ruta="estudiante/perfil.jsp";
                break;
        }
        
        response.sendRedirect("../"+ruta);
    }else{
        response.sendRedirect("../login.jsp");
    }
%>