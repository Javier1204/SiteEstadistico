<%-- 
    Document   : listar_modulos
    Created on : 6/10/2016, 04:06:56 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.DTOs.RolDTO"%>
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
  ICuenta cuenta=null;
  if(session.getAttribute("usuario")==null){
      System.out.print("entro");
      response.sendRedirect("login.jsp");
      return;
  }else{
        cuenta= (ICuenta) session.getAttribute("usuario");
  }
  List<ModuloDTO> modulos = cuenta.listarModulos();
  

    
    
%>   
<script src="../public/js/ufps.js"></script>
        
        <div class="ufps-container ufps-fix-navbar-fixed">
            <br>
            <div class="ufps-col-mobile-12 ufps-col-tablet-3">
                <h4>   <a href="#componentes">Componentes</a> </h4>
                <% for(ModuloDTO mod : modulos){ %>
                <ul>
                    <li>
                        <a href="<%= mod.getUrl() %>"><%= mod.getNombre()%></a>
                    </li>
                </ul>
                <% } %>
            </div>
            <div class="ufps-col-mobile-12 ufps-col-tablet-9" id="componentes">
                <% for(ModuloDTO mod : modulos){ %>
                <section>
                        <h2><%=mod.getNombre()%></h2>
                        <p>
                            <%=mod.getDescripcion()%>
                        </p>
                </section>
                <% } %>
            </div>
        </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>