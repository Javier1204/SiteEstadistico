<%-- 
    Document   : subirEntregables
    Created on : 30/11/2016, 09:18:35 AM
    Author     : tuto2
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../plantilla/header.jsp"/>
<script type="text/javascript" src="js/cambioForm.js"></script>
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
    <% String id = request.getParameter("proyecto");
    %>
    <div class="ufps-container">
        <div class="ufps_row">
            <!--Aqui ingreso toda la informacion personal del docente-->
            <form align="center" name="formInicioProyectos" 
                  id="formInicioProyectos" action="procesarEst/cargarArchivo.jsp" enctype="multipart/form-data" method="post">

                <h1 align="center">Subir entregable</h1>


                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12">
                    <div class="form-group">
                        <label for="file"class="control-label">Seleccione un archivo</label>
                        <input id="file" name="file" type="file" class="ufps-input ">
                    </div>

                </div>
                
                <input hidden="true" type="number" class="ufps-input" id="id_pro"name="id_pro" value="<%=id%>">
                <br></br>
                <div class="form-group">
                    <button type="submit" class="ufps-btn">Subir</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
