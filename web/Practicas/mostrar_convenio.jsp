<%-- 
    Document   : modificar_convenio
    Created on : 2/11/2016, 08:45:44 AM
    Author     : Administrador
--%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="Practicas.DTO.convenioDTO"%>
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
if(request.getSession().getAttribute("respuesta_mostrar_convenio")!=null){
    
%>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_mostrar_convenio")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_mostrar_convenio", null);
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
                        
     
        <center><h2>LISTADO DE CONVENIOS</h2></center>
     
        <% 
            List <convenioDTO> lista= f.obtenerConvenios();           
        %>

        
        
        <div class="ufps-container" id="contenido">
            <fieldset>
            
            
             <br>
                            
              <div class="ufps-col-tablet-9 ufps-col-offset-0">  
                 <div class="caption">
                        <p><a href="registro_convenio.jsp" class="btn ufps-btn" role="button">REGISTRAR CONVENIO</a></p>
                    </div> 
              </div>
            </fieldset>
        </div>
        <BR><BR>
        <div class="ufps-container" id="contenido">    
            <fieldset>
                <h2>Listado de convenios actuales actuales </h2>
                <br>
                 <table class="ufps-table">
                <tr class="ufps-table-inserted tr"> 
                    <td>Nombre</td>
                    <td>Numero de Convenio</td>
                    <td>Fecha de inicio</td>
                    <td>Fecha de terminacion</td>
                    <td>Estado</td>
                    <td>Empresa</td>
                </tr>
           
                <%
                    for(convenioDTO p: lista){
                %>
                <tr>
                <td> <%= p.getNombreConvenio() %> </td>
                <td> <%= p.getIdconvenio() %> </td>
                <td> <%= p.getFechainicio() %> </td>
                <td> <%= p.getFechafin() %> </td>
                <td> <%= p.getEstado() %> </td>
                <td> <%= p.getEmpresa().getNombreEmpresa() %> </td>
                <td>
                    <div class="form-group">
                    <div class="caption">
                        <p><a href="Editar_convenio.jsp?id=<%= p.getIdconvenio() %>"class="btn- ufps-badge" role="button">Editar</a></p>
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

   <jsp:include page="../plantilla/footer.jsp"/>