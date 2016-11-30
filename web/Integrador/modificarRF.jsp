<%-- 
    Document   : modificarRF
    Created on : 28/11/2016, 11:15:17 AM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String id= request.getParameter("id");
  String modulo= request.getParameter("modulo");
  String nombre= request.getParameter("nombre");
  String url= request.getParameter("url");
%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<script src="js/ajax.js"></script> 
    <div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Modificar requerimiento funcional</h1></center>
        <center><label id="divError"></label></center>
        <form method="post" action="javascript:modificarRF()" name="registro" class="form" id="registro">
            <div>
                <label >Modulo</label><br>
                <input type="text" value="<%=modulo%>" readonly="true" name="modulo" id="modulo" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Id</label><br>
                <input type="text" value="<%=id%>" readonly="true" name="id" id="id" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Nombre</label><br>
                <input type="text" value="<%=nombre%>" name="nombre" id="nombre" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Url</label><br>
                <input type="text" name="url" value="<%=url%>" id="url" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Descripcion</label><br>
                <textarea style="height: 80px;" name="descripcion" id="descripcion" placeholder="Descripción" class="ufps-input ufps-black" > </textarea>
            </div>  
            
            <input type="submit" class="ufps-btn acomodarBtn" value="Modificar">
        </form>
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>