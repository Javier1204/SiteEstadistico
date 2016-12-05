<%-- 
    Document   : construirExcel
    Created on : 30/11/2016, 04:56:25 PM
    Author     : DiegoLeal
--%>

<%@page import="org.apache.poi.ss.usermodel.CreationHelper"%>
<%@page import="org.apache.poi.sl.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRichTextString"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="java.io.FileOutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controller" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
<%
    //String rutaAlter = System.getProperty("user.dir");
    String rutaAlter = System.getProperty("user.home");
    System.out.println(System.getProperty("user.home"));
    
    HSSFWorkbook libro = new HSSFWorkbook();

    // Se crea una hoja dentro del libro
    HSSFSheet hoja = libro.createSheet();

    // Se crea una fila dentro de la hoja
    HSSFRow fila = hoja.createRow(0);

    // Se crea una celda dentro de la fila
    HSSFCell celda = fila.createCell((short) 0);

    // Se crea el contenido de la celda y se mete en ella.
    HSSFRichTextString texto = new HSSFRichTextString("hola mundo");
    celda.setCellValue(texto);

    
    
    
    
   
    // Se salva el libro.
    try {
        //FileOutputStream elFichero = new FileOutputStream("holamundo.xls");
        FileOutputStream archivo = new FileOutputStream(rutaAlter + "/holaMundo.xls");
        libro.write(archivo);
        archivo.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    
%>