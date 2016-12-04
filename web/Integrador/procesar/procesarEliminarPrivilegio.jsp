<%-- 
    Document   : procesarEliminarPrivilegio
    Created on : 3/12/2016, 10:54:35 PM
    Author     : Lenovo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.DTOs.RequerimientosFDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.DTOs.PrivilegioDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%
    request.setCharacterEncoding("UTF-8");
    System.out.println("Entra");
    String rfs = request.getParameter("rfs");
    String modulo = request.getParameter("modulo");
    String rol = request.getParameter("rol");
    ArrayList<RequerimientosFDTO> listaRF = new ArrayList<RequerimientosFDTO>();
    if (rfs.isEmpty()) {
%>
<h2>no ha seleccionado ningun elemento</h2>
<%
        return;
    }
    for (String rf : rfs.split("-")) {
        RequerimientosFDTO rfDTO = new RequerimientosFDTO();
        rfDTO.setId(rf);
        listaRF.add(rfDTO);
    }
    ModuloDTO mod = new ModuloDTO();
    mod.setNombre(modulo);
    mod.setRequerimientos(listaRF);
    PrivilegioDTO p = new PrivilegioDTO();
    p.getModulos().add(mod);
    try {
        IGestionUsuarios gestor = GestionUsuario.getInstance();
        gestor.quitarPrivilegios(rol, p);
%>
<h2 class="ufps-text-center">cambio realizado</h2>
<%
    } catch (Exception ex) {
       %> 
       Ha ocurrido un error, por favor intente mas tarde
       <% 
    }
%>