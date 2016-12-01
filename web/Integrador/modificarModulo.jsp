<%-- 
    Document   : modificarModulo
    Created on : 28/11/2016, 10:36:05 AM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<%
    request.setCharacterEncoding("UTF-8");
  String nombre= request.getParameter("nombre");
  String descripcion= request.getParameter("descripcion");
  String url= request.getParameter("url");
%>
<script src="js/ajax.js"></script>   
<script src="js/ajax.js"></script>   
    <div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Actualizar Módulo</h1></center>
        
        <form method="post" action="javascript:modificarModulo()" name="registro" class="form" id="registro">
            
            <div>
                <label >Nombre módulo</label><br>
                <input type="text" name="nombre_mod" readonly="true" id="nombre_mod" value="<%=nombre%>" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Descripcion</label><br>
                <textarea style="height: 80px;" name="descripcion" id="descripcion" class="ufps-input ufps-black" ><%=descripcion%> </textarea>
            </div>  
             <div>
                <label >Url</label><br>
                <input type="text" name="url" id="url" value="<%=url%>" class="ufps-input ufps-black" />
            </div> 
            <input type="submit" class="ufps-btn acomodarBtn" value="Modificar">
            <center><div id="divError"></div></center>
        </form>
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>