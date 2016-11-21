<%-- 
    Document   : agregar_perfil
    Created on : 7/11/2016, 08:52:25 PM
    Author     : Usuario
--%>

<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
    Facade f = new Facade();
    System.out.println("Entro al metodo");
    System.out.println("Combo Perfiles:" + request.getParameter("comboPerfiles"));
    System.out.println("Combo valor:" + request.getParameter("comboValor"));
    System.out.println("Codigo:" + request.getParameter("codigoEst"));
    int perf = Integer.parseInt(request.getParameter("comboPerfiles"));
    int valor =Integer.parseInt(request.getParameter("comboValor"));
    int cod = Integer.parseInt(request.getParameter("codigoEst"));
    String r= f.agregarPerfilEstudiante(perf,valor, cod);
    if(r.equals("Registro")){
        System.out.println("entra " );
       
    }
     
     request.getSession().setAttribute("respuesta_perfil_estudiante", r);              
    %>

    <%
        
     
response.sendRedirect("registro_estudiante.jsp");


%>