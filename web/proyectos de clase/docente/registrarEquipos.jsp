<%-- 
    Document   : registrarEquipos
    Created on : 1/11/2016, 04:17:35 PM
    Author     : tuto2
--%>

<%@page import="academico.DTO.EstudianteDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="academico.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../plantilla/docente/header.jsp"/>
<body>
    <% Facade fachada = new Facade();
    int cod_grp = Integer.parseInt(request.getParameter("cod_grupo"));
     ArrayList<EstudianteDTO> lista = fachada.obtenerEstudiantes(cod_grp);
        int numero = Integer.parseInt(request.getParameter("num_equipos2"));
        String[] equipos = new String[numero];
        ArrayList<String> equi = new ArrayList<String>();
        for (int x = 0; x < numero; x++) {
            equipos[x] = request.getParameter("num_equipo" + x);
            equi.add("num_equipo" + x);
        }
        int y[] = fachada.registrarEquipos(equi);
        int inicio = y[0] + 1;
        
    %>
    
</body>
<div class="ufps-container">
    <div align="center" class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12">
        <h1 align="center">Seleccionar equipos a estudiantes</h1>
        <table class="ufps-table">
            <thead>
                <tr>
                    <th colspan="2" data-field="codigo">Codigo</th>
                    <th colspan="2" data-field="nombre">Nombre</th>
                    <th colspan="2" data-field="apellido">Apellido</th>
                    <th colspan="2" data-field="equipo">Seleccione equipo</th>

                </tr>
            </thead>
            <%
                for (EstudianteDTO dto :lista) {
                    
            %>
            <tr>
                <td colspan="2" data-field="codigo"><%=dto.getCodigo()%></td>
                <td colspan="2" data-field="nombre"><%=dto.getNombre()%></td>
                <td colspan="2" data-field="apellido"><%=dto.getApellido()%></td>
                <td colspan="2" data-field="equipo">
                    <select id="grupos" name="" id="equipos<%=dto.getCodigo()%>" class="ufps-input">
                        <option disabled="true">Selecione un equipo</option>
                        <%int s = inicio;
                        
                            for (int n = 0; n < numero; n++) {
                                 
                        %>
                        <option value="<%=s + n%>"><%=equipos[n]%></option>
                        <%}
                        %>
                    </select>
                </td>
            </tr>
            <%}
            %>
        </table>
        <div class="form-group">
            <button onclick=" location.href='inicio.jsp' "class="ufps-btn">Registrar</button>
        </div>
    </div>
</div>
</html>
