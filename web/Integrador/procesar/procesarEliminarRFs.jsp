<%-- 
    Document   : procesarEliminarRFs
    Created on : 9/12/2016, 09:16:44 PM
    Author     : Lenovo
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");
    String rfs = request.getParameter("rfs");

    List<String> listaRF = new ArrayList<String>();
    for (String rf : rfs.split("-")) {
        listaRF.add(rf);
    }

    String modulo = request.getParameter("modulo");
    IGestionUsuarios gu = GestionUsuario.getInstance();
    List<String> noEliminados = gu.elimnarRFs(modulo, listaRF);

    if (noEliminados.isEmpty()) {
%>
<h4 class="text-center"> Se han eliminado todo los requerimientos seleccionados</h4>
<%
} else {
%>
<h4 class="text-center">no se han podido eliminar los siguientes RF</h4>
<p>
    <%for (String rf : noEliminados) {%><%=rf%><br><%}%>
</p>
<%
    }
%>
