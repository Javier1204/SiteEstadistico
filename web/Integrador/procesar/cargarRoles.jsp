<%-- 
    Document   : cargarRoles
    Created on : 30/11/2016, 09:17:28 PM
    Author     : javie
--%>

<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.DTOs.RolDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String user = request.getParameter("nombre_usuario");
    boolean exito = false;
    String mensaje = "";
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    List<RolDTO> rolesSi = gestor.cargarRolesUsuario(user);
    System.out.println(rolesSi);
    if (rolesSi == null) {
        System.out.println("Entro al null");
%>
EL usuario no existe
<%
    return;
} else if (rolesSi.isEmpty()) {
%>
<h3>No tiene ningun rol asignado</h3>
<%
} else {
%>
<table id="table" class="ufps-table ufps-table-inserted ufps-text-left">
    <thead>
    <th>SELECCÓN</th>
    <th>ROL</th>
    <th>DESCRIPCIÓN</th>
</thead>
<%
    for (int i = 0; i < rolesSi.size(); i++) {
%>
<tr>
    <td> <center><input style="width: 40px;" type="checkbox" name="checkRolE" id="<%=rolesSi.get(i).getRol()%>"/></center></td>
<td><p><%=rolesSi.get(i).getRol()%></p></td>
<td><p><%=rolesSi.get(i).getDescripcion()%></p></td>
</tr> 
<% }%>
</table>

<%
    }
%>

<center>
    <div class="ufps-btn-group">
        <button onclick="javascript:cargarNoRolUsuario()" class="ufps-btn ufps-btn-green acomodarBtn" >Asignar nuevo rol</button>
        <button onclick="javascript:quitaRoles('<%=user%>')" class="ufps-btn acomodarBtn" >Quitar seleccionados</button>
    </div>
</center>