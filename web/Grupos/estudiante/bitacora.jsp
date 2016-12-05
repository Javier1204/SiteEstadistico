<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : login
    Created on : Nov 4, 2016, 3:28:39 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
        <meta charset="utf-8">
        <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Metaetiqueta para la correcta visualización en dispositivos moviles-->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0">
        <title>Iniciar Sesión</title>
        <!--Añada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
        <link href="../css/ufps.min.css" rel="stylesheet">
        <!--Librerías para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script src="../js/ufps.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>        
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.12/datatables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.12/datatables.min.js"></script>
        <style>
            .encabezado{
                background-color: #D11414;
                color: #FFF;
            }
            
            .fila-activa{
                background-color: #F26D6D;
                color: #FFF;
            }
        </style>
    </head>
    <body>
        <div class="ufps-container">
            <jsp:include page="../assets/estudiante/menu.jsp" /> 
            <br>
            <br>

            <section>
                <div class="ufps-row">
                    <div class="ufps-black ufps-col-mobile-12 ufps-col-netbook-3">
                        <table class="ufps-table ufps-text-center">
                            <tr><td class="encabezado">Tipos de Producto</td></tr>
                            <tr>
                                <td class="fila-activa">Tipo de Producto 1</td>
                            </tr>
                            <%
                                for (int i = 2; i < 6; i++) {
                            %>
                            <tr>
                                <td>Tipo de Producto <%=i %></td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                    </div>
                    <div class="ufps-black ufps-col-mobile-12 ufps-col-netbook-9">
                        <h1 class="ufps-red ufps-text-center">Productos</h1>
                        <table id="productos" class="ufps-table ufps-text-center">
                            <thead>
                            <th>No.</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th colspan="2">Acción</th>
                            </thead>
   
                            <%
                                for (int i = 1; i < 6; i++) {
                            %>
                            <tr>
                                <td><%=i %></td>
                                <td>Producto <%=i %></td>
                                <td>Descripcíon del Producto <%=i %></td>
                                <td><a class="ufps-btn ufps-btn-yellow">Editar</a></td>
                                <td><a class="ufps-btn">Eliminar</a></td>
                            </tr>
                            <%
                                }
                            %>

                        </table>     
                    </div>
                </div>
            </section>            
            <jsp:include page="../assets/footer.jsp" /> 

            <script>
                $(document).ready(function () {
                    $('#productos').DataTable();
                });
            </script>
        </div>
    </body>
</html>
