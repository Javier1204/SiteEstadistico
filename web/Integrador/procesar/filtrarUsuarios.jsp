<%-- 
    Document   : filtrarUsuarios
    Created on : 14/12/2016, 08:22:57 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.DTOs.UsuarioDTO"%>
<%@page import="java.util.List"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String clave= request.getParameter("rol");
    System.out.println(clave);
    boolean exito=false;
    IGestionUsuarios gestor = GestionUsuario.getInstance();
    List<UsuarioDTO> usuarios= gestor.filtrar(clave);
    if(!usuarios.isEmpty()){
        exito=true;
    }
    if(exito){
%>
<table class="ufps-table" cellspacing="0" width="100%">
            <thead>
                <tr>

                    <th>Nombre usuario</th>
                    <th>Constraseña</th>
                    <th>Acción</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
            <% for (UsuarioDTO dto : usuarios) {
                UsuarioDTO dto1 = gestor.obtenerUsuario(dto.getUssername());
            %>
            <tr>
                <td><center><%= dto1.getUssername()%></center></td>
        <td><center><%= dto1.getPassword()%></center></td>
        <td><center><a href="modificarUsuario.jsp?user=<%=dto1.getUssername()%>&password=<%=dto1.getPassword()%>">Modificar</a></center> </td>
        <td><center><a href="procesar/eliminarUsuario.jsp?user=<%=dto1.getUssername()%>&password=<%=dto1.getPassword()%>">Eliminar</a></center> </td>
        </tr>
        <% }%>
        </tbody>
    </table>
<% } else{ %>
<table class="ufps-table" cellspacing="0" width="100%">
            <thead>
                <tr>

                    <th>Nombre usuario</th>
                    <th>Constraseña</th>
                    <th>Acción</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
            
            <tr>
                <td colspan="4"><center> No existen usuarios</center></td>
            </tr>
        </tbody>
    </table>
<% }%>