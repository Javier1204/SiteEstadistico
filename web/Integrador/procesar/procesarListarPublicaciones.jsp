<%-- 
    Document   : procesarListarPublicaciones
    Created on : 26-nov-2016, 16:04:29
    Author     : carlos
--%>

<%@page import="integrador.DTO.InformeDTO"%>
<%@page import="java.util.List"%>
<%@page import="integrador.Servicio.SrvInforme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
   
    
String modulo=(request.getParameter("modulo").equals("No seleccion"))?"":request.getParameter("modulo");
int ano=(!request.getParameter("ano").isEmpty())?Integer.parseInt(request.getParameter("ano")):-1;

int semestre=(!request.getParameter("semestre").isEmpty())?Integer.parseInt(request.getParameter("semestre")):-1;

SrvInforme srv=SrvInforme.getInstance();
 List<InformeDTO> lista=  srv.listarPublicacionesModulo(modulo,ano,semestre);

%>

   <input type="text" id="tamano" style="visibility:hidden"  value="<%= lista.size() %>"> 
                  <script type="text/javascript">
        
        $(document).ready(function () {
            
           
            $('#green-contents').css('display', 'none');
          
            $('ul li').click(function () {
              
                $('#green-contents').css('display', 'none');
          
              
             
            });
            var val=$("#tamano").val();
        
            $('#green').smartpaginator({ totalrecords: val , recordsperpage: 5, datacontainer: 'mt', dataelement: 'tr', initval: 0, next: 'Next', prev: 'Prev', first: 'First', last: 'Last', theme: 'green' });

           

        });
    </script>


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
            
             <br>
             <div id="green" ></div>