<%@page import="gruposinvestigacion.dto.Integrante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="fachada" class="gruposinvestigacion.fachada.Fachade" scope="session" ></jsp:useBean>
<%
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String contrasena = request.getParameter("contrasena");
    
    Integrante i = fachada.getUsuario();
    i.setNombre(nombre);
    i.setApellido(apellido);
    if(contrasena!=null){
        if(!contrasena.isEmpty()){
            i.setContrasena(contrasena);
        }
    }
    
    try{
        fachada.editarIntegrante(i);
%>
<script>
    alert("Datos Actualizados");
    window.location = "../admin/perfil.jsp";
</script>
<%
}catch(Exception e){
        %>
<script>
    alert("No se pudo actualizar los datos. <%=e.getMessage() %>");
    window.location = "../admin/perfil.jsp";
</script>
<%
    }
%>