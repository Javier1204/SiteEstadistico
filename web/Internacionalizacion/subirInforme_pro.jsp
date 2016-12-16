
<%@page import="Internacionalizacion.Modelo.DAO.DAOConvenio"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="Internacionalizacion.Modelo.DTO.Tipo_actividades"%>
<%@page import="java.util.ArrayList"%>

<%@page import="Internacionalizacion.Facade.Facade"%>
<%
    request.setCharacterEncoding("UTF-8");
    /*FileItemFactory es una interfaz para crear FileItem*/
    FileItemFactory file_factory = new DiskFileItemFactory();

    /*ServletFileUpload esta clase convierte los input file a FileItem*/
    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
    /*sacando los FileItem del ServletFileUpload en una lista */
    List items = servlet_up.parseRequest(request);
    
    String  ruta="",nombre = "", radicado = "", descripcion = "";
    int año=0, semestre=0;
    int entidad = 0 ;
    
    
    for (int i = 0; i < items.size(); i++) {
        /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
        FileItem item = (FileItem) items.get(i);
        /*item.isFormField() false=input file; true=text field*/
        if (item.getName() != null) {
            if (!item.isFormField()) {
                ruta = item.getName();
                /*cual sera la ruta al archivo en el servidor*/
                File archivo_server = new File(getServletContext().getRealPath("/") + "Internacionalizacion/public/" + ruta );
                /*y lo escribimos en el servido*/
                item.write(archivo_server);
                System.out.println("Nombre --> " + item.getName());
                out.print("<br> Tipo --> " + item.getContentType());
                out.print("<br> tamaÃ±o --> " + (item.getSize() / 1024) + "KB");
                out.print("<br>");
            }
        } else {

            if (item.getFieldName().toString().equalsIgnoreCase("nombre")) {
                nombre = item.getString();
            }
            
            if (item.getFieldName().toString().equalsIgnoreCase("descripcion")) {
                descripcion = item.getString();
            }
            
           
            if (item.getFieldName().toString().equalsIgnoreCase("año")) {
                año = Integer.parseInt(item.getString());
            }
            if (item.getFieldName().toString().equalsIgnoreCase("semestre")) {
                semestre = Integer.parseInt(item.getString());
            }
            
            System.out.println("descrip: " + item.getFieldName() + item.getString()) ;
            System.out.println("<br>");
        }
    }

    
System.out.println(ruta);
   DAOConvenio subir= new DAOConvenio();
    String url = "public/"+ruta;
    System.out.println(url);
    String r = subir.subirInforme(nombre, descripcion,año, semestre, url);
    
    
    System.out.println(r + " termino de subir el informe");
    System.out.println(url);
    response.sendRedirect("registrarConvenio.jsp");

%>