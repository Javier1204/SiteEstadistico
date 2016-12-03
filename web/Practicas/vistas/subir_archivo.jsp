<%-- 
    Document   : subir_archivo
    Created on : 30/11/2016, 03:01:18 PM
    Author     : Usuario
--%>


<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="Practicas.DAO.estudianteDAO"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="Practicas.Facade.Facade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <%
       System.out.println(request.getParameter("hv")!=null);
       System.out.println(request.getParameter("afiliacion")!=null);
       System.out.println(request.getParameter("cedula")!=null);
       System.out.println(request.getParameter("horario")!=null);
       Facade dao= new Facade();
       estudianteDAO di= new estudianteDAO();
       
       FileItemFactory file_factory = new DiskFileItemFactory();
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
        List items = servlet_up.parseRequest(request);
        String nombre="";
        String pacth="";
        
       if(request.getParameter("hv")!=null){
        System.out.println("Reconoce el parametro hv");
        for(int i=0;i<items.size();i++){
            
            FileItem item = (FileItem) items.get(i);
            
            if (! item.isFormField()){
                String dt= item.getName().toString();
                String[] desglose = dt.split("\\.");
                nombre= "hv."+desglose[1];
                //String pacth=  di.pedirDireccion(request);
                pacth = request.getRealPath("../documentos/Estudiantes");
                File archivo_server = new File(pacth+"/"+dt);
                item.write(archivo_server);
                System.out.println(item.getName());
            }
        }
       } else if(request.getParameter("afiliacion")!=null){
           System.out.println("Reconoce el parametro afiliacion");
        for(int i=0;i<items.size();i++){
            
            FileItem item = (FileItem) items.get(i);
            
            if (! item.isFormField()){
                String dt= item.getName().toString();
                String[] desglose = dt.split("\\.");
                nombre= "afiliacion."+desglose[1];
                //String pacth=  di.pedirDireccion(request);
                pacth = request.getRealPath("../documentos/Estudiantes");
                File archivo_server = new File(pacth+"/"+dt);
                item.write(archivo_server);
                System.out.println(item.getName());
            }
        }
   } else if(request.getParameter("horario")!=null){
       System.out.println("Reconoce el parametro horario");
        for(int i=0;i<items.size();i++){
            
            FileItem item = (FileItem) items.get(i);
            
            if (! item.isFormField()){
                String dt= item.getName().toString();
                String[] desglose = dt.split("\\.");
                nombre= "horario."+desglose[1];
                //String pacth=  di.pedirDireccion(request);
                pacth = request.getRealPath("../documentos/Estudiantes");
                File archivo_server = new File(pacth+"/"+nombre);
                item.write(archivo_server);
                System.out.println(item.getName());
            }
        }
   } else if(request.getParameter("cedula")!=null){
       System.out.println("Reconoce el parametro cedula");
        for(int i=0;i<items.size();i++){
            
            FileItem item = (FileItem) items.get(i);
            
            if (! item.isFormField()){
                String dt= item.getName().toString();
                String[] desglose = dt.split("\\.");
                nombre= "cedula."+desglose[1];
                //String pacth=  di.pedirDireccion(request);
                pacth = request.getRealPath("../documentos/Estudiantes");
                File archivo_server = new File(pacth+"/"+nombre);
                item.write(archivo_server);
                System.out.println(item.getName());
            }
        }
   }


%>
    
     
    
<%
response.sendRedirect("registro_estudiante.jsp");

%>    