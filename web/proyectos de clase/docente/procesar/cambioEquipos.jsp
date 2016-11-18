<%-- 
    Document   : cambioEquipos
    Created on : 1/11/2016, 03:08:40 PM
    Author     : tuto2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% int numero = Integer.parseInt(request.getParameter("numero"));
%>
<div align="center">
    <table>
        <thead>
            <tr>
                <th data-field="numero">Numero</th>
                <th data-field="nombre">Nombre</th>
            </tr>
        </thead>
        <%
            for (int x = 0; x < numero; x++) {
        %>
        <tr>
            <td data-field="numero"><%=x + 1%></th>
            <td data-field="nombre"><input type="text" class="ufps-input" name="num_equipo<%=x%>"id="num_equipo<%=x%>" value="Equipo <%=x + 1%>"></th>

        </tr>

        <% }%>

    </table>
    <div class="form-group">
        <button type="submit" class="ufps-btn">Registrar</button>
    </div>
</div>
