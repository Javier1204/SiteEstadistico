<%@page import="java.sql.SQLException"%>
<%@page import="gruposinvestigacion.dto.Grupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="gruposinvestigacion.fachada.Fachade" id="fachada" scope="session"/>

<%
    String codigoColciencias = request.getParameter("codigoColciencias");

    try {
        Grupo grupo = new Grupo();
        grupo.setCodigoColciencias(codigoColciencias);
        fachada.eliminarGrupo(grupo);
%>
<%="Grupo Eliminado Correctamente."%>
<%
} catch (SQLException e) {
%>
<%="Error." + e.getMessage()%>
<%
} catch (Exception e) {
%>
<%="Error." + e.getMessage()%>
<%
    }
%>