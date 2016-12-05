<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : registrarGrupo
    Created on : Nov 4, 2016, 4:55:24 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Metaetiqueta para el uso del conjunto de caracteres adecuado-->
        <meta charset="utf-8">
        <!--Metaetiqueta para corregir compatibilidad con navegador Microsft-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Metaetiqueta para la correcta visualización en dispositivos moviles-->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0">
        <title>Registro</title>
        <!--Añada primero el estilo de la libreria (ufps.css o ufps.min.css) y luego sus estilos propios-->
        <link href="../css/ufps.min.css" rel="stylesheet">
        <!--Librerías para compatibilidad con versiones antiguas de Internet Explorer-->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script src="../js/jquery-1.11.0.min.js" type="text/javascript"></script>
        <script src="../js/gestionGrupos.js" type="text/javascript"></script>
        <script src="../js/ufps.min.js"></script>
    </head>
    <jsp:useBean id="fachada" class="gruposinvestigacion.fachada.AdminFachade" scope="session" ></jsp:useBean>
    <%
        request.setAttribute("docentes", fachada.listarGeneralDocentes());
    %>
    <body>
        <div class="ufps-container">
            <jsp:include page="../assets/admin/menu.jsp" /> 

            <br>
            <br>
            <section>
                <div class="ufps-row">
                    <div class="ufps-black ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-netbook-offset-3 ufps-col-desktop-6 ufps-col-desktop-offset-3">
                        <form class="ufps-black" id="formRegistrarGrupo">
                            <h2 class="ufps-text-center ufps-red">Registro</h2>

                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Código Colciencias</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="codigoColciencias" id="codigoColciencias" placeholder="" class="ufps-input ufps-green" required/>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>


                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Nombre</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="nombre" id="nombre" placeholder="" class="ufps-input ufps-green" required/>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>


                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Sigla</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="sigla" id="sigla" placeholder="" class="ufps-input ufps-green" required/>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Director</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <select class="ufps-input" name="director">
                                    <c:forEach var="docente" items="${docentes}">
                                        <option value="${docente.codigo}">${docente.nombres} ${docente.apellidos}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>


                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Contraseña Director:</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="password" name="contrasena" id="contrasena" class="ufps-input ufps-green" required/>
                            </div>
                            

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>


                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Correo Electrónico</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="correo" id="correo" placeholder="" class="ufps-input ufps-green" required/>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Año de Creación</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="number" name="anioCreacion" id="anioCreacion" placeholder="" class="ufps-input ufps-green" required/>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>


                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Ubicación</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="ubicacion" id="ubicacion" placeholder="" class="ufps-input ufps-green" required/>
                            </div>

                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>


                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <label><h3>Teléfono</h3></label>
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-netbook-6 ufps-col-desktop-6 ufps-col-desktop-offset-0">
                                <input type="text" name="telefono" id="telefono" placeholder="" class="ufps-input ufps-green" required/>
                            </div>


                            <div class="ufps-col-mobile-12 ufps-col-tablet-6">
                            </div>
                            <div class="ufps-col-mobile-12 ufps-col-tablet-push-6">
                            </div>

                            <input type="hidden" name="accion" value="1" />
                            <div class="ufps-col-mobile-12 ufps-col-netbook-12 ufps-col-desktop-12 ufps-text-center">
                                <input type="submit" value="Registrar" class="ufps-btn" />
                            </div>

                        </form>
                        
                        <div id="divCargando" class="ufps-col-mobile-12 ufps-col-netbook-12 ufps-col-desktop-12 ufps-text-center" hidden="true">
                            <img src="../img/CirculoCargando.gif" />
                        </div>
                    </div>
                </div>
            </section>            
            <jsp:include page="../assets/footer.jsp" /> 
        </div>
    </body>
</html>