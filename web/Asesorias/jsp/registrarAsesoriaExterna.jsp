<%-- 
    Document   : registrarAsesoriaExterna
    Created on : 12/12/2016, 02:34:29 PM
    Author     : DiegoLeal
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
<jsp:useBean id="asesoria" class="asesorias.DTO.Asesoria" scope="session"></jsp:useBean>
<%
    String codigoEst = new String(request.getParameter("codigoEst").getBytes("ISO-8859-1"), "UTF-8");
    String nombreEst = new String(request.getParameter("nombreEst").getBytes("ISO-8859-1"), "UTF-8");
    String fecha = new String(request.getParameter("fecha").getBytes("ISO-8859-1"), "UTF-8");
    String hora = new String(request.getParameter("hora").getBytes("ISO-8859-1"), "UTF-8");
    String codigoMat = new String(request.getParameter("codigoMat").getBytes("ISO-8859-1"), "UTF-8");
    String nombreMat = new String(request.getParameter("nombreMat").getBytes("ISO-8859-1"), "UTF-8");//
    String tema = new String(request.getParameter("tema").getBytes("ISO-8859-1"), "UTF-8");//
    
    asesoria.setCod_est(codigoEst);//
    asesoria.setFecha(fecha);//
    asesoria.setHora(hora);//
    asesoria.setCod_m(codigoMat);//
    asesoria.setTema(tema);//
    ICuenta cuenta = (ICuenta) session.getAttribute("usuario");
    String codDoc = cuenta.getNombre();
    asesoria.setCod_docente(codDoc);//
    
    String rta = facade.registrarAsesoriaExterna(asesoria);
    //String rta = "exito";
    if(rta.equals("exito")){
        out.print("exito");
    }else{
        out.print("error");
    }
%>
