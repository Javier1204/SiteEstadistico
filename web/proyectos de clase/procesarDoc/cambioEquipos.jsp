<%-- 
    Document   : cambioEquipos
    Created on : 1/11/2016, 03:08:40 PM
    Author     : tuto2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% int numero = Integer.parseInt(request.getParameter("numero"));
    System.out.println("fasfds");
    int num_proyec = Integer.parseInt(request.getParameter("num_proyec"));
    System.out.println("fasfds");
    String modif = request.getParameter("modif");
    System.out.println(modif);
%>
<div align="center">


    <% if (num_proyec == 1) {%>

    <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-3" >
        <div class="form-group">
            <label for="nombre_pro">Nombre proyecto</label>
            <input  type="text" class="ufps-input" id="nombre_pro"name="nombre_pro">
        </div>
    </div>
    <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-3" >
        <div class="form-group">
            <label for="keywords_pro">keywords</label>
            <input  type="text" class="ufps-input" id="keywords_pro"name="keywords_pro">
        </div>
    </div>
    <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-3" >
        <div class="form-group">
            <label for="descripcion_pro">Descripcion</label>
            <input  type="text" class="ufps-input" id="descripcion_pro"name="descripcion_pro">
        </div>
    </div>
    <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-3" >
        <div class="form-group">
            <label for="entregables">Entregables</label>
            <input  type="text" class="ufps-input" id="entregables"name="entregables">
        </div>
    </div>
    <span>*las palabras claves y los entregables separadas por punto y coma ( ; ) </span>
    <input hidden="true" type="text" class="ufps-input" id="num_proyecto"name="num_proyecto" value="1">

    <table>
        <thead>
            <tr>
                <th data-field="numero">Numero</th>

                <th data-field="nombre">Nombre Equipo</th>

            </tr>
        </thead>
        <%            for (int x = 0; x < numero; x++) {
        %>
        <tr>
            <td data-field="numero"><%=x + 1%></th>

            <td data-field="nombre"><input type="text" class="ufps-input" name="nom_equipo<%=x%>"id="nom_equipo<%=x%>" value="Equipo <%=x + 1%>"></td>

        </tr>

        <% }%>


        <%} else {
        %>
        <%if (modif.equals("1")) {


        %>
        <span>*las palabras claves y los entregables separadas por punto y coma ( ; ) </span>
        <%                        }
        %>
        <input hidden="true" type="text" class="ufps-input" id="num_proyecto"name="num_proyecto" value="0">
        <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12" align="center">

            <div class="form-group">
                <label for="entregables">Entregables</label>
                <input  type="text" class="ufps-input" id="entregables"name="entregables">
            </div>

        </div>
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
                <td data-field="nombre"><input type="text" class="ufps-input" name="num_equipo<%=x%>"id="num_equipo<%=x%>" value="Proyecto <%=x + 1%>"></td>
                <td data-field="nombre"><input type="text" class="ufps-input" name="nom_equipo<%=x%>"id="nom_equipo<%=x%>" value="Equipo <%=x + 1%>"></td>
                    <%if (modif.equals("1")) {


                    %>
                <td data-field="keywords"><input type="text" class="ufps-input" name="keyword_<%=x%>"id="keywords_<%=x%>" ></td>
                <td data-field="descrpcion"><input type="text" class="ufps-input" name="descripcion_<%=x%>"id="descripcion_<%=x%>" ></td>

                <%                        }
                %>
            </tr>

            <% }
                }%>

        </table>
        <input hidden="true" type="text" class="ufps-input" id="modif"name="modif" value="<%=modif%>">
        <div class="form-group">
            <button type="submit" class="ufps-btn">Registrar</button>
        </div>
</div>
