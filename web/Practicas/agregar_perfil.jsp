<%-- 
    Document   : agregar_perfil
    Created on : 7/11/2016, 08:52:25 PM
    Author     : Usuario
--%>

<%@page import="Practicas.DTO.perfil_estudianteDTO"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
    Facade f = new Facade();
    System.out.println("Entro al metodo");
    
    byte cantidad= Byte.parseByte(request.getParameter("cantidad"));
    perfil_estudianteDTO[] perfiles = new perfil_estudianteDTO[cantidad];
    byte ciclo=1;
    //int codigo = Integer.parseInt(request.getParameter("codigoEst"));
    System.out.println(request.getParameter("prueba1")); 
    while(ciclo<=cantidad){
        String parametro2="valor"+ciclo;
        System.out.println(parametro2); 
        //if(parametro2!=null){
            
            String parametro1="idperfil"+ciclo;
            System.out.println(request.getParameter(parametro1));
            System.out.println(request.getParameter("nombrep"));
          //  int idp=Integer.parseInt(request.getParameter(parametro1));
            //int valor=Integer.parseInt(request.getParameter(parametro2));
           // System.out.println("Id perfil: "+idp);
           // perfil_estudianteDTO p= new perfil_estudianteDTO();
           // p.setCodigoestudiante(codigo);
           // p.setIdperfil(idp);
           // p.setValor(valor);
           // perfiles[ciclo]=p;
        //}else{
          //  System.out.println("No ha llenado los datos");
        //}
        ciclo++;
    }
    
    f.agregarPerfilEstudiante(perfiles);
    
               
    %>

    <%
        
     
response.sendRedirect("registro_estudiante.jsp");


%>