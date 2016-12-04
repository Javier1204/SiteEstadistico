<%-- 
    Document   : cambioEquipos
    Created on : 1/11/2016, 03:08:40 PM
    Author     : tuto2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% int numero = Integer.parseInt(request.getParameter("numero"));
    String modif = request.getParameter("modif");
    System.out.println(modif);
%>
<div align="center">
    <%if (modif.equals("1")) {


    %>
    <span>*las palabras claves separadas por punto y coma ( ; ) </span>
    <%                        }
    %>
    <table>
        <thead>
            <tr>
                <th data-field="numero">Numero</th>
                <th data-field="nombre">Nombre Proyecto</th>
                <th data-field="nombre">Nombre Equipo</th>
                    <%if (modif.equals("1")) {


                    %>
                <th data-field="keywords">Palabras claves</th>
                <th data-field="descripcion">Descripcion</th>

                <%                        }
                %>
            </tr>
        </thead>
        <%            for (int x = 0; x < numero; x++) {
        %>
        <tr>
            <td data-field="numero"><%=x + 1%></th>
            <td data-field="nombre"><input type="text" class="ufps-input" name="num_equipo<%=x%>"id="num_equipo<%=x%>" value="Proyecto <%=x + 1%>"></th>
                <td data-field="nombre"><input type="text" class="ufps-input" name="nom_equipo<%=x%>"id="nom_equipo<%=x%>" value="Equipo <%=x + 1%>"></th>
                <%if (modif.equals("1")) {


                %>
            <td data-field="keywords"><input type="text" class="ufps-input" name="keyword_<%=x%>"id="keywords_<%=x%>" ></th>
            <td data-field="descrpcion"><input type="text" class="ufps-input" name="descripcion_<%=x%>"id="descripcion_<%=x%>" ></th>

                <%                        }
                %>
        </tr>

        <% }%>

    </table>
    <input hidden="true" type="text" class="ufps-input" id="modif"name="modif" value="<%=modif%>">
    <div class="form-group">
        <button type="submit" class="ufps-btn">Registrar</button>
    </div>
</div>
