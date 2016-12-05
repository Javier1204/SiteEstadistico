<%-- 
    Document   : consultarPdf
    Created on : 29/11/2016, 07:05:08 PM
    Author     : Victor Urbina
--%>
<%@page import="CargaAcademica.DAO.DAOCargaAcademica"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="com.itextpdf.text.html.WebColors"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.itextpdf.text.*" %>

<a href=></a>
<%
    FileOutputStream archivo = new FileOutputStream("C:/xampp/htdocs/SiteEstadistico/web/Carga academica/informes/docentesExtension.pdf");
    Document documento = new Document(PageSize.LETTER, 5, 5, 5, 5);

    PdfWriter.getInstance(documento, archivo);
    documento.open();
    Paragraph salto = new Paragraph(new Phrase(Chunk.NEWLINE));
    
    Image img = Image.getInstance("C:/xampp/htdocs/SiteEstadistico/web/public/img/Banner-superior.png");
    float scaler = ((documento.getPageSize().getWidth() - documento.leftMargin()- documento.rightMargin() - 0) / img.getWidth()) * 100;
    img.scalePercent(scaler);
    documento.add(img);
    img.setAlignment(Element.ALIGN_CENTER);
    img.scaleAbsoluteWidth(22);
    img.scaleAbsoluteHeight(10);

    documento.add(salto);
    PdfPTable tabla = new PdfPTable(4);
    PdfPCell titulo = new PdfPCell(new Paragraph("Carga Académica Docentes-Docentes Extensión", FontFactory.getFont("arial", 14, Font.BOLD)));
    titulo.setColspan(4);
    titulo.setHorizontalAlignment(Element.ALIGN_CENTER);
    titulo.setBorderColor(BaseColor.BLACK);
    tabla.addCell(titulo);
    
     DAOCargaAcademica c=new DAOCargaAcademica();
    String profes[]=c.consultarDocentesExtension().split(",");
    PdfPCell encabeC = new PdfPCell(new Paragraph("Codigo", FontFactory.getFont("arial", 12, Font.BOLD)));
    encabeC.setColspan(1);
    encabeC.setHorizontalAlignment(Element.ALIGN_CENTER);
    tabla.addCell(encabeC);
    PdfPCell encabeN = new PdfPCell(new Paragraph("Nombre", FontFactory.getFont("arial", 12, Font.BOLD)));
    encabeN.setColspan(3);
    encabeN.setHorizontalAlignment(Element.ALIGN_CENTER);
    tabla.addCell(encabeN);
    
    for(int i=0;i<profes.length;i++){
            String ing[]=profes[i].split("-");
            String cod=ing[0];
            String nom=ing[1];
            
            
    PdfPCell aa = new PdfPCell(new Paragraph(cod, FontFactory.getFont("arial", 12)));
    aa.setColspan(1);
    aa.setHorizontalAlignment(Element.ALIGN_CENTER);
    tabla.addCell(aa);
    PdfPCell bb = new PdfPCell(new Paragraph(nom, FontFactory.getFont("arial", 12)));
    bb.setColspan(3);
    bb.setHorizontalAlignment(Element.ALIGN_CENTER);
    tabla.addCell(bb);
            
    }
    
    documento.add(tabla);
    documento.close();
request.getSession().setAttribute("pdf","Exito generó el pdf Docentes de Extensión");
response.sendRedirect("../consultas.jsp");
%>
