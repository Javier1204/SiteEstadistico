<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="gruposinvestigacion.dto.Grupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="gruposinvestigacion.fachada.Fachade" id="fachada" scope="session"/>

<%
    ArrayList<Grupo> grupos = null;

    try {
        grupos = fachada.listarGrupos();

        for (Grupo grupo : grupos) {
%>
<div class="ufps-col-mobile-12 ufps-col-tablet-6">
    <h3 class="ufps-red">Nombre</h3>
</div>
<div class="ufps-col-mobile-12 ufps-col-tablet-6">
    <h4><%=grupo.getNombre() %></h4>
</div>
<%
    }
} catch (Exception e) {
%>
<h4>Ha Ocurrido un Error. <%=e.getMessage()%></h4>
<%
    }
%>