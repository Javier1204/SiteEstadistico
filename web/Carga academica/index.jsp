
<%--/**@author Seminario Integrador 3: Ing Pilar Rojas, Estud: Victor Urbina 1150962 & Jesus Rojas 1150833 20/10/2016*/--%>

<!--Aqui coloco el header, OJO con include-->
<jsp:include page="diseno.jsp"/>
<jsp:include page="../plantilla/header.jsp"/>
<%@page import="gestionUsuarios.ICuenta"%>
<%
   ICuenta cuenta=(ICuenta) session.getAttribute("usuario");
    if (cuenta == null) {
        response.sendRedirect("../index.jsp");
    }
   else if(cuenta.containRol("Docente") || cuenta.containRol("Director del Programa") ){
       
       System.out.println("CODIGO ES: "+cuenta.getUser());
    %>
        
 


<h1 align="center">Modulo Carga Acad�mica Docentes: Men� Principal</h1>

<div class="ufps-container">
    <div class="ufps-row">
        
        <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-2">
           
                <img src="../public/img/carga/info.png" alt="logo1">
                <div class="ufps-card-caption">
                <a href="infoPersonal.jsp"><h4><b>INFO</b></h4></a>
                <p>Informaci�n Personal</p>
                </div>
        </div>
        
        <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-2">
           
                <img src="../public/img/carga/docencia.png" alt="logo2">
                <div class="ufps-card-caption">
                <a href="docencia.jsp"><h4><b>Docencia</b></h4></a>
                <p>Actividades Docencia</p>
                </div>
            
        </div>
        
        <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-2">
         
                <img src="../public/img/carga/investigacion.png" alt="logo3">
                <div class="ufps-card-caption">
                <a href="investigacion.jsp"><h4><b>Investigaci�n</b></h4></a>
                <p>Actividades Investigaci�n</p>
                </div>
           
        </div>
        
        <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-2">
          
                <img src="../public/img/carga/extension.png" alt="logo4">
                <div class="ufps-card-caption">
                <a href="extension.jsp"><h4><b>Extensi�n</b></h4></a>
                <p>Actividades Extensi�n</p>
                </div>
           
        </div>
        
        <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-2">
            
                <img src="../public/img/carga/administracion.png" alt="logo5">
                <div class="ufps-card-caption">
                <a href="administracion.jsp"><h4><b>Administraci�n</b></h4></a>
                <p>Actividades Administraci�n</p>
                </div>
            
        </div>
        
        <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-2">
           
                <img src="../public/img/carga/otras.png" alt="logo6">
                <div class="ufps-card-caption">
                 <a href="otras.jsp"><h4><b>Otras</b></h4></a>
                <p>Otras Actividades Extras</p>
              
            </div>
        </div>
        
    </div>
 <%  }
    else{
      response.sendRedirect("../index.jsp");
    }
%>     
    <br>
     <!--TODO ESTO DEL DIRECTOR-->
     <%   if(cuenta.containRol("Director del Programa")){ %> 
     
      <div class="ufps-row">
         <!--consultas director-->
        <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-2">
           
                <img src="../public/img/carga/administrar.png" alt="logo7">
                <div class="ufps-card-caption">
                <a href="administrar.jsp"><h4><b>Administrar</b></h4></a>
                <p>Administrar App</p>
                </div>
        </div>
        <!--consultas director-->
        <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-2">
            
                <img src="../public/img/carga/observaciones.png" alt="logo8">
                <div class="ufps-card-caption">
                <a href="observaciones.jsp"><h4><b>Observaciones</b></h4></a>
                <p>Realizar Observaciones</p>
                </div>
            
        </div>
        <!--consultas director-->
        <div class="ufps-col-mobile-6 ufps-col-tablet-6 ufps-col-netbook-2">
            
                <img src="../public/img/carga/consultar.png" alt="logo9">
                <div class="ufps-card-caption">
                    <a href="consultas.jsp"><h4><b>Consultar</b></h4></a>
                <p>Realizar consultas/reportes</p>
                </div>
            
        </div> 
    </div>
    <% }  %> 
     
</div>
        
<!--Aqui coloco el footer, OJO con include-->
<jsp:include page="../plantilla/footer.jsp"/>  