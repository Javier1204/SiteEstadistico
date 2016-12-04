<%-- 
    Document   : informacionProyecto
    Created on : 30/11/2016, 09:18:21 AM
    Author     : tuto2
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="academico.DTO.ProyectoDTO"%>
<%@page import="academico.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../plantilla/header.jsp"/>
<script type="text/javascript" src="jsEst/cambioForm.js"></script>

<body>

<% ICuenta cuenta = null;
    if (session.getAttribute("usuario") != null) {
        cuenta = (ICuenta) session.getAttribute("usuario");
        if (cuenta.containRol("Docente")) {
            response.sendRedirect("inicioDoc.jsp");
        } else if (!cuenta.containRol("Estudiante")) {
            response.sendRedirect("../index.jsp");
        }
    }else{
       response.sendRedirect("../index.jsp");
    }

%>
    <%Facade fachada = new Facade();
    %>
    <div class="ufps-container">
        <div class="ufps_row">
            <!--Aqui ingreso toda la informacion personal del docente-->
            <form align="center" name="formInformacionProyecto" 
                  id="formInformacionProyecto" action="javascript:modificar()" method="post">

                <h1 align="center">Modificar proyecto</h1>

                <% String id = request.getParameter("id");
                    String nombre = request.getParameter("nombre");
                    String keywords = request.getParameter("keywords");
                    String semilleros = request.getParameter("semillero");
                    String descripcion = request.getParameter("descripcion");


                %>
                <input hidden="true" type="number" class="ufps-input" id="id"name="id" value="<%=id%>">
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-6">
                    <div class="form-group">
                        <label for="nom_proyecto">Nombre proyecto</label>
                        <input type="text" class="ufps-input" id="nom_proyecto" value="<%=nombre%>">
                    </div>

                </div>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-6">
                    <div class="form-group">
                        <label for="keywords">Keywords</label>
                        <input type="text" class="ufps-input" id="keywords" value="<%=keywords%>">
                    </div>

                </div>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12">
                    <div class="form-group">
                        <label for="descripcion">Descripcion</label>
                    </div>
                </div>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12">
                    <div class="form-group">
                        <textarea class="form-control" rows="5" cols="100" id="descripcion"><%=descripcion%></textarea>
                    </div>
                </div>

                <br></br>
                <div class="form-group">
                    <button type="submit" class="ufps-btn">Modificar</button>
                </div>
            </form>
            <form align="center" name="formInicioProyectos2" 
                  id="formInicioProyectos2" action="registrarEquipos.jsp" method="post">
                <input hidden="true" type="number" class="ufps-input" id="num_equipos2"name="num_equipos2">
                <input hidden="true" type="number" class="ufps-input" id="cod_grupo"name="cod_grupo">
                <div id="equipos"class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12" >

                </div>
                <div id="div">

                </div>
            </form>
        </div>
    </div>
</body>
</html>