<%-- 
    Document   : registrarRol
    Created on : 24/11/2016, 04:50:17 PM
    Author     : javie
--%>

<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
<script src="js/ajax.js"></script>   
<%
  IGestionUsuarios gestor = GestionUsuario.getInstance();
  int cont=0;
  
%>
    <div class="ufps-container ufps-fix-navbar-fixed">
        <center> <h1>Registrar nuevo rol</h1></center>
        <center><label id="divError"></label></center>
        <form method="post" action="" name="registro" class="form" id="registro">
            <div>
                <label >Rol</label><br>
                <input type="text" name="rol" id="rol" placeholder="Nombre rol" class="ufps-input ufps-black" />
            </div>
            <div>
                <label >Descripcion</label><br>
                <textarea style="height: 80px;" name="descripcion" id="descripcion" placeholder="Descripcion" class="ufps-input ufps-black" > </textarea>
            </div>  
            <label> Requerimientos funcionales </label>
            <table id="table" class="ufps-table ufps-text-left">
                <tr>
                    <td> RF1 <input style="width: 40px;" title="Registrar usuarios" type="checkbox" name="checkRol" id="checkRol" value="Coordinador"/> </td>
                    <td> RF2 <input style="width: 40px;" type="checkbox" name="checkRol" id="checkRol" value="Coordinador"/> </td>
                    <td> RF3 <input style="width: 40px;" type="checkbox" name="checkRol" id="checkRol" value="Coordinador"/>  </td>
                </tr>
                <tr>
                    <td> RF4 <input style="width: 40px;" type="checkbox" name="checkRol" id="checkRol" value="Coordinador"/> </td>
                    <td> RF5 <input style="width: 40px;" type="checkbox" name="checkRol" id="checkRol" value="Coordinador"/> </td>
                    <td> RF6 <input style="width: 40px;" type="checkbox" name="checkRol" id="checkRol" value="Coordinador"/>  </td>
                </tr>
            </table>
            <input type="submit" class="ufps-btn acomodarBtn" value="Registrar">
        </form>
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>