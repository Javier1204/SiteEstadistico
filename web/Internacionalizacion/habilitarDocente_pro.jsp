<%-- 
    Document   : habilitarDocente_pro
    Created on : 14/12/2016, 04:02:09 PM
    Author     : HeinerV
--%>
<%@page import="Internacionalizacion.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String responsable=request.getParameter("responsable");
String[] radio= request.getParameterValues("radio");
Facade f = new Facade();
int a;
if(radio[0].equals("habilitar")){
    
    a=1;
}else
    a=0;
for(String aa:radio)
{
    System.out.println(aa);
}

String r = f.habilitarDocente(responsable, a);
request.getSession().setAttribute("respuesta_entidad", r);





response.sendRedirect("registrarConvenio.jsp");

%>

