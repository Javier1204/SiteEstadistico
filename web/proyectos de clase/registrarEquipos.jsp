<%-- 
    Document   : registrarEquipos
    Created on : 1/11/2016, 04:17:35 PM
    Author     : tuto2
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="academico.DTO.EstudianteDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="academico.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<jsp:include page="../plantilla/header.jsp"/>
<script type="text/javascript" src="jsDoc/cambioForm.js"></script>
<body>
    <% ICuenta cuenta = null;
        if (session.getAttribute("usuario") != null) {
            cuenta = (ICuenta) session.getAttribute("usuario");
            if (cuenta.containRol("Estudiante")) {
                response.sendRedirect("inicioEst.jsp");
            } else if (!cuenta.containRol("Docente")) {
                response.sendRedirect("../index.jsp");
            }
        } else {
            response.sendRedirect("../index.jsp");
        }

    %>
    <% Facade fachada = new Facade();

        int cod_grp = Integer.parseInt(request.getParameter("cod_grupo"));
        
        ArrayList<EstudianteDTO> lista = fachada.obtenerEstudiantes(cod_grp);
        int numero = Integer.parseInt(request.getParameter("num_equipos2"));
        String modif = request.getParameter("modif");
        String entregables = request.getParameter("entregables");
         String fecha = request.getParameter("fecha_max");
        int numero_pro = Integer.parseInt(request.getParameter("num_proyecto"));

        String[] equipos = new String[numero];
        ArrayList<String> equi = new ArrayList<String>();
        String[][] especi = new String[numero][3];
        String[] nom = new String[numero];
        System.out.println("hola" + numero_pro);
        for (int x = 0; x < numero; x++) {
            if (numero_pro == 1) {
                equipos[x] = request.getParameter("nom_equipo" + x);
                System.out.println("hola" + equipos[x]);
                equi.add(equipos[x]);
            } else {
                equipos[x] = request.getParameter("nom_equipo" + x);
                equi.add(equipos[x]);
            }
            if (numero_pro == 1) {
                especi[x][0] = request.getParameter("nombre_pro");
                especi[x][1] = request.getParameter("keywords_pro");
                especi[x][2] = request.getParameter("descripcion_pro");
            } else if (modif.equals("1")) {
                especi[x][0] = request.getParameter("num_equipo" + x);
                especi[x][1] = request.getParameter("keyword_" + x);
                especi[x][2] = request.getParameter("descripcion_" + x);
            } else {
                nom[x] = request.getParameter("num_equipo" + x);
            }
        }
        System.out.println("hola" + numero);
        int y[];
        if(numero_pro==1){
            y = fachada.registrarEquipoModificable(equi, especi, numero, cod_grp,entregables,fecha);
        }else if (modif.equals("0")) {
            y = fachada.registrarEquipos(equi, nom, cod_grp,entregables,fecha);
        } else {
            y = fachada.registrarEquipoModificable(equi, especi, numero, cod_grp, entregables,fecha);
            
        }
        int inicio = y[0] + 1;

    %>

</body>
<div class="ufps-container">
    <form align="center" name="formInicioProyectos" 
          id="formInicioProyectos" action="javascript:relacionar()" method="post">
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
                <%  int x = 0;
                    for (EstudianteDTO dto : lista) {

                %>
                <tr>
                    <td colspan="2" data-field="codigo" >
                        <input hidden="true" type="number" class="ufps-input" id="cod_est<%=x%>" value="<%=dto.getCodigo()%>">
                        <%=dto.getCodigo()%></td>
                    <td colspan="2" data-field="nombre"><%=dto.getNombre()%></td>
                    <td colspan="2" data-field="apellido"><%=dto.getApellido()%></td>
                    <td colspan="2" data-field="equipo">
                        <select name="codigo_equipo<%=x%>" id="codigo_equipo<%=x%>" class="ufps-input">

                            <%int s = inicio;

                                for (int n = 0; n < numero; n++) {

                            %>
                            <option value="<%=s + n%>"><%=equipos[n]%></option>
                            <%}
                            %>
                        </select>
                    </td>
                </tr>
                <%x++;
                    }
                %>
                <input hidden="true" type="number" class="ufps-input"value="<%=x%>" id="num_estu"name="num_estu">
            </table>
            <div class="form-group">
                <button type="submit"class="ufps-btn">Registrar</button>
            </div>
            <div id="divError">
            </div>
        </div>
    </form>
</div>
</html>
