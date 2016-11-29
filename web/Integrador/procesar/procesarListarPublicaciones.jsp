<%-- 
    Document   : procesarListarPublicaciones
    Created on : 26-nov-2016, 16:04:29
    Author     : carlos
--%>

<%@page import="Integrador.DTO.InformeDTO"%>
<%@page import="java.util.List"%>
<%@page import="Integrador.Servicio.SrvInforme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    
   
    
String modulo=request.getParameter("modulo");
int ano=Integer.parseInt(request.getParameter("ano"));
int semestre=Integer.parseInt(request.getParameter("semestre"));

SrvInforme srv=SrvInforme.getInstance();
 List<InformeDTO> lista=  srv.listarPublicacionesModulo(modulo,ano,semestre);

%>


  <table id="mt" cellpadding="0" cellspacing="0" border="0">
           
           <% for(InformeDTO  dto: lista){ %>
             <tr><td style="width: 1200px">
            <div id="contenidopublicacioncreada">

                <h2><%= dto.getNombre() %></h2> 
                <p><%= dto.getDescripcion() %>
                    <br><br>

                    <a href="<%= dto.getUrl_informe() %>"><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>
                    <br><br>
                    <label style="margin-right: 30px;"> Modulo: <%= dto.getModulo() %>  </label>      <label style="margin-right: 30px;"> semestre: <%= dto.getSemestre() %></label>         <label style="margin-right: 30px;">   año: <%= dto.getAno() %>  </label>            

                </p>
            </div></td>
            </tr>
            <% } %>
            
        </table>