<%-- 
    Document   : inicio
    Created on : 30/11/2016, 10:12:25 AM
    Author     : tuto2
--%>

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
    <div class="ufps-container" aling="center">

        <div class="ufps-row ">



            <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-12" >
                <div class="thumbnail" aling="center">
                    <center>
                    <img src="images/consulta.png" alt="imagen consulta" aling="center">
                        <div class="caption">
                            <h3>Consultar proyectos</h3>
                            <p>Modulo de consulatar proyectos por el codigo de la materia</p>
                            <p><a href="consultarProyectosEst.jsp" class="btn ufps-btn" role="button">Entrar</a></p>
                        </div>
                    </center>
                </div>

            </div>

        </div>
    </div>


</body>
</html>

