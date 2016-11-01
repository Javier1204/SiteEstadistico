<%-- 
    Document   : listar_modulos
    Created on : 6/10/2016, 04:06:56 PM
    Author     : javie
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<%
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  List<ModuloDTO> modulos = gestor.listarModulo();
%>   
    <div class="ufps-container ufps-fix-navbar-fixed">
        <div class="ufps-col-mobile-12 ufps-col-tablet-3">
            <h4>   <a href="#componentes">Componentes</a> </h4>
            <% for(ModuloDTO mod : modulos){ %>
            <ul>
                <li>
                    <a href=""><%= mod.getNombre()%></a>
                </li>
            </ul>
                <% } %>
        </div>
        <div class="ufps-col-mobile-12 ufps-col-tablet-9" id="componentes">
            <% for(ModuloDTO mod : modulos){ %>
            <section>
                <div id="titulo">
                    <h2><%=mod.getNombre()%></h2>
                    <p>
                        <%=mod.getDescripcion()%>
                    </p>
                </div>    
            </section>
                    <% } %>
        </div>
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>