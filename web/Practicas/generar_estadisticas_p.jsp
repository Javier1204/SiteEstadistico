<%-- 
    Document   : generar_estadisticas_p
    Created on : 26/11/2016, 03:31:10 PM
    Author     : USUARIO
--%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   int añop=Integer.parseInt(request.getParameter("añop"));
   int semestrep= Integer.parseInt(request.getParameter("semestrep"));
   Facade f= new Facade();
   boolean rta=false;
   String ruta="";
   
   System.out.println("LLAMA AL JSP");
   
   if(request.getParameter("estadisticas")!= null){
       ruta=f.generarEstadisticas(añop, semestrep);
       System.out.println("ENTRA A ESTADISTICAS");
   } else if(request.getParameter("informes")!=null){
       rta=f.generarInformes(añop, semestrep);
       System.out.println("ENTRA A INFORMES");
       %>


    <%
   }
   
   
    %>
    

<%
    response.sendRedirect("generar_estadisticas.jsp");
%>