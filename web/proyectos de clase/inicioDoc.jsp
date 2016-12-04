<%-- 
    Document   : inicio
    Created on : 1/11/2016, 02:11:59 PM
    Author     : tuto2
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../plantilla/header.jsp"/>
<% ICuenta cuenta = null;
    if (session.getAttribute("usuario") != null) {
        cuenta = (ICuenta) session.getAttribute("usuario");
        if (cuenta.containRol("Estudiante")) {
            response.sendRedirect("inicioEst.jsp");
        } else if (!cuenta.containRol("Docente")) {
            response.sendRedirect("../index.jsp");
        }
    }else{
       response.sendRedirect("../index.jsp");
    }

%>
<div class="ufps-container" aling="center">

    <div class="ufps-row ">


        <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-6" >
            <div class="thumbnail">
                <img src="images/registro.png" alt="imagen registro" aling="center">
                <div class="caption">
                    <h3>Inicio de proyectos</h3>
                    <p>Modulo para crear equipos de trabajo para iniciar proyectos de clase</p>
                    <p><a href="iniciarProyectos.jsp" class="btn ufps-btn" role="button">Entrar</a></p>
                </div>
            </div>

        </div>
        <div class="ufps-col-mobile-12 ufps-col-tablet-12 ufps-col-netbook-6" aling="center">
            <div class="thumbnail">
                <img src="images/consulta.png" alt="imagen consulta" aling="center">
                <div class="caption">
                    <h3>Consultar proyectos</h3>
                    <p>Modulo de consulatar proyectos por el codigo de la materia</p>
                    <p><a href="consultarProyectosDoc.jsp" class="btn ufps-btn" role="button">Entrar</a></p>
                </div>
            </div>

        </div>

    </div>
</div>


</body>
</html>
