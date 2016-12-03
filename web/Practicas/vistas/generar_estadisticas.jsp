<%@page import="java.util.ArrayList"%>
<%@page import="Practicas.Facade.Facade"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Prácticas</title
        <link href="../estilos/css/ufps.min.css" rel="stylesheet" type="text/css"/>
        <link href="../estilos/css/ufps.css" rel="stylesheet">
        <link href="../estilos/css/bootstrap.css" rel="stylesheet" type="text/css"/>
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
