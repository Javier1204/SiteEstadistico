<%-- 
    Document   : modificar_empresa
    Created on : 2/11/2016, 08:57:26 AM
    Author     : Administrador
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.DTO.practicaDTO"%>
<%@page import="Practicas.DTO.empresaDTO"%>
<%@page import="java.util.List"%>
<%@page import="Practicas.Facade.Facade"%>
<%
    Facade f = new Facade();
if(request.getSession().getAttribute("respuesta_mostrar_practica")!=null){
    
%>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_mostrar_practica")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_mostrar_practica", null);
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        
       
    
        <center><h2>LISTADO DE PRACTICAS</h2></center>
        
        <% 
            List <practicaDTO> lista= f.obtenerPracticas();           
        %>
        <div class="ufps-container" id="contenido">
            <fieldset>
            
            
             <br>
                            
              <div class="ufps-col-tablet-9 ufps-col-offset-0">  
                 <div class="caption">
                        <p><a href="registro_practica.jsp" class="btn ufps-btn" role="button">REGISTRAR PRACTICA</a></p>
                    </div>
              </div>
            </fieldset>
        </div>
        <BR><BR>
        
        <div class="ufps-container" id="contenido">    
           <form action="buscar_practica.jsp" method ="POST"> 
            <fieldset>
                <h2>Listado de Practicas Registradas  </h2>
                <%--           
                   <BR>
                   <div class="ufps-col-tablet-5 ufps-col-offset-7">
                       
                          <label for="anip" >AÑO:</label>
                            <select type= "hidden" id="anio" name="anio" class="ufps-input " required="" >
                                    <% ArrayList<String> años=f.obtenerAnios();
                  
                                    for(String a: años){
                                    %>
                                    <option value="<%=a%>"><%=a%></option> 
                                    <%
                                    }
                                    %>
               
                            </select>
                                    </div> 
                                    <div class="ufps-col-tablet-5 ufps-col-offset-7">           
                          <label for="semestre" >SEMESTRE:</label>
                            <select type="hidden" id="semestre" name="semestre" class="ufps-input " required="">
                                             <option value="1">1</option>
                                             <option value="2">2</option>
                                             
                                             
                                                 </select></div>
                                    
                                    +       <div class="btn-group ufps-col-offset-7">
                                        <BR>
                <button type="submit" class="ufps-btn">Buscar</button>
                 
</div> --%>

                 <table class="ufps-table">
                     <BR>
                     <BR>
                <tr class="ufps-table-inserted tr"> 
                    <td>Id</td>
                    <td>Año</td>
                    <td>Semestre</td>
                    <td>Codigo E.</td>
                    <td>Estudiante</td>
                    <td>Perfil</td>
                    <td>Numero de Convenio</td>
                    <td>Empresa</td>
                </tr>
           
                <%
                    for(practicaDTO p: lista){
                %>
                <tr>
                <td> <%= p.getIdpractica() %> </td>
                <td> <%= p.getAño_practica() %> </td>
                <td> <%= p.getSemestre_practica() %> </td>
                <td> <%= p.getId_estudiante() %> </td>
                <td> <%= p.getEstudiante().getNombresEstudiante() %> </td>
                <td> <%= p.getPerfil().getNombre() %> </td>
                <td> <%= p.getId_convenio() %> </td>
                <td> <%= p.getEmpresa().getEmpresa().getNombreEmpresa() %> </td>
                <td>
                    <div class="form-group">
                    <div class="caption">
                        
                        <p><a href="eliminar_practica_p.jsp?idpractica=<%=p.getIdpractica()%>" class="btn ufps-badge  " role="button">Eliminar</a></p>
                    <p><a href="editar_practica.jsp?idpractica=<%=p.getIdpractica()%>" class="btn- ufps-badge" role="button">Editar</a></p>
                    </div>
                    </div>
                </td> 
                </tr>
                <%
                    }
                %>
            </table>
        </fieldset>
            </form>
            </div>
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
