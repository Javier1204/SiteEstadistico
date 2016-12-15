<%-- 
    Document   : modificar_empresa
    Created on : 2/11/2016, 08:57:26 AM
    Author     : Administrador
--%>

<%@page import="gestionUsuarios.ICuenta"%>
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
if(request.getSession().getAttribute("respuesta_mostrar_empresa")!=null){
    
%>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_mostrar_empresa")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_mostrar_empresa", null);
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla/header.jsp"/>  
<!DOCTYPE html>

    <div class="ufps-col-mobile-12 ufps-col-tablet-2">
        <li><a href="index_1.jsp" class="  ufps-navbar-btn  " >INICIO</a></li>
        <li><a href="perfil.jsp" class="  ufps-navbar-btn  " >PERFILES DE PRACTICA</a></li>
        <li><a href="estudiantes.jsp" class="  ufps-navbar-btn  " >ESTUDIANTES</a></li>
        <li><a href="mostrar_empresa.jsp" class="  ufps-navbar-btn  " >EMPRESAS</a></li>
        <li><a href="mostrar_convenio.jsp" class="  ufps-navbar-btn  " >CONVENIOS</a></li>
        <li><a href="mostrar_practica.jsp" class="  ufps-navbar-btn  " >PRACTICAS</a></li>
        <li><a href="" class="  ufps-navbar-btn  " >CONSULTAS E INFORMES</a></li>                            
    </div>
        
     
        <center><h2>LISTADO DE EMPRESAS</h2></center>
        
        <% 
            List <empresaDTO> lista= f.obtenerEmpresas();           
        %>
        <div class="ufps-container" id="contenido">
            <fieldset>
            
            
             <br>
                            
              <div class="ufps-col-tablet-9 ufps-col-offset-0">  
                 <div class="caption">
                        <p><a href="registro_empresas.jsp" class="btn ufps-btn" role="button">REGISTRAR EMPRESA</a></p>
                    </div>
              </div>
            </fieldset>
        </div>
        <BR><BR>
        <div class="ufps-container" id="contenido">    
            <fieldset>
                <h2>Listado de Empresas Actuales  </h2>
                <br>
                 <table class="ufps-table">
                <tr class="ufps-table-inserted tr"> 
                    <td>Nombre</td>
                    <td>NIT</td>
                    <td>Dirección</td>
                    <td>Telefono</td>
                    <td>Actividad de la Empresa</td>
                    <td>Tipo de la Empresa</td>
                </tr>
           
                <%
                    for(empresaDTO p: lista){
                %>
                <tr>
                
                <td> <%= p.getNombreEmpresa() %> </td>
                <td> <%= p.getNIT() %> </td>
                <td> <%= p.getDireccion() %> </td>
                <td> <%= p.getTelefono() %> </td>
                <td> <%= p.getSectorEmpresa() %> </td>
                <td> <%= p.getTipoAmbito() %> </td>
                <td>
                    <div class="form-group">
                    <div class="caption">
                    <p><a href="eliminar_empresa_p.jsp?nit=<%= p.getNIT() %>" class="btn ufps-badge  " role="button">Eliminar</a></p>
                    <p><a href="editar_empresa.jsp?nit=<%= p.getNIT() %>" class="btn- ufps-badge" role="button">Editar</a></p>
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

 <jsp:include page="../plantilla/footer.jsp"/> 
