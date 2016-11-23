<%-- 
    Document   : listar_publicaciones
    Created on : 07-nov-2016, 17:51:03
    Author     : carlos
--%>


<%@page import="java.util.List"%>
<%@page import="Integrador.DTO.PublicacionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 
    
    ArrayList<PublicacionDTO> lista = (ArrayList<PublicacionDTO>) request.getAttribute("publicaciones") ;

%> 
<!DOCTYPE html>
  
<html>
    <head>
        <script src="Integrador/js/ajax.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Departamento de sistemas e Informática UFPS</title>
        <link href="public/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link href="public/css/ufps-estilo.css" rel="stylesheet">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/default.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/highlight.min.js"></script>
        <script src="public/js/ufps.js"></script>
    </head>
    <body>
        <header>
            <center> <img id="banner" src="public/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header>
        <div class="ufps-navbar  ufps-navbar-light" id="menuPrincipal">
            <div class="ufps-container">
                <div class="ufps-navbar-brand">
                    <div class="ufps-btn-menu" onclick="toggleMenu('menuPrincipal')">
                        <div class="ufps-btn-menu-bar"></div>
                        <div class="ufps-btn-menu-bar"></div>
                        <div class="ufps-btn-menu-bar"></div>
                    </div>
                    Site Estadístico
                </div>
                <div class="ufps-navbar-left">
                    <a href="GestorPublicaciones" class="ufps-navbar-btn">Home</a>


                </div>
                <div class="ufps-navbar-right">
                    <div class="ufps-navbar-corporate">

                        <a href="login.jsp" class="ufps-navbar-btn"> Iniciar sesion </a>

                    </div>
                </div>

            </div>
        </div>
        <div class="contenidopublicacion">
              <% for(PublicacionDTO p: lista){ %>
            <div id="contenidopublicacioncreada">
                <h2><%= p.getTitulo()%></h2> 
                <p><%= p.getContenido()%>
                    <br><br>
                    <% if(p.getInforme()!=null) { %>
                    <a href="<%= p.getInforme().getUrl() %>>"><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>
                    <% } %>
                </p>
            </div>
                <% } %>
          
            
            
        </div>

        <jsp:include page="../plantilla/footer.jsp"></jsp:include>
    </body>
</html>




