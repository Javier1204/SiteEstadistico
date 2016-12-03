
<%@page import="java.util.List"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page import="Practicas.DTO.perfilDTO" %>
<%@page import="Practicas.DAO.perfilDAO" %>
<%@page import="Practicas.Controlador.perfilControlador" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Facade f = new Facade();
if(request.getSession().getAttribute("respuesta_perfil")!=null){
    
%>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_perfil")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_perfil", null);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Prácticas</title
        <link href="../estilos/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link href="../estilos/css/ufps.css" rel="stylesheet">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/default.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/highlight.min.js"></script>
        <script src="../estilos/js/ufps.js"></script>
    </head>
    
    <body>
        <header>
            <center> <img id="banner" src="../estilos/img/Banner-superior.png" alt="imagen" height="100px" width="100%" ></img></center>
        </header>
       
            <div class="ufps-navbar ufps-container " id="menu"  center>
             <div class="ufps-container-fluid">
                 <div class="ufps-navbar-brand">
                     <div class="ufps-btn-menu" onclick="toggleMenu('menu')">
                         <div class="ufps-btn-menu-bar"> </div>
                         <div class="ufps-btn-menu-bar"> </div>
                         <div class="ufps-btn-menu-bar"> </div>
                         <div class="ufps-btn-menu-bar"> </div>
 
                     </div>
 
                 </div>
                 <div class="ufps-navbar-left nav"><li><a href="index.jsp" class="  ufps-navbar-btn  " >INICIO</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="perfil.jsp" class="  ufps-navbar-btn  " >PERFILES DE PRACTICA</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="estudiantes.jsp" class="  ufps-navbar-btn  " >ESTUDIANTES</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >EMPRESAS</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >CONVENIOS</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="mostrar_practica.jsp" class="  ufps-navbar-btn  " >PRACTICAS</a></li></div>
                 <div class="ufps-navbar-left nav"><li><a href="" class="  ufps-navbar-btn  " >CONSULTAS E INFORMES</a></li></div>
                 
             </div>
                
                 
                
        </div>
        
        <div class="ufps-pull-right">
            <div class="thumbnail">
                <img src="concierge_bell.png">
                <button class="ufps-badge-gray" data-badge="6">Notificaciones</button>
            </div>
        </div>
    
        <center><h2>PERFILES DE PRACTICA</h2></center>
        
        <% 
            List <perfilDTO> lista= f.listarPerfil();           
        %>
        
        <div class="ufps-container" id="contenido">
            <form action="perfil_pro.jsp" method="POST">
            <fieldset>
            <h2>Agregar perfil</h2>
            
             <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-0">
                  <label for="nombrePerfil"><b>Nombre del perfil: </b></label>
                   <input type="text" class="ufps-input" id="nombrePerfil" name="nombrePerfil" required="">                              
              </div>
              
              <div class="ufps-col-tablet-9 ufps-col-offset-0">  
                <div class="form-group">
                    <button type="submit" class="ufps-btn" id="btnAgregar">AGREGAR</button>
                </div> 
              </div>
            </fieldset>
            </form>    
        </div>
        <BR><BR>
        <div class="ufps-container" id="contenido">    
            <fieldset>
                <h2>Listado de perfiles actuales </h2>
                <br>
                 <table class="ufps-table" id="tablaperfiles" name="tablaperfiles">
                <tr class="ufps-table-inserted tr"> 
                    <td>Perfil</td>
                    <td>Valor</td>
                    <td>Opcion</td>
                </tr>
           
                <%
                    for(perfilDTO p: lista){
                %>
                <tr>
                <td> <%= p.getIdperfil() %> </td>
                <td> <%= p.getNombre() %> </td>
                <td>
                    <div class="form-group">
                    <div class="caption">
                        <p><a href="eliminar_perfil_p.jsp?id=<%= p.getIdperfil()%>" class="btn ufps-badge  " role="button">Eliminar</a></p>
                                        </div>  
                    </div>  
                </td> 
                </tr>
                <%
                    }
                %>
            </table>
        </fieldset>
        </div>
    
    </body>
    
    <BR><BR><BR>
    
    <footer>
         <div class="ufps-container ufps-footer-light">
            <center><h5 class="text-center">Universidad Francisco de Paula Santander</h5>
                <h6 class="text-center">Programa Ingeniería de Sistemas<br>
                Desarrollador por estudiantes de Seminario Integrador III</h6>
                <h5> 2016</h5>
             </center>
        </div> 
    </footer>
    
</html>
