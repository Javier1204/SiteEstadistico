<%-- 
    Document   : listar_publicaciones
    Created on : 07-nov-2016, 17:51:03
    Author     : carlos
--%>


<%@page import="integrador.DTO.InformeDTO"%>
<%@page import="integrador.Servicio.SrvInforme"%>
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
<div id="total">
<script src="js/jquery-3.1.1.js"></script>
  <link href="css/smartpaginator.css" rel="stylesheet">
  <script src="js/smartpaginator.js"></script>
  <script src="js/ajax.js"></script>
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

       
    <center> <div  class="panel-heading" id="titulo2"> <h4>BIENVENIDO</h4></div> </center><br>
         <div  id="contenidopublicacion">
             <div id="contenidoPrincipal">
               
               
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
      </div>
      
            
            
            
             <div id="categorias">
      
        <div style="margin-left: 10px;">
            <form  id="consultar" method="post" action="javascript:consultarInformeModuloAñoSemestre()" >
            <table>  
                <tr><td ><h4>Modulo:   </h4></td><td ><select id="modulo" class="ufps-input ">
                            <option>No seleccion</option>
                              <% for(ModuloDTO mod : modulos){ %>
                              <% if(!mod.getNombre().equals("Integrador")){ %>
                              <option value="<%= mod.getNombre()%>"><%= mod.getNombre()%></option>
                              <% } %>  
                              <% } %>
                        </select></td></tr>
             
                        <tr><td><h4>Año: </h4></td><td><input style="width: 100px;" type="text" onkeypress="return validarNumero(event);"  id="ano" class="ufps-input" maxlength="4"  ></td></tr>
                       
                         <tr><td><h4>Semestre: </h4></td><td><input onkeypress="return validarNumero(event);"  style="width: 100px;" type="text" id="semestre" class="ufps-input" maxlength="2" ></td></tr>
                     
                         <tr><td colspan="2" style="text-align: center; width: 300px;"><input type="submit" value="Buscar" class="ufps-btn ufps-btn-light" ></td></tr>
</table>
                        </form>
                        
             </div>
        </div>
            
                        
                        
    </div>
 </div>    
<jsp:include page="../plantilla/footer.jsp"></jsp:include>




