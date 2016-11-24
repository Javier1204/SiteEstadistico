<%-- 
    Document   : consultarConvenios
    Created on : 8/11/2016, 12:59:53 AM
    Author     : JAVIER
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="internacionalizacion.Modelo.DTO.Convenio"%>
<%@page import="internacionalizacion.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../public/css/ufps-estilo.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/ufps.css" rel="stylesheet" type="text/css"/>               
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>      
        <link href="css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>
        <script src="../public/js/ufps.js" type="text/javascript"></script>
        
        
        <!--LibrerÃ­as para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!--Algunos componentes requieren el uso de la librerÃ­a en javascript-->
        <script src="js/moment.js" type="text/javascript"></script>
        <script src="js/jquery-3.1.1.js" type="text/javascript"></script>
        <script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
        <link href="css/datepicker.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="../public/js/ufps.js" type="text/javascript"></script>
        <script src="../public/js/ufps.min.js" type="text/javascript"></script>
        
    </head>
    <body>
        <jsp:include page="../plantilla/header.jsp"></jsp:include>
        <!--
        <header>

            <center> <img id="banner" src="../../public/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header> 

        <div class="ufps-navbar ufps-container " id="menu"  center>
            <div class="ufps-container-fluid">
                <div class="ufps-navbar-brand">
                    <div class="ufps-btn-menu" onclick="toggleMenu('menu')">
                        <div class="ufps-btn-menu-bar"> </div>
                        <div class="ufps-btn-menu-bar"> </div>
                        <div class="ufps-btn-menu-bar"> </div>
                        <div class="ufps-btn-menu-bar"> </div>

                    </div>

                </div>
                <div class="ufps-navbar-left nav">

                    <li><a href="../index.jsp" class="  ufps-navbar-btn  " >Home </a></li>
                    <li><a href="convenios.jsp"  class="ufps-navbar-btn  " >Convenios </a></li>
                    <li><a href="registrarActividad.jsp"  class="ufps-navbar-btn  " >Actividades </a></li>
                    <li><a href="registrarEntidad.jsp"  class="ufps-navbar-btn  " >Registrar Entidad </a></li>
                    <li><a href="registrarConvenio.jsp"  class="ufps-navbar-btn  " >Registrar Convenio </a></li>


                </div>


            </div>
        </div>
-->
        <!--Contenido-->
        <div  class="ufps-container" id="contenido">
            <h1 class="text-center" style="text-align: center">LISTADO DE CONVENIOS</h1>
        <%
            Facade f = new Facade();
        %>
        <table class="ufps-table" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        
                                        <th>NOMBRE</th>
                                        <th>DESCRIPCION</th>
                                        <th>ESTADO</th>
                                        <th>TIPO</th>
                                        <th>CREACION</th>
                                        <th>TERMINACION</th>
                                        <th>ENTIDAD</th>
                                        <th>VIGENCIA</th>
                                        <th>ACTA</th>

                                    </tr>
                                </thead>
                                <tbody>

                                    <%                                        
                                        ArrayList<Convenio> convenios = f.obtenerConvenios();
                                        for (Convenio c : convenios) {
                                            

                                    %>
                                    <tr>

                                        
                                        <td><%=c.getNombre()%></td>
                                        <td><%=c.getDescripcion()%></td>
                                        <td><%=c.getEstado()%></td>
                                        <td><%=c.getTipoconvenio()%></td>
                                        <td><%=c.getFechacreacion()%></td>
                                        <td><%=c.getFechaterminacion()%></td>
                                        <td><%=c.getEntidad()%></td>
                                        <td><%=c.getVigencia()%></td>
                                        <td><input class="ufps-btn" type="button" value="Ver acta"></td>                                 
                                        
                                    </tr>
                                    <% }
                                    %>               


                                </tbody>
        </table>
                        

            <!-- Formulario de registro de actividades del convenio-->


        </div>


    </body>

    <!--Footer-->

    <div class="ufps-container ufps-footer ">
        <h5 class="text-center">Universidad Francisco de Paula Santander</h5>
        <h6 class="text-center">Programa Ingeniería de Sistemas<br>
            Desarrollador por: Francisco Javier Duarte García - Heiner Enrique Villamizar Molina</h6>


    </div>
       
    </body>
</html>
