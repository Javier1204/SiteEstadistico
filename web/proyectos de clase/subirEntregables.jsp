<%-- 
    Document   : subirEntregables
    Created on : 30/11/2016, 09:18:35 AM
    Author     : tuto2
--%>

<%@page import="academico.DTO.EntregableDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="academico.Facade.Facade"%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../plantilla/header.jsp"/>

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
            <form  name="formInicioProyectos" 
                  id="formInicioProyectos" action="procesarEst/cargarArchivo.jsp" enctype="multipart/form-data" method="post">

                <h1 align="center">Subir entregable</h1>
                <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12">
                    <span> Subir los siguientes archivos en un .rar y como nombre el proyecto con los codigos de los estudiantes<p></p>
                        <% Facade fachada = new Facade();
                        String info = fachada.obtenerTipoEntregable(Integer.parseInt(id));
                        String[] output = info.split("\\;");
                        for(int x= 0; x<output.length;x++){
                            %>
                            <%="* "+ output[x]%><p></p>
                            <%}
                            %>
                    </span>
                </div>
                
                <div align="center" class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12">
                    <div class="form-group">
                        <label for="file"class="control-label">Seleccione un archivo</label>
                        <input id="file" name="file" type="file" class="ufps-input ">
                    </div>

                </div>
                
                <input hidden="true" type="number" class="ufps-input" id="id_pro"name="id_pro" value="<%=id%>">
                <br></br>
                <div align="center" class="form-group">
                    <button type="submit" class="ufps-btn">Subir</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
