<%@page import="gruposinvestigacion.dto.Docente"%>
<%@page import="gruposinvestigacion.dto.TipoEstudio"%>
<%@page import="gruposinvestigacion.dto.Estudio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="gruposinvestigacion.fachada.Fachade" id="fachada" scope="session"/>

<%
    String titulo = request.getParameter("titulo");
    long idDocente = Long.parseLong(request.getParameter("idDocente"));
    long idTipo = Long.parseLong(request.getParameter("tipoEstudio"));

    TipoEstudio tipo = new TipoEstudio();
    tipo.setId(idTipo);
    Docente docente = new Docente();
    docente.setId(idDocente);
    Estudio estudio = new Estudio(titulo, tipo, docente);

    try {
        boolean registroExitoso = fachada.registrarEstudio(estudio);
%>
<script>
    alert("Registro Exitoso");
    window.location = "../docente/perfil.jsp";
</script>
<%
} catch (Exception e) {
%>
<script>
    alert(<%=e.getMessage()%>);
    window.location = "../docente/perfil.jsp";
</script>
<%
    }

%>