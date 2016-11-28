<%-- 
    Document   : listar_publicaciones
    Created on : 07-nov-2016, 17:51:03
    Author     : carlos
--%>


<%@page import="Integrador.DTO.InformeDTO"%>
<%@page import="Integrador.Servicio.SrvInforme"%>
<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page import="java.util.List"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

  IGestionUsuarios gestor = GestionUsuario.getInstance();
  List<ModuloDTO> modulos = gestor.listarModulo();
  SrvInforme srv=SrvInforme.getInstance();
  List<InformeDTO> lista=  srv.listarPublicaciones();

%> 
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<script src="js/jquery-1.4.4.min.js"></script>
  <link href="css/smartpaginator.css" rel="stylesheet">
  <script src="js/smartpaginator.js"></script>
    
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
      <div id="titulo"> <center><h2>Buscador</h2></center> </div>
    <div id="categorias">
      
        <div style="margin-left: 10px;">
            <form action="" method="post">
            <table>  
                <tr><td ><h4>Modulo:   </h4></td><td ><select id="seleccion" class="ufps-input ">
                            <option>No seleccion</option>
                              <% for(ModuloDTO mod : modulos){ %>
                              <option value="<%= mod.getNombre()%>"><%= mod.getNombre()%></option>
                                 <% } %>
                        </select></td></tr>
             
                        <tr><td><h4>Año: </h4></td><td><input style="width: 100px;" type="number" id="ano" class="ufps-input" required="" min="0"></td></tr>
                       
                         <tr><td><h4>Semestre: </h4></td><td><input  style="width: 100px;" type="number" id="semestre" class="ufps-input" min="1" max="2" required=""></td></tr>
                     
                         <tr><td colspan="2" style="text-align: center; width: 300px;"><input type="submit" value="Buscar" class="ufps-btn ufps-btn-light" ></td></tr>
</table>
                        </form>
                        
             </div>
        </div>
      
        <div id="titulo2"> <center><h2>Informes generales</h2></center> </div>
         <div class="contenidopublicacion">
       
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
      
      
    </div>
      <div id="green" style="margin-left: 350px;  width: 900px; height: 60px;">

    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>
</body>
</html>




