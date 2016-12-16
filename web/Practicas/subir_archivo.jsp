<%-- 
    Document   : subir_archivo
    Created on : 30/11/2016, 03:01:18 PM
    Author     : Usuario
--%>


<%@page import="java.util.regex.Pattern"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.util.Iterator"%>
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
       
       boolean rta=false;
   
        try{ 
            
        if (ServletFileUpload.isMultipartContent(request)){ 
        ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory()); 
        System.out.println("ENTRA");
        /* Al ser multiparte, con servletFileUpload.parseRequest(request) recibimos una lista de FileItem. */ 
        List fileItemsList = servletFileUpload.parseRequest(request); 

        String optionalFileName = ""; 

        /* FileItem es un campo simple, del tipo nombre-valor*/ 
        FileItem fileItem = null; 
        Iterator it = fileItemsList.iterator(); 
        String fieldName=null; 
        String value=null; 
        
        while (it.hasNext()){ 
            FileItem fileItemTemp = (FileItem)it.next(); 
            
            if (fileItemTemp.isFormField()){ 
                fieldName=fileItemTemp.getFieldName(); 
                value=fileItemTemp.getString();	

                if (fileItemTemp.getFieldName().equals("filename")) 
                    optionalFileName = fileItemTemp.getString(); 
            } else 
                fileItem = fileItemTemp; 
        } 

        if (fileItem!=null){ 
        // Nombre del archivo a cargar 
            String fileName = fileItem.getFieldName(); 


        System.out.println("Info del fichero cargado: "); 

        /*Nos dice el tipo de fichero. Ej.: .jpg (image/jpge), .txt (text/plain) ...)*/ 

        System.out.println("Tipo de fichero: "+fileItem.getContentType()+"\n"); 
        System.out.println("Nombre del campo: "+fileItem.getFieldName()+"\n"); 
        System.out.println("Nombre del fichero: "+fileName+"\n"); 
        System.out.println("Tamaño del fichero: "+fileItem.getSize()+"\n"); 


        /* Guardar el fichero cargado si su tamaño es mayor que 0. */ 
        if (fileItem.getSize() > 0){ 
            if (optionalFileName.trim().equals("")) 
                fileName = FilenameUtils.getName(fileName); 
            else 
                fileName = optionalFileName; 
            
            String dirName = request.getServletContext().getRealPath("/") + ("Practicas/documentos/"+fileName);
            String dir="documentos/"+fileName;
            
            File saveTo = new File(dirName); 
            System.out.println("direccion: "+dir);
            System.out.println("GUARDADO EN: "+saveTo+"\n"); 
        try { 
            fileItem.write(saveTo); 

        System.out.println("El fichero cargado se ha guardado correctamente.\n"); 
            
            Facade f= new Facade();
            rta=f.guardarDocumentos(fileName, dir);
            

        } //try 
        catch (Exception e){ 
        System.out.println("\n"+e.getMessage()+""); 
        System.out.println("\n Ha ocurrido un error cuando intentábamos guardar el fichero cargado."); 
        } 
        } // if 
        } // if 
        } // while 
        } //try 
        catch(Exception e) 
        { 
        }

%>
    
     
    
<%
response.sendRedirect("registro_estudiante.jsp");

%>    