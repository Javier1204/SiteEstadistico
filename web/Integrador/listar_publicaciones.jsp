<%-- 
    Document   : listar_publicaciones
    Created on : 07-nov-2016, 17:51:03
    Author     : carlos
--%>


<%@page import="java.util.List"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

   

%> 
   <jsp:include page="../plantilla/header.jsp"></jsp:include>
   
<div class="contenidopublicacion">

         
            <div id="contenidopublicacioncreada">

                 <h2>titulo</h2> 
                 <p>descripcion
                 <br><br>
              
                 <a href=""><img src="public/img/integrador/descargar.png"  height="30px" width="30px" title="descargar publicacion" style="margin-right: 20px;"> Descargar informe</a>
           
                </p>
            </div>
         
        </div>

        <jsp:include page="../plantilla/footer.jsp"></jsp:include>
    </body>
</html>




