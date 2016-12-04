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
    System.out.println("Entra");
    String user = request.getParameter("nombre_usuario");
    boolean exito = false;
    String mensaje = "";
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    List<RolDTO> rolesSi = gestor.cargarRolesUsuario(user);
    List<RolDTO> roles = gestor.listarRoles();
    for (int i = (roles.size() - 1); i >= 0; i--) {
        boolean e = false;
        for (RolDTO rol : rolesSi) {
            if (rol.getRol().equalsIgnoreCase(roles.get(i).getRol())) {
                e = true;
            }
        }
        if (e) {
            roles.remove(roles.get(i));
        }
    }
    if (!rolesSi.isEmpty()) {
        exito = true;
    } else {
        mensaje = "2";
    }
    if (exito) {
%>

<label> Rol </label>
<table id="table" class="ufps-table ufps-table-inserted ufps-text-left">
    <thead>
    <th>SELECCÓN</th>
    <th>ROL</th>
    <th>DESCRIPCIÓN</th>
</thead>
<% for (int i = 0; i < rolesSi.size(); i++) {%>
<tr>
    <td> <center><input style="width: 40px;" checked="true" type="checkbox" name="checkRol" id="<%=rolesSi.get(i).getRol()%>"/></center>  </td>
<td><p><%=rolesSi.get(i).getRol()%></p></td>
<td><p><%=rolesSi.get(i).getDescripcion()%></p></td>
</tr> 
<% }%>
<% if (!roles.isEmpty()) {
        for (int i = 0; i < roles.size(); i++) {%>
<tr>
    <td><center> <input style="width: 40px;" type="checkbox" name="checkRol" id="<%=roles.get(i).getRol()%>"/></center></td>
<td><p><%=roles.get(i).getRol()%></p></td>
<td><p><%=roles.get(i).getDescripcion()%></p></td>
</tr> 
<% }
    }%>
</table>   
<% } else {%>
<%= mensaje%>
<% }%>