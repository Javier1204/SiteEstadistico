<%-- 
    Document   : registrarConvenio_pro2
    Created on : 30/11/2016, 03:53:13 PM
    Author     : HeinerV
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="Internacionalizacion.Modelo.DTO.Tipo_actividades"%>
<%@page import="java.util.ArrayList"%>

<%@page import="Internacionalizacion.Facade.Facade"%>
<%
   /*response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    
    String ruta = "";
    String msg = "";
 
  
    String ubicacion = getServletContext().getRealPath("/") + "files/"; // Ubicacion donde se guarda el archivo
    DiskFileItemFactory factory = new DiskFileItemFactory();
    factory.setSizeThreshold(1024);
    factory.setRepository(new File(ubicacion));
    ServletFileUpload upload = new ServletFileUpload(factory);
    upload.setHeaderEncoding("UTF-8");
   
    try {
        List<FileItem> partes = upload.parseRequest(request);
        for (FileItem item : partes) {
           
            if (item.getName() != null) {   
                ruta = item.getName();
                File file = new File(ubicacion, item.getName()); 
                item.write(file);           
            } else {
                msg+= new String(item.getString().getBytes("ISO-8859-1"),"UTF-8") + ";";  // Se capturan los datos del par
            }
        }
    } catch (FileUploadException ex) {
        out.write("Error al subir archivo " + ex.getMessage());
    }
   
    String url = "files/"+ruta; // Url del archivo
    String v[] = msg.split(";");
    

    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
    Date fecha = formato.parse(v[0]);
    java.sql.Date fechaRegistro = new java.sql.Date(fecha.getTime());
    
    if(Integer.parseInt(v[1]) == 0)
    {
	    if(obj.addAnteproyecto(v[2], v[3],  v[4],  Integer.parseInt(v[6]),  Boolean.parseBoolean(v[7]),  v[8], url,  Integer.parseInt(v[5]),  fechaRegistro, "Anteproyecto", "grupoInv", "lineaInv")){	    	
     %>
            <script>
	    	alert("El registro del Anteproyecto fue exitoso");  
	    	location.href="Registro.jsp"; 
	    	</script>
	    	<% 
	    }
*/
    }