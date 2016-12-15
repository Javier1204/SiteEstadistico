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
    int codigo = Integer.parseInt(request.getParameter("codigoEst"));
    
    while(ciclo<=cantidad){
        System.out.println(request.getParameter("valor"+ciclo+"")); 
        if(request.getParameter("valor"+ciclo+"")!=null){
            int idp=Integer.parseInt(request.getParameter("idperfil"+ciclo));
            int valor=Integer.parseInt(request.getParameter("valor"+ciclo));
            System.out.println("Id perfil: "+idp);
            perfil_estudianteDTO p= new perfil_estudianteDTO();
            p.setCodigoestudiante(codigo);
            p.setIdperfil(idp);
            p.setValor(valor);
            perfiles[ciclo]=p;
        }else{
            System.out.println("No ha llenado los datos");
        }
        ciclo++;
    }
    
    f.agregarPerfilesEstudiante(perfiles);
    
               
    %>

    <%
        
     
response.sendRedirect("registro_estudiante.jsp");


%>