<%-- 
    Document   : construirExcel
    Created on : 30/11/2016, 04:56:25 PM
    Author     : Victor Urbina
--%>

<%@page import="CargaAcademica.DAO.DAOCargaAcademica"%>
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
<%
    
    HSSFWorkbook libro = new HSSFWorkbook();

    // Se crea una hoja dentro del libro
    HSSFSheet hoja = libro.createSheet();
    
     // Se crea una fila dentro de la hoja
    HSSFRow fil = hoja.createRow(0);
    // Se crea una celda dentro de la fila
    HSSFCell celd = fil.createCell((short) 0);
    // Se crea el contenido de la celda y se mete en ella.
    HSSFRichTextString texto = new HSSFRichTextString("LISTADO TODOS LOS DOCENTES");
    celd.setCellValue(texto);
    
    
    DAOCargaAcademica c=new DAOCargaAcademica();
    String profes[]=c.consultarDocentes().split(",");
    for(int i=0;i<profes.length;i++){
            String ing[]=profes[i].split("-");
            String cod=ing[0];
            String nom=ing[1];

    
    // Se crea una fila dentro de la hoja
    HSSFRow fila = hoja.createRow(i+1);
    // Se crea una celda dentro de la fila
    HSSFCell celda = fila.createCell((short)0);
    // Se crea el contenido de la celda y se mete en ella.
    HSSFRichTextString text = new HSSFRichTextString(cod);
    celda.setCellValue(text);
    
    HSSFCell celda2 = fila.createCell((short)1);
    // Se crea el contenido de la celda y se mete en ella.
    HSSFRichTextString text2 = new HSSFRichTextString(nom);
    celda2.setCellValue(text2);
    }
    
   
    // Se salva el libro.
    try {
        FileOutputStream archivo = new FileOutputStream("C:/xampp/htdocs/SiteEstadistico/web/Carga academica/informes/todosDocentes.xls");
        libro.write(archivo);
        archivo.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
request.getSession().setAttribute("excel","Exito generó el excel de todos los Docentes");
response.sendRedirect("../consultas.jsp");
%>