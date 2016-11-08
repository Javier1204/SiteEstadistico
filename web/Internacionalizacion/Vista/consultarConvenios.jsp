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
        <link href="../../public/css/ufps-estilo.css" rel="stylesheet" type="text/css"/>
        <link href="../../public/css/ufps.css" rel="stylesheet" type="text/css"/>
        <script src="../../public/js/ufps.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            Facade f = new Facade();
        %>
        <table class="ufps-table" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        
                                        <th>NOMBRE</th>
                                        <th>DESCRIPCION</th>
                                        <th>ESTADO</th>
                                        <th>TIPO CONVENIO</th>
                                        <th>CREACION</th>
                                        <th>TERMINACION</th>
                                        <th>ENTIDAD</th>
                                        <th>VIGENCIA</th
                                       

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
                                        <td><%=c.getFechacreacion()%></td>
                                        <td><%=c.getFechaterminacion()%></td>
                                        <td><%=c.getTipoconvenio()%></td>
                                        <td><%=c.getVigencia()%></td>
                                        
                                        <td><%=c.getEntidad()%></td>
                                       
                                        
                                        
                                    </tr>
                                    <% }
                                    %>               


                                </tbody>
                            </table>
    </body>
</html>
