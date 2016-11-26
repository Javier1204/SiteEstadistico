<%-- 
    Document   : registrarModulo
    Created on : 24/11/2016, 04:50:02 PM
    Author     : javie
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<script src="js/ajax.js"></script>   
    <div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Registrar Módulo</h1></center>
        <center><label id="divError"></label></center>
        <form method="post" action="javascript:registrarModulo()" name="registro" class="form" id="registro">
            <div>
                <label >Nombre módulo</label><br>
                <input type="text" name="nombre_mod" id="nombre_mod" placeholder="Nombre módulo" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Descripcion</label><br>
                <textarea style="height: 80px;" name="descripcion" id="descripcion" placeholder="rol" class="ufps-input ufps-black" > </textarea>
            </div>  
             <div>
                <label >Url</label><br>
                <input type="text" name="url" id="url" placeholder="url" class="ufps-input ufps-black" />
            </div> 
            <input type="submit" class="ufps-btn acomodarBtn" value="Registrar">
        </form>
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>