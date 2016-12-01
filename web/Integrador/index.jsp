<%-- 
    Document   : index
    Created on : 1/12/2016, 02:01:09 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"></jsp:include>
    <div  class="ufps-container" id="contenido">
        <center><h1>Bienvenido</h1></center>
        <hr style="height: 2px; background: #d61117; margin-left: 0%">
        <div class="row" id="paneles">
            <div class="col-xs-12 col-md-3"> 
                <div class="panel" id="panel1">
                    <div class="panel-heading" style="text-align: center"><Strong>Usuarios</strong></div>
                    <div class="panel-body text-justify">
                        <center><img alt="Logo usuario" height="200" src="../public/img/user.png"></center>
                        <ul style="list-style: none; padding-left: 0px;">
                            <li><a href="registrar_usuario.jsp" class="ufps-input ufps-btn ufps-btn-light"> Registrar Usuario</a></li>
                            <li><a href="listarUsuario.jsp" class="ufps-input ufps-btn ufps-btn-light"> Listar usuarios</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-3"> 
                <div class="panel" id="panel2">
                    <div class="panel-heading" style="text-align: center"><strong>Módulos</strong></div>
                    <div class="panel-body text-justify">
                        <center><img alt="Logo modulos" style="padding-bottom: 15px;" height="200" src="../public/img/mod.jpg"></center>
                        <ul style="list-style: none; padding-left: 0px;">
                            <li><a href="registrarModulo.jsp" class="ufps-input ufps-btn ufps-btn-light"> Registrar módulos</a></li>
                            <li><a href="listar_actModulos.jsp" class="ufps-input ufps-btn ufps-btn-light"> Listar módulos</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-3"> 
                <div class="panel" id="panel3">
                    <div class="panel-heading" style="text-align: center"><strong>Privilegios</strong></div>
                    <center><img alt="Logo privilegios" height="200" src="../public/img/ojo.jpg"></center>
                    <div class="panel-body text-justify">
                        <ul style="list-style: none; padding-left: 0px;">
                            <li><a href="asignarRF.jsp" class="ufps-input ufps-btn ufps-btn-light"> Actualizar privilegios</a></li>
                            <li><a href="asginar_rol.jsp" class="ufps-input ufps-btn ufps-btn-light"> Actualizar roles</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-3"> 
                <div class="panel" id="panel3">
                    <div class="panel-heading" style="text-align: center"><strong>Roles</strong></div>
                    <div class="panel-body text-justify">
                        <center><img alt="Logo roles" height="200" src="../public/img/rol.jpg"></center>
                        <ul style="list-style: none; padding-left: 0px;">
                            <li><a href="registrarRol.jsp" class="ufps-input ufps-btn ufps-btn-light"> Registrar roles</a></li>
                            <li><a href="listarRoles.jsp" class="ufps-input ufps-btn ufps-btn-light"> Listar roles</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="../plantilla/footer.jsp"></jsp:include>
