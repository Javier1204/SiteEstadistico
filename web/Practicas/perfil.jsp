
<%@page import="gestionUsuarios.GestionUsuario"%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="gestionUsuarios.IGestionUsuarios"%>
<%@page import="java.util.List"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page import="Practicas.DTO.perfilDTO" %>
<%@page import="Practicas.DAO.perfilDAO" %>
<%@page import="Practicas.Controlador.perfilControlador" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    ICuenta cuenta=null;
    String codigo=null;
    
    if(session.getAttribute("usuario")!=null){
        cuenta=(ICuenta)session.getAttribute("usuario");
    }
    
    if(cuenta!=null){
        codigo=cuenta.getUser();
        boolean b=cuenta.containRol("Coordinador practicas");
        boolean m=cuenta.containModulo("Practicas");
    }
    
%> 

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


<jsp:include page="../plantilla/header.jsp"/>  
<body>
<div class="ufps-container" id="contenido">
    
    <div class= "ufps-col-mobile-12 ufps-col-tablet-2">
        <br><br>
        <li><a href="index.jsp" >INICIO</a></li>
        <br>
        <li><a href="perfil.jsp">PERFILES DE PRACTICA</a></li>
        <br>
        <li><a href="estudiantes.jsp">ESTUDIANTES</a></li>
        <br>
        <li><a href="mostrar_empresa.jsp">EMPRESAS</a></li>
        <br>
        <li><a href="mostrar_convenio.jsp">CONVENIOS</a></li>
        <br>
        <li><a href="mostrar_practica.jsp">PRACTICAS</a></li>
        <br>
        <li><a href="generar_estadisticas.jsp">CONSULTAS E INFORMES</a></li>
    </div>
                           

     <div class="ufps-col-mobile-12 ufps-col-tablet-9" id="componentes">
        <center><h2>PERFILES DE PRACTICA</h2></center>
        
        <% 
            List <perfilDTO> lista= f.listarPerfil();           
        %>
        
 
        <form action="perfil_pro.jsp" method="POST">
            <fieldset>
            <h2>Agregar perfil</h2>
            
             <br>
              <div class="ufps-col-tablet-5 ufps-col-tablet-offset-0">
                  <label for="nombrePerfil"><b>Nombre del perfil: </b></label>
                   <input type="text" class="ufps-input" id="nombrePerfil" name="nombrePerfil" required="">                              
                   <button type="submit" class="ufps-btn" id="btnAgregar">AGREGAR</button>
              </div>

            </form>    
     
        <BR><BR><BR><BR><BR>
        <div class="" id="contenido">    

                <h2>Listado de perfiles actuales </h2>
                <br>
                 <table class = "ufps-table" id="tablaperfiles" name="tablaperfiles" style="table-layout:fixed">
                <tr class="ufps-table-inserted tr"> 
                    <td WIDTH="7" bgcolor="FireBrick"><font color="White"><b>PERFIL</b></font></td>
                    <td width="20" bgcolor="FireBrick"><font color="White"><b>NOMBRE</b></font></td>
                    <td width="10" bgcolor="FireBrick"><font color="White"><b>OPCION</b></font></td>
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
            </div>
        </fieldset>
        </div>
    </div>
</body>  
    
    <BR><BR><BR>
    
<jsp:include page="../plantilla/footer.jsp"/> 
