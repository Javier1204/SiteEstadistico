<%-- 
    Document   : procesarModificarModulo
    Created on : 11/12/2016, 09:38:39 AM
    Author     : Lenovo
--%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String modulo = request.getParameter("modulo");
    String descripcion = request.getParameter("descripcion");
    String url = request.getParameter("url");
    IGestionUsuarios gu = GestionUsuario.getInstance();
    boolean e = gu.modificarModulo(modulo, descripcion, url);
    if (!e) {
%><h3>no se pudo modificar</h3><%
    }else{
%><h3>modificación exitosa</h3><%
}
%>
