<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="java.util.ArrayList"%>
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

    <%
        Facade fachada= new Facade();  
    %>  
     <div  class="ufps-container" id="contenido">
          <form method="POST" action="generar_estadisticas_p.jsp">    
          <center><strong><h1>ESTADISTICAS</h1></strong></center>                  
        <br><br>          
         
        <fieldset>
            
            <div class="ufps-col-tablet-12 ">  
                  <label>Año:</label>
            <select id="añop" name="añop" class="ufps-input ">
                <% ArrayList<String> años=fachada.fechas_practicas();
                  
                    for(String a: años){
                        %>
                        <option value="<%=a%>"><%=a%></option> 
                <%
                    }
                %>
               
            </select>
                <label>Semestre</label>
            <select id="semestrep" name="semestrep" class="ufps-input">
                    <option value="1">1</option>
                    <option value="2">2</option>
            </select>
            </div>
             <center><div class="ufps-col-tablet-12 ">  
                <div class="form-group">
                    <input type="submit" class="ufps-btn" name="estadisticas" value="Generar Estadisticas Publicas">
                    <input type="submit" class="ufps-btn" name="informes" value="Generar Informes de Practicas">
                </div> 
            </div></center>       
                
                
        </fieldset>
          </form>
                
           
                <embed src="C://Users//USUARIO//GlassFish_Server2//glassfish//domains//domain//config//Informes-practicas-2011-1.pdf" width="450" height="450" href="url_pdf.pdf"></embed>     
     </div>
        
    </body>
    
    <BR><BR><BR>

 <jsp:include page="../plantilla/footer.jsp"/> 