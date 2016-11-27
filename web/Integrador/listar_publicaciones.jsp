<%-- 
    Document   : listar_publicaciones
    Created on : 07-nov-2016, 17:51:03
    Author     : carlos
--%>


<%@page import="gestionUsuarios.DTOs.ModuloDTO"%>
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page import="java.util.List"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

  IGestionUsuarios gestor = GestionUsuario.getInstance();
  List<ModuloDTO> modulos = gestor.listarModulo();
  

%> 
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<script src="js/jquery-1.4.4.min.js"></script>
  <link href="css/smartpaginator.css" rel="stylesheet">
  <script src="js/smartpaginator.js"></script>
    

  <script type="text/javascript">
        $(document).ready(function () {
            
           
            $('#green-contents').css('display', 'none');
          
            $('ul li').click(function () {
              
                $('#green-contents').css('display', 'none');
          
              
             
            });

            $('#green').smartpaginator({ totalrecords: 13, recordsperpage: 5, datacontainer: 'mt', dataelement: 'tr', initval: 0, next: 'Next', prev: 'Prev', first: 'First', last: 'Last', theme: 'green' });

           

        });
    </script>
    <div id="categorias">
            <table>
                <tr><td> <h3 style="width: 200px; text-align: center">Buscar por modulo:   </h3></td>
                    <td><select id="seleccion" class="ufps-input ">
                            <option>No seleccion</option>
                              <% for(ModuloDTO mod : modulos){ %>
                              <option value="<%= mod.getNombre()%>"><%= mod.getNombre()%></option>
                                 <% } %>
                        </select></td></tr>

            </table>
        </div>
    <div class="contenidopublicacion">
       
        <table id="mt" cellpadding="0" cellspacing="0" border="0">
           
           
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
             <tr><td>
            <div id="contenidopublicacioncreada">

                <h2>titulo</h2> 
                <p>Qué desperdicio de talento. Él eligió el dinero en vez del poder, un error que casi todos cometen. Dinero es la gran mansión en Sarasota que empieza a caerse a pedazos después de diez años. Poder es el viejo edificio de roca que resiste por siglos. No puedo respetar a alguien que no entienda la diferencia
                    <br><br>

                    <a href=""><img src="../public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>

                </p>
            </div></td>
            </tr>
         
        </table>
      
      
    </div>
      <div id="green" style="margin:0 auto;  width: 1200px; height: 60px;">

    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>
</body>
</html>




