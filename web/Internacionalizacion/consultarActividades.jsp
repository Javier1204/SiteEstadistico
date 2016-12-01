<%-- 
    Document   : consultarActividades
    Created on : 1/12/2016, 05:33:37 AM
    Author     : JAVIER
--%>

<%@page import="Internacionalizacion.Modelo.DTO.Actividad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Internacionalizacion.Facade.Facade"%>
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
        

        <!--Contenido-->
        
            <h1 class="text-center" style="text-align: center">LISTADO DE ACTIVIDADES</h1>
        <%
            Facade f = new Facade();
        %>
        <table class="ufps-table" cellspacing="0" width="100%" style="font-size:12px">
                                <thead>
                                    <tr>
                                        
                                        <th>CONVENIO</th>
                                        <th>DURACION(MESES)</th>
                                        <!--<th>DESCRIPCION</th>-->
                                        <th>NOMBRE</th>
                                        <th>INICIO</th>
                                        <th>TERMINACION</th>
                                        <th>SEMESTRE</th>
                                        <th>TIPO</th>
                                        <th>HORA</th>
                                        <th>LUGAR</th>
                                        

                                    </tr>
                                </thead>
                                <tbody>

                                    <%                                        
                                        ArrayList<Actividad> actividades = f.consultarActividades();
                                        for (Actividad c : actividades) {
                                            

                                    %>
                                    <tr>

                                        
                                        <td><%=c.getIdconvenio()%></td>
                                        <td><%=c.getDuracion()%></td>
                                        <td><%=c.getNombre()%></td>
                                        <!--<td><%=c.getDescripcion()%></td>-->
                                        
                                        <td><%=c.getFechacreacion()%></td>
                                        <td><%=c.getFechaterminacion()%></td>
                                        <td><%=c.getSemestre()%></td>
                                        <td><%=c.getTipoactividad()%></td>
                                        <td><%=c.getHora()%></td>                                       
                                        <td><%=c.getLugar()%></td>                                       
                                                                          
                                        
                                    </tr>
                                    <% }
                                    %>               


                                </tbody>
        </table>

    </body>

</html>