<%-- 
    Document   : procesar_tipo_actividades
    Created on : 26/11/2016, 01:23:25 PM
    Author     : JAVIER
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="internacionalizacion.Modelo.DTO.Tipo_actividades"%>
<%@page import="internacionalizacion.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    request.setCharacterEncoding("UTF-8");
    String convenio = request.getParameter("convenio");

    Facade f = new Facade();

//Obtengo el convenio seleccionado.
    ArrayList<String> actividades = f.obtenerActividades(convenio);
    
    //for(String x: actividades)
        //System.out.println(x);
    Gson gson = new Gson();
ArrayList<String> vector= new ArrayList();

    String respuesta = gson.toJson(actividades);
    //System.out.println("jsp"+respuesta);
    //char[] arr = respuesta.toCharArray();
    
    //for(int i=0;i<arr.length;i++)
    /*String cadena ="";
        for(char x:arr){
             if((x=='[') || (x==']') || (x=='"') || (x==',')){
              
                 if(x==','){
                     vector.add(cadena);
                     cadena="";
                 }
             }
             
             else
                 cadena+=x;
        }
            vector.add(cadena);            
        //System.out.println(cadena);
        //for(String s:vector)
        //System.out.println(s);*/
    //System.out.print(respuesta);
    //out.print(respuesta);
    
    
   
    response.getWriter().print(respuesta);
//out.print(respuesta);
%>
