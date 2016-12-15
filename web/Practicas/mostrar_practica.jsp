<%-- 
    Document   : modificar_empresa
    Created on : 2/11/2016, 08:57:26 AM
    Author     : Administrador
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.DTO.practicaDTO"%>
<%@page import="Practicas.DTO.empresaDTO"%>
<%@page import="java.util.List"%>
<%@page import="Practicas.Facade.Facade"%>

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
<jsp:include page="../plantilla/header.jsp"/> 

    <div class="ufps-col-mobile-12 ufps-col-tablet-2">
        <li><a href="index_1.jsp" class="  ufps-navbar-btn  " >INICIO</a></li>
        <li><a href="perfil.jsp" class="  ufps-navbar-btn  " >PERFILES DE PRACTICA</a></li>
        <li><a href="estudiantes.jsp" class="  ufps-navbar-btn  " >ESTUDIANTES</a></li>
        <li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >EMPRESAS</a></li>
        <li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >CONVENIOS</a></li>
        <li><a href="mostrar_practica.jsp" class="  ufps-navbar-btn  " >PRACTICAS</a></li>
        <li><a href="" class="  ufps-navbar-btn  " >CONSULTAS E INFORMES</a></li>           
    </div>
           
<center><h2>LISTADO DE PRACTICAS</h2></center>
        
        <% 
            java.util.Calendar fecha = java.util.Calendar.getInstance();
           int mes= fecha.get(java.util.Calendar.MONTH);    
           int año=fecha.get(java.util.Calendar.YEAR);
           int semestre= 0;
            System.out.println(""+mes+""+año);
           
           if((mes>=02)&& (mes<=06)){
               semestre=1;
              }else{
               semestre=2;
           }
            List <practicaDTO> lista= f.obtenerPracticas_anio(semestre, año);           
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
    
    </body>
    
    <BR><BR><BR>
    
  <jsp:include page="../plantilla/footer.jsp"/> 