<%-- 
    Document   : registrarConvenio_pro2
    Created on : 30/11/2016, 03:53:13 PM
    Author     : HeinerV
--%>


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
    /*FileItemFactory es una interfaz para crear FileItem*/
    FileItemFactory file_factory = new DiskFileItemFactory();

    /*ServletFileUpload esta clase convierte los input file a FileItem*/
    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
    /*sacando los FileItem del ServletFileUpload en una lista */
    List items = servlet_up.parseRequest(request);
    boolean[] actividades = new boolean[6];
    String ruta="",nombre = "", radicado = "", descripcion = "", tipo_convenio = "", fecharadicacion = "", fechainicio = "",vigencia ="";
    int entidad = 0 ;
    Tipo_actividades act = new Tipo_actividades();
     Facade f = new Facade();
    for (int i = 0; i < items.size(); i++) {
        /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
        FileItem item = (FileItem) items.get(i);
        /*item.isFormField() false=input file; true=text field*/
        if (item.getName() != null) {
            if (!item.isFormField()) {
                ruta = f.nameRandom()+".pdf";
                /*cual sera la ruta al archivo en el servidor*/
                File archivo_server = new File(getServletContext().getRealPath("/") + "Internacionalizacion/actas/" + ruta );
                /*y lo escribimos en el servido*/
                item.write(archivo_server);
                System.out.println("Nombre --> " + item.getName());
                out.print("<br> Tipo --> " + item.getContentType());
                out.print("<br> tamaño --> " + (item.getSize() / 1024) + "KB");
                out.print("<br>");
            }
        } else {

            if (item.getFieldName().toString().equalsIgnoreCase("nombre")) {
                nombre = item.getString();
            }
            if (item.getFieldName().toString().equalsIgnoreCase("radicado")) {
                radicado = item.getString();
            }
            if (item.getFieldName().toString().equalsIgnoreCase("descripcion")) {
                descripcion = item.getString();
            }
            if (item.getFieldName().toString().equalsIgnoreCase("tipo_convenio")) {
                tipo_convenio = item.getString();
            }
            if (item.getFieldName().toString().equalsIgnoreCase("movilidad")) {
                act.setMovilidad(true);
            }
            if (item.getFieldName().toString().equalsIgnoreCase("pasantia")) {
                act.setPasantia(true);
            }
            if (item.getFieldName().toString().equalsIgnoreCase("extension")) {
                act.setExtension(true);
            }
            if (item.getFieldName().toString().equalsIgnoreCase("investigacion")) {
                act.setInvestigacion(true);
            }
            if (item.getFieldName().toString().equalsIgnoreCase("social")) {
                act.setSocial(true);
            }
            if (item.getFieldName().toString().equalsIgnoreCase("practica")) {
                act.setPractica(true);
            }
            if (item.getFieldName().toString().equalsIgnoreCase("fecharadicacion")) {
                fecharadicacion = item.getString();
            }
            if (item.getFieldName().toString().equalsIgnoreCase("fechainicio")) {
                fechainicio = item.getString();
            }
            if (item.getFieldName().toString().equalsIgnoreCase("vigencia")) {
                vigencia = ""+Integer.parseInt(item.getString());
            }
            if (item.getFieldName().toString().equalsIgnoreCase("entidad")) {
                entidad = Integer.parseInt(item.getString());
            }

            System.out.println("descrip: " + item.getFieldName() + item.getString());
            System.out.println("<br>");
        }
    }

    String[] fecha1 = fechainicio.split("-");

    
    Calendar calendar1 = new GregorianCalendar(Integer.parseInt(fecha1[0]), Integer.parseInt(fecha1[1]), Integer.parseInt(fecha1[2]));
    Date f1 = new Date(calendar1.getTimeInMillis());
    
    calendar1.add(Calendar.MONTH, Integer.parseInt(vigencia));//para pasarle por meses
   
    String fechaterminacion = calendar1.get(Calendar.YEAR)+"-"+calendar1.get(Calendar.MONTH)+"-"+calendar1.get(Calendar.DATE); 
    

    System.out.println(fecharadicacion);

    

    
    String estado = "Aprobado";
System.out.println(ruta);
   
    String url = "actas/"+ruta;
    System.out.println(url);
    String r = f.registrarConvenio(radicado, nombre, descripcion, fecharadicacion, fechainicio, fechaterminacion, vigencia, estado, tipo_convenio, entidad,url);
    String id = f.consultarConvenio(radicado).getId();
    System.out.println(r + " va la otra mrd");
    System.out.println(
            "El id del convenio es------------------" + id);
    act.setIdconvenio(id);
    f.RegistrarTipo_Actividades(act);
    System.out.println(r + " termino de registrar  la otra mrd");
    System.out.println(url);
    response.sendRedirect("registrarConvenio.jsp");

%>
