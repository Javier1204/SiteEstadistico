
<%@page import="academico.Facade.Facade"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url_imagen = null;

    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    String id_pro = "";
    String rutaServer = getServletContext().getRealPath("/");
    rutaServer += "proyectos de clase/temp/";
    // req es la HttpServletRequest que recibimos del formulario.
    // Los items obtenidos serán cada uno de los campos del formulario,
    // tanto campos normales como ficheros subidos.
    List items = upload.parseRequest(request);
    // Se recorren todos los items, que son de tipo FileItem
    for (Object item : items) {
        FileItem uploaded = (FileItem) item;
        // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
        // subido donde nos interese
        if (!uploaded.isFormField()) {
            // No es campo de formulario, guardamos el fichero en algún sitio
            url_imagen = "proyectos de clase/temp/" + uploaded.getName();
            File fichero = new File(rutaServer, uploaded.getName());
            uploaded.write(fichero);
        } else {
            // es un campo de formulario, podemos obtener clave y valor
            String key = uploaded.getFieldName();
            out.println(key);
            String valor = uploaded.getString();
            out.println(valor);
            if (key.equalsIgnoreCase("id_pro")) {
                id_pro = valor;
            }
        }
    }
    Facade fachada = new Facade();

    boolean exito = fachada.subirEntregable(Integer.parseInt(id_pro), url_imagen);

    String resp = "";
    if (exito) {
        resp = "S";
        response.sendRedirect("../consultarProyectosEst.jsp");
    } else {
        resp = "N";
        response.sendRedirect("../subirEntregables.jsp?proyecto="+id_pro);
    }
%>
