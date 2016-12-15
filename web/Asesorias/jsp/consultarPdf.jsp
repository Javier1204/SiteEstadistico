<%-- 
    Document   : consultarPdf
    Created on : 29/11/2016, 07:05:08 PM
    Author     : DiegoLeal
--%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="com.itextpdf.text.html.WebColors"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.itextpdf.text.*" %>
<jsp:useBean id="facade" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
<%
    ICuenta cuenta = (ICuenta) session.getAttribute("usuario");
    String codDoc = cuenta.getNombre();
    String periodo = request.getParameter("periodo").toString();
    String año = request.getParameter("ano").toString();
    //Consultar cantidad de asesorias por docente
    //cantidad Asesorias, nombre, apellido, codigo docente
    String cantAsesoriasDocente = facade.consultarCantAsesoriasDocente(codDoc, periodo, año);
    System.out.println("cantidad de asesorias por docente: " + cantAsesoriasDocente);

    
    String rutaPrueba = getServletContext().getRealPath("/Asesorias/jsp/informe/").replace("./", "/");
    System.out.println("ruta de prueba:: " + rutaPrueba );
    //System.out.println("ruta 1:: " + System.getProperty("user.dir"));
    String rutaAlter = System.getProperty("user.dir");
    System.out.println("Esta es la ruta:" + rutaAlter);

    FileOutputStream archivo = new FileOutputStream(rutaPrueba + "/informe.pdf");
    System.out.println("user... " + rutaPrueba + "/informe.pdf");
    Document documento = new Document(PageSize.LETTER, 5, 5, 5, 5);

    //String rutaImagen = getServletContext().getRealPath("/Asesorias/diseno/img/logo.png");
    PdfWriter.getInstance(documento, archivo);
    documento.open();
    Paragraph salto = new Paragraph(new Phrase(Chunk.NEWLINE));
    documento.add(salto);

    Image img = Image.getInstance("./logoHorizontal.png");
    float scaler = ((documento.getPageSize().getWidth() - documento.leftMargin()
            - documento.rightMargin() - 0) / img.getWidth()) * 60;
    img.scalePercent(scaler);
    //documento.add(img);
    img.setAlignment(Element.ALIGN_CENTER);
    
    Image img2 = Image.getInstance("./logo.png");
    float scaler2 = ((documento.getPageSize().getWidth() - documento.leftMargin()
            - documento.rightMargin() - 0) / img.getWidth()) * 120;
    img2.scalePercent(scaler2);
    //documento.add(img);
    img2.setAlignment(Element.ALIGN_CENTER);
    
    
    PdfPTable tablaImagen = new PdfPTable(4);

    PdfPCell img1Tabla = new PdfPCell(img);
    img1Tabla.setColspan(3);
    img1Tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
    img1Tabla.setBorderColor(BaseColor.WHITE);
    tablaImagen.addCell(img1Tabla);
    
    PdfPCell img2Tabla = new PdfPCell(img2);
    img2Tabla.setColspan(3);
    img2Tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
    img2Tabla.setBorderColor(BaseColor.WHITE);
    tablaImagen.addCell(img2Tabla);
    
    documento.add(tablaImagen);
    
    
    //img.scaleAbsoluteWidth(22);
    //img.scaleAbsoluteHeight(10);

    /*PdfPTable tablaEncabezado = new PdfPTable(4);
     
     PdfPCell celdaImg = new PdfPCell(img);
     celdaImg.setRowspan(2);
     celdaImg.setColspan(1);
     celdaImg.setHorizontalAlignment(Element.ALIGN_CENTER);
     celdaImg.setBorderColor(BaseColor.WHITE);
     tablaEncabezado.addCell(celdaImg);
     PdfPCell titulo = new PdfPCell(new Paragraph("PROGRAMA INGENIERIA DE SISTEMAS", FontFactory.getFont("arial", 14, Font.BOLD)));
     titulo.setColspan(3);
     titulo.setRowspan(1);
     titulo.setHorizontalAlignment(Element.ALIGN_CENTER);
     titulo.setBorderColor(BaseColor.WHITE);
     tablaEncabezado.addCell(titulo);

     PdfPCell dir = new PdfPCell(new Paragraph("Estadistica del registro de asesorias",
     FontFactory.getFont("arial", 12)));
     dir.setColspan(3);
     dir.setRowspan(1);
     dir.setHorizontalAlignment(Element.ALIGN_CENTER);
     dir.setBorderColor(BaseColor.WHITE);
     tablaEncabezado.addCell(dir);
     documento.add(tablaEncabezado);
     */
    documento.add(salto);

    PdfPTable tablaCantAsesoriasDocente = new PdfPTable(4);

    PdfPCell tituloTabla1 = new PdfPCell(new Paragraph("CANTIDAD DE ASESORIAS REALIZADAS POR DOCENTES", FontFactory.getFont("arial", 14, Font.BOLD)));
    tituloTabla1.setColspan(4);
    tituloTabla1.setHorizontalAlignment(Element.ALIGN_CENTER);
    tituloTabla1.setBorderColor(BaseColor.BLACK);
    tablaCantAsesoriasDocente.addCell(tituloTabla1);

    PdfPCell nombreDocente = new PdfPCell(new Paragraph("Nombre del docente", FontFactory.getFont("arial", 12, Font.BOLD)));
    nombreDocente.setColspan(2);
    nombreDocente.setHorizontalAlignment(Element.ALIGN_CENTER);
    nombreDocente.setBorderColor(BaseColor.BLACK);
    tablaCantAsesoriasDocente.addCell(nombreDocente);

    PdfPCell tipoVinculacionDoc = new PdfPCell(new Paragraph("Tipo de vinculacion docente", FontFactory.getFont("arial", 12, Font.BOLD)));
    tipoVinculacionDoc.setColspan(1);
    tipoVinculacionDoc.setHorizontalAlignment(Element.ALIGN_CENTER);
    tipoVinculacionDoc.setBorderColor(BaseColor.BLACK);
    tablaCantAsesoriasDocente.addCell(tipoVinculacionDoc);

    PdfPCell cantAsesorias = new PdfPCell(new Paragraph("Cantidad de asesorias", FontFactory.getFont("arial", 12, Font.BOLD)));
    cantAsesorias.setColspan(1);
    cantAsesorias.setHorizontalAlignment(Element.ALIGN_CENTER);
    cantAsesorias.setBorderColor(BaseColor.BLACK);
    tablaCantAsesoriasDocente.addCell(cantAsesorias);

    if (!cantAsesoriasDocente.isEmpty()) {
        String v1[] = cantAsesoriasDocente.split(":");
        for (int i = 0; i < v1.length; i++) {
            String v2[] = v1[i].split(";");
            //cantidad Asesorias, nombre, apellido, codigo docente
            PdfPCell nombreDocenteValor = new PdfPCell(new Paragraph(v2[1] + " " + v2[2], FontFactory.getFont("arial", 12)));
            nombreDocenteValor.setColspan(2);
            nombreDocenteValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            nombreDocenteValor.setBorderColor(BaseColor.BLACK);
            tablaCantAsesoriasDocente.addCell(nombreDocenteValor);

            PdfPCell tipoVinculacionDocValor = new PdfPCell(new Paragraph("" + v2[4], FontFactory.getFont("arial", 12)));
            tipoVinculacionDocValor.setColspan(1);
            tipoVinculacionDocValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            tipoVinculacionDocValor.setBorderColor(BaseColor.BLACK);
            tablaCantAsesoriasDocente.addCell(tipoVinculacionDocValor);

            PdfPCell cantAsesoriasValor = new PdfPCell(new Paragraph("" + v2[0], FontFactory.getFont("arial", 12)));
            cantAsesoriasValor.setColspan(1);
            cantAsesoriasValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            cantAsesoriasValor.setBorderColor(BaseColor.BLACK);
            tablaCantAsesoriasDocente.addCell(cantAsesoriasValor);
        }
    }

    documento.add(tablaCantAsesoriasDocente);
    documento.add(salto);

    //consultar asesorias por materias
    //cantidad de asesorias, codigo de la materia, nombre de la materia, grupo
    String maxAsesoDoc = facade.consultarAsesoriasMaterias(periodo, año);
    System.out.println("Cantidad de asesorias por materia:: " + maxAsesoDoc);

    //TABLA
    PdfPTable tablaAsesoMaterias = new PdfPTable(3);

    PdfPCell tituloTabla2 = new PdfPCell(new Paragraph("CANTIDAD DE ASESORIAS REALIZADAS POR MATERIA", FontFactory.getFont("arial", 14, Font.BOLD)));
    tituloTabla2.setColspan(3);
    tituloTabla2.setHorizontalAlignment(Element.ALIGN_CENTER);
    tituloTabla2.setBorderColor(BaseColor.BLACK);
    tablaAsesoMaterias.addCell(tituloTabla2);

    PdfPCell infoMateria = new PdfPCell(new Paragraph("Materia", FontFactory.getFont("arial", 12, Font.BOLD)));
    infoMateria.setColspan(2);
    infoMateria.setHorizontalAlignment(Element.ALIGN_CENTER);
    infoMateria.setBorderColor(BaseColor.BLACK);
    tablaAsesoMaterias.addCell(infoMateria);

    PdfPCell cantAsesoriasMat = new PdfPCell(new Paragraph("Cantidad de asesorias", FontFactory.getFont("arial", 12, Font.BOLD)));
    cantAsesoriasMat.setColspan(1);
    cantAsesoriasMat.setHorizontalAlignment(Element.ALIGN_CENTER);
    cantAsesoriasMat.setBorderColor(BaseColor.BLACK);
    tablaAsesoMaterias.addCell(cantAsesoriasMat);

    if (!maxAsesoDoc.isEmpty()) {
        String v1[] = maxAsesoDoc.split(":");
        for (int i = 0; i < v1.length; i++) {
            //cantidad de asesorias, codigo de la materia, nombre de la materia, grupo
            String v2[] = v1[i].split(";");
            PdfPCell infoMateriaValor = new PdfPCell(new Paragraph(v2[1] + " - " + v2[3] + " - " + v2[2], FontFactory.getFont("arial", 12)));
            infoMateriaValor.setColspan(2);
            infoMateriaValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            infoMateriaValor.setBorderColor(BaseColor.BLACK);
            tablaAsesoMaterias.addCell(infoMateriaValor);

            PdfPCell cantAsesoriasMatValor = new PdfPCell(new Paragraph("" + v2[0], FontFactory.getFont("arial", 12)));
            cantAsesoriasMatValor.setColspan(1);
            cantAsesoriasMatValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            cantAsesoriasMatValor.setBorderColor(BaseColor.BLACK);
            tablaAsesoMaterias.addCell(cantAsesoriasMatValor);
        }
    }

    documento.add(tablaAsesoMaterias);

    documento.add(salto);

    //consultar cantidad de estudiantes por materia
    String cantEstMateria = facade.consultarEstudiantesMateria(periodo, año);
    System.out.println("cantidad de estudiantes que asistieron a asesoria: " + cantEstMateria);

    PdfPTable tablaCantAsesoEstMat = new PdfPTable(3);

    PdfPCell tituloTabla3 = new PdfPCell(new Paragraph("CANTIDAD DE ESTUDIANTES QUE ASISTIERON A ASESORIAS POR MATERIA", FontFactory.getFont("arial", 14, Font.BOLD)));
    tituloTabla3.setColspan(3);
    tituloTabla3.setHorizontalAlignment(Element.ALIGN_CENTER);
    tituloTabla3.setBorderColor(BaseColor.BLACK);
    tablaCantAsesoEstMat.addCell(tituloTabla3);

    PdfPCell infoMateriaEst = new PdfPCell(new Paragraph("Materia", FontFactory.getFont("arial", 12, Font.BOLD)));
    infoMateriaEst.setColspan(2);
    infoMateriaEst.setHorizontalAlignment(Element.ALIGN_CENTER);
    infoMateriaEst.setBorderColor(BaseColor.BLACK);
    tablaCantAsesoEstMat.addCell(infoMateriaEst);

    PdfPCell cantAsesoriasMatEst = new PdfPCell(new Paragraph("Cantidad de estudiantes", FontFactory.getFont("arial", 12, Font.BOLD)));
    cantAsesoriasMatEst.setColspan(1);
    cantAsesoriasMatEst.setHorizontalAlignment(Element.ALIGN_CENTER);
    cantAsesoriasMatEst.setBorderColor(BaseColor.BLACK);
    tablaCantAsesoEstMat.addCell(cantAsesoriasMatEst);

    if (!cantEstMateria.isEmpty()) {
        String v1[] = cantEstMateria.split(":");
        for (int i = 0; i < v1.length; i++) {
            String v2[] = v1[i].split(";");
            //calculo diferencial;1155101;A;1:
            PdfPCell infoMateriaEstValor = new PdfPCell(new Paragraph(v2[1] + " - " + v2[2] + " - " + v2[0], FontFactory.getFont("arial", 12)));
            infoMateriaEstValor.setColspan(2);
            infoMateriaEstValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            infoMateriaEstValor.setBorderColor(BaseColor.BLACK);
            tablaCantAsesoEstMat.addCell(infoMateriaEstValor);

            PdfPCell cantAsesoriasMatEstValor = new PdfPCell(new Paragraph("" + v2[3], FontFactory.getFont("arial", 12)));
            cantAsesoriasMatEstValor.setColspan(1);
            cantAsesoriasMatEstValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            cantAsesoriasMatEstValor.setBorderColor(BaseColor.BLACK);
            tablaCantAsesoEstMat.addCell(cantAsesoriasMatEstValor);
        }
    }

    documento.add(tablaCantAsesoEstMat);

    documento.add(salto);

    //consultar cantidad de horas de asesorias por docente
    //String horasAsesoriasDocente = facade.consultarHorasAsesoriasDocente();
    documento.close();
    
    out.print(rutaPrueba + "/informe.pdf");

%>
