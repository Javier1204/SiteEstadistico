<%-- 
    Document   : asignarRoles
    Created on : 30/11/2016, 10:06:03 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String user = request.getParameter("usuario");
    String rol = request.getParameter("roles");
    String[] roles = rol.split("-");
    List<String> lista = Arrays.asList(roles);
    boolean exito = false;
    String mensaje = "";
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    List<String> noAsignados = gestor.asignarRoles(user, lista);
    if (noAsignados == null) {
%>
<h2>Ha ocurrido un error inesperado</h2>
<%
} else if (noAsignados.isEmpty()) {
%>
<h2>Se han asignado todos los roles seleccionados</h2>
<%
} else {
%>
<h2> los siguintes roles no se pudieron asignar</h2>
<p>
    <%
        for (String r : noAsignados) {
    %>
    <%=r%><br>
    <%
        }
    %>
</p>
<%
    }
%>