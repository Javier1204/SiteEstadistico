<%-- 
    Document   : estudiantes
    Created on : 2/11/2016, 01:14:16 PM
    Author     : Administrador
--%>
<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.DTO.estudianteDTO"%>
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
if(request.getSession().getAttribute("respuesta_estudiantes")!=null){
    
%>
    <script type="text/javascript">
    alert("<%=request.getSession().getAttribute("respuesta_estudiantes")%>");
</script>
<%}
request.getSession().setAttribute("respuesta_estudiantes", null);
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
   
   <center><h2>LISTADO DE ESTUDIANTES DE PRACTICAS</h2></center>
        
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
           System.out.println("semestre"+semestre);
           
            ArrayList <estudianteDTO> lista= f.obtenerEstudiantes(semestre, año); 
        
        %>

        
        <BR><BR>
        <div class="ufps-container" id="contenido">    
            <fieldset>
                <h2>Listado de Estudiantes </h2>
                <br>
                 <table class="ufps-table">
                <tr class="ufps-table-inserted tr"> 
                    <td>Codigo</td>
                    <td>Cedula</td>
                    <td>Nombres</td>
                    <td>Apellidos</td>
                    <td>Semestre</td>
                    <td>Direccion</td>
                    <td>Correo</td>
                    <td>Telefono</td>
                </tr>
           <%
                    for(estudianteDTO p: lista){
                %>
                <tr>
                <td> <%= p.getCodigoEstudiante() %> </td>
                <td> <%= p.getCedula() %> </td>
                <td> <%= p.getNombresEstudiante() %> </td>
                <td> <%= p.getApellidosEstudiante() %> </td>
                <td> <%= p.getSemestre() %> </td>
                <td> <%= p.getDireccion() %> </td>
                <td> <%= p.getEmail() %> </td>
                <td> <%= p.getTelefono() %> </td>
                
                <td>
                    
                </td> 
                </tr>
                <%
                    }
                %>
            </table>
        </fieldset>
        </div>
    
  <jsp:include page="../plantilla/footer.jsp"/> 
