<%-- 
    Document   : informe
    Created on : 14/12/2016, 09:15:27 AM
    Author     : tuto2
--%>


<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="academico.DTO.ProyectoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="academico.Facade.Facade"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setContentType("application/pdf");
    Rectangle pageSize = new Rectangle(600f, 600f);
    Document document = new Document();
    document = new Document(PageSize.LETTER, 5, 5, 5, 5);
    
    System.out.println("Swew");
    
    PdfWriter.getInstance(document, response.getOutputStream());
    try {
    System.out.println("Swew");
    
    document.addTitle("Informe.pdf");
    document.open();
    Image image = Image.getInstance("C:/Users/tuto2/Dropbox/Integrador III/jav/SiteEstadistico/web/public/img/Banner-superior.png");
    
    System.out.println("Swew");
    image.scaleAbsolute(80f, 60f);
    
    PdfPTable table2 = new PdfPTable(1);
    PdfPCell celda = new PdfPCell(image);
    table2.addCell(celda);
            
    System.out.println("Swew");
    document.add(table2);
     image.setAlignment(Element.ALIGN_CENTER);
    image.scaleAbsoluteWidth(22);
    image.scaleAbsoluteHeight(10);
    System.out.println("Swew");
    int cod_grp = Integer.parseInt(request.getParameter("cod_grupo"));
    Facade fachada = new Facade();
    String nombre_asignatura = fachada.obtenerNombreMateria(cod_grp);
System.out.println("Swew");
    PdfPTable table = new PdfPTable(4);
    PdfPCell titulo = new PdfPCell(new Paragraph("Proyectos de clase de " + nombre_asignatura, FontFactory.getFont("arial", 14, Font.BOLD)));
    titulo.setColspan(4);
    titulo.setHorizontalAlignment(Element.ALIGN_CENTER);
    titulo.setBorderColor(BaseColor.BLACK);
    table.addCell(titulo);

    PdfPCell texto = new PdfPCell(new Paragraph("Nombre proyecto", FontFactory.getFont("arial", 14, Font.BOLD)));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph("Nombre equipo", FontFactory.getFont("arial", 14, Font.BOLD)));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph("Descripción", FontFactory.getFont("arial", 14, Font.BOLD)));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph("Estado", FontFactory.getFont("arial", 14, Font.BOLD)));
    table.addCell(texto);

    ArrayList<ProyectoDTO> lista = fachada.obtenerProyectos(cod_grp);

    for (ProyectoDTO dto : lista) {
        texto = new PdfPCell(new Paragraph(dto.getProyecto_name()));
        table.addCell(texto);

        texto = new PdfPCell(new Paragraph(dto.getEquipo_encargado()));
        table.addCell(texto);

        texto = new PdfPCell(new Paragraph(dto.getDesc()));
        table.addCell(texto);

        texto = new PdfPCell(new Paragraph("estado"));
        table.addCell(texto);
    }

    document.add(new Phrase(Chunk.NEWLINE));
    document.add(new Phrase(Chunk.NEWLINE));

    table = new PdfPTable(2);
    titulo = new PdfPCell(new Paragraph("Estado proyectos", FontFactory.getFont("arial", 14, Font.BOLD)));
    titulo.setColspan(2);
    titulo.setHorizontalAlignment(Element.ALIGN_CENTER);
    titulo.setBorderColor(BaseColor.BLACK);
    table.addCell(titulo);

    texto = new PdfPCell(new Paragraph("Estado", FontFactory.getFont("arial", 14, Font.BOLD)));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph("Numero de proyectos", FontFactory.getFont("arial", 14, Font.BOLD)));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph("Completados"));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph(""));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph("En proceso"));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph(""));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph("No completados"));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph(""));
    table.addCell(texto);

    document.add(new Phrase(Chunk.NEWLINE));
    document.add(new Phrase(Chunk.NEWLINE));

    table = new PdfPTable(2);
    titulo = new PdfPCell(new Paragraph("Tipo de proyecto", FontFactory.getFont("arial", 14, Font.BOLD)));
    titulo.setColspan(2);
    titulo.setHorizontalAlignment(Element.ALIGN_CENTER);
    titulo.setBorderColor(BaseColor.BLACK);
    table.addCell(titulo);

    texto = new PdfPCell(new Paragraph("Tipo", FontFactory.getFont("arial", 14, Font.BOLD)));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph("Numero de proyectos", FontFactory.getFont("arial", 14, Font.BOLD)));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph("Investigacion"));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph(""));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph("Desarrollo de software"));
    table.addCell(texto);

    texto = new PdfPCell(new Paragraph(""));
    table.addCell(texto);

   } catch (Exception ex) {
        ex.printStackTrace();
    }


%>
