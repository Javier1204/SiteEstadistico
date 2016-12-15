<%-- 
    Document   : generarInforme
    Created on : 1/12/2016, 07:23:32 AM
    Author     : DiegoLeal
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
<%
    String periodo = request.getParameter("periodo").toString();
    String ano = request.getParameter("ano").toString();
    
    //Consultar cantidad de asesorias por docente
    //cantidad Asesorias, nombre, apellido, codigo docente, tipo vinculacion
    ICuenta cuenta = (ICuenta) session.getAttribute("usuario");
    String codDoc = cuenta.getNombre();
    String cantAsesoriasDocente = facade.consultarCantAsesoriasDocente(codDoc, periodo, ano);
    System.out.println("cantidad de asesorias por docente: " + cantAsesoriasDocente);
    System.out.println("periodo: " + periodo + " año: " + ano);
    
    //consultar asesorias por materias
    //cantidad de asesorias, codigo de la materia, nombre de la materia, grupo
    String maxAsesoDoc = facade.consultarAsesoriasMaterias(periodo, ano);
    System.out.println("Cantidad de asesorias por materia:: " + maxAsesoDoc);
    
    //consultar cantidad de estudiantes por materia
    //nombre materia, codigo materia, grupo, cantidad asesorias.
    String cantEstMateria = facade.consultarEstudiantesMateria(periodo, ano);
    System.out.println("cantidad de estudiantes que asistieron a asesoria: " + cantEstMateria);
    
    out.print(cantAsesoriasDocente + "$" + maxAsesoDoc + "$" + cantEstMateria);
    
%>