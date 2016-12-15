<%-- 
    Document   : formatoAsesoriasPDF
    Created on : 4/12/2016, 09:37:49 AM
    Author     : DiegoLeal
--%>

<%@page import="gestionUsuarios.ICuenta"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.io.FileOutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="asesorias.Controller.ControladorAsesorias" scope="session"></jsp:useBean>
<%
    ICuenta cuenta = (ICuenta) session.getAttribute("usuario");
    String codDoc = cuenta.getNombre();

    //String periodo = request.getParameter("periodo").toString();
    //String año = request.getParameter("ano").toString();
    String rutaPrueba = getServletContext().getRealPath("/Asesorias/jsp/informe/").replace("./", "/");
    String rutaAlter = System.getProperty("user.dir");
    System.out.println("Esta es la ruta:" + rutaPrueba);

    String nombreDocente = facade.consultarNombreDocente(codDoc);

    FileOutputStream archivo = new FileOutputStream(rutaPrueba + "/Asesorias Docente " + nombreDocente + ".pdf");
    System.out.println("user... " + rutaPrueba + "/Asesorias Docente " + nombreDocente + ".pdf");
    Document documento = new Document(PageSize.A4.rotate(), 0, 0, 0, 0);

    //String rutaImagen = getServletContext().getRealPath("/Asesorias/diseno/img/logo.png");
    PdfWriter.getInstance(documento, archivo);
    documento.open();
    Paragraph salto = new Paragraph(new Phrase(Chunk.NEWLINE));
    documento.add(salto);

    PdfPTable tablaInfoDocente = new PdfPTable(8);

    PdfPCell celdaCodigo = new PdfPCell(new Paragraph("Código:", FontFactory.getFont("arial", 14, Font.BOLD)));
    celdaCodigo.setColspan(1);
    celdaCodigo.setHorizontalAlignment(Element.ALIGN_CENTER);
    celdaCodigo.setBorderColor(BaseColor.BLACK);
    celdaCodigo.setBorderColorRight(BaseColor.WHITE);
    tablaInfoDocente.addCell(celdaCodigo);

    PdfPCell celdaCodigoValor = new PdfPCell(new Paragraph("1150101", FontFactory.getFont("arial", 14)));
    celdaCodigoValor.setColspan(1);
    celdaCodigoValor.setHorizontalAlignment(Element.ALIGN_CENTER);
    celdaCodigoValor.setBorderColor(BaseColor.BLACK);
    celdaCodigoValor.setBorderColorLeft(BaseColor.WHITE);
    tablaInfoDocente.addCell(celdaCodigoValor);

    PdfPCell celdaNombre = new PdfPCell(new Paragraph("Nombre Profesor:", FontFactory.getFont("arial", 14, Font.BOLD)));
    celdaNombre.setColspan(2);
    celdaNombre.setHorizontalAlignment(Element.ALIGN_CENTER);
    celdaNombre.setBorderColor(BaseColor.BLACK);
    celdaNombre.setBorderColorRight(BaseColor.WHITE);
    tablaInfoDocente.addCell(celdaNombre);

    PdfPCell celdaNombreValor = new PdfPCell(new Paragraph(" " + nombreDocente, FontFactory.getFont("arial", 14)));
    celdaNombreValor.setColspan(2);
    celdaNombreValor.setHorizontalAlignment(Element.ALIGN_CENTER);
    celdaNombreValor.setBorderColor(BaseColor.BLACK);
    celdaNombreValor.setBorderColorLeft(BaseColor.WHITE);
    tablaInfoDocente.addCell(celdaNombreValor);

    PdfPCell celdaFecha = new PdfPCell(new Paragraph("Fecha (mes/año):", FontFactory.getFont("arial", 14, Font.BOLD)));
    celdaFecha.setColspan(1);
    celdaFecha.setHorizontalAlignment(Element.ALIGN_CENTER);
    celdaFecha.setBorderColor(BaseColor.BLACK);
    celdaFecha.setBorderColorRight(BaseColor.WHITE);
    tablaInfoDocente.addCell(celdaFecha);

    PdfPCell celdaFechaValor = new PdfPCell(new Paragraph(" " + "12/2016", FontFactory.getFont("arial", 14)));
    celdaFechaValor.setColspan(1);
    celdaFechaValor.setHorizontalAlignment(Element.ALIGN_CENTER);
    celdaFechaValor.setBorderColor(BaseColor.BLACK);
    celdaFechaValor.setBorderColorLeft(BaseColor.WHITE);
    tablaInfoDocente.addCell(celdaFechaValor);

    documento.add(tablaInfoDocente);

    documento.add(salto);

    PdfPTable tablaAsesorias = new PdfPTable(25);

    PdfPCell numeroAseso = new PdfPCell(new Paragraph("No", FontFactory.getFont("arial", 14, Font.BOLD)));
    numeroAseso.setColspan(1);
    numeroAseso.setHorizontalAlignment(Element.ALIGN_CENTER);
    numeroAseso.setBorderColor(BaseColor.BLACK);
    tablaAsesorias.addCell(numeroAseso);

    PdfPCell codigoAsig = new PdfPCell(new Paragraph("Código Asig", FontFactory.getFont("arial", 14, Font.BOLD)));
    codigoAsig.setColspan(2);
    codigoAsig.setHorizontalAlignment(Element.ALIGN_CENTER);
    codigoAsig.setBorderColor(BaseColor.BLACK);
    tablaAsesorias.addCell(codigoAsig);

    PdfPCell nombreAsig = new PdfPCell(new Paragraph("Nombre Asignatura", FontFactory.getFont("arial", 14, Font.BOLD)));
    nombreAsig.setColspan(4);
    nombreAsig.setHorizontalAlignment(Element.ALIGN_CENTER);
    nombreAsig.setBorderColor(BaseColor.BLACK);
    tablaAsesorias.addCell(nombreAsig);

    PdfPCell grupo = new PdfPCell(new Paragraph("Grp", FontFactory.getFont("arial", 14, Font.BOLD)));
    grupo.setColspan(1);
    grupo.setHorizontalAlignment(Element.ALIGN_CENTER);
    grupo.setBorderColor(BaseColor.BLACK);
    tablaAsesorias.addCell(grupo);

    PdfPCell nombreApellido = new PdfPCell(new Paragraph("Nombres y Apellidos", FontFactory.getFont("arial", 14, Font.BOLD)));
    nombreApellido.setColspan(6);
    nombreApellido.setHorizontalAlignment(Element.ALIGN_CENTER);
    nombreApellido.setBorderColor(BaseColor.BLACK);
    tablaAsesorias.addCell(nombreApellido);

    PdfPCell codEst = new PdfPCell(new Paragraph("CODGIO est.", FontFactory.getFont("arial", 14, Font.BOLD)));
    codEst.setColspan(3);
    codEst.setHorizontalAlignment(Element.ALIGN_CENTER);
    codEst.setBorderColor(BaseColor.BLACK);
    tablaAsesorias.addCell(codEst);

    PdfPCell tema = new PdfPCell(new Paragraph("TEMA", FontFactory.getFont("arial", 14, Font.BOLD)));
    tema.setColspan(4);
    tema.setHorizontalAlignment(Element.ALIGN_CENTER);
    tema.setBorderColor(BaseColor.BLACK);
    tablaAsesorias.addCell(tema);

    PdfPCell fecha = new PdfPCell(new Paragraph("FECHA", FontFactory.getFont("arial", 14, Font.BOLD)));
    fecha.setColspan(2);
    fecha.setHorizontalAlignment(Element.ALIGN_CENTER);
    fecha.setBorderColor(BaseColor.BLACK);
    tablaAsesorias.addCell(fecha);

    PdfPCell hora = new PdfPCell(new Paragraph("Hora", FontFactory.getFont("arial", 14, Font.BOLD)));
    hora.setColspan(2);
    hora.setHorizontalAlignment(Element.ALIGN_CENTER);
    hora.setBorderColor(BaseColor.BLACK);
    tablaAsesorias.addCell(hora);

    String asesoriasDoc = facade.consultarAsesoriasDoc(codDoc);
    if (!asesoriasDoc.isEmpty()) {
        String v1[] = asesoriasDoc.split("#");
        for (int i = 0; i < v1.length; i++) {
            String v2[] = v1[i].split(";");
            PdfPCell numeroAsesoValor = new PdfPCell(new Paragraph("" + i, FontFactory.getFont("arial", 14)));
            numeroAsesoValor.setColspan(1);
            numeroAsesoValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            numeroAsesoValor.setBorderColor(BaseColor.BLACK);
            tablaAsesorias.addCell(numeroAsesoValor);

            PdfPCell codigoAsigValor = new PdfPCell(new Paragraph("" + v2[0], FontFactory.getFont("arial", 14)));
            codigoAsigValor.setColspan(2);
            codigoAsigValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            codigoAsigValor.setBorderColor(BaseColor.BLACK);
            tablaAsesorias.addCell(codigoAsigValor);

            PdfPCell nombreAsigValor = new PdfPCell(new Paragraph("" + v2[1], FontFactory.getFont("arial", 14)));
            nombreAsigValor.setColspan(4);
            nombreAsigValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            nombreAsigValor.setBorderColor(BaseColor.BLACK);
            tablaAsesorias.addCell(nombreAsigValor);

            PdfPCell grupoValor = new PdfPCell(new Paragraph("" + v2[2], FontFactory.getFont("arial", 14)));
            grupoValor.setColspan(1);
            grupoValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            grupoValor.setBorderColor(BaseColor.BLACK);
            tablaAsesorias.addCell(grupoValor);

            PdfPCell nombreApellidoValor = new PdfPCell(new Paragraph("" + v2[3], FontFactory.getFont("arial", 14)));
            nombreApellidoValor.setColspan(6);
            nombreApellidoValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            nombreApellidoValor.setBorderColor(BaseColor.BLACK);
            tablaAsesorias.addCell(nombreApellidoValor);

            PdfPCell codEstValor = new PdfPCell(new Paragraph("" + v2[4], FontFactory.getFont("arial", 14)));
            codEstValor.setColspan(3);
            codEstValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            codEstValor.setBorderColor(BaseColor.BLACK);
            tablaAsesorias.addCell(codEstValor);

            PdfPCell temaValor = new PdfPCell(new Paragraph("" + v2[5], FontFactory.getFont("arial", 14)));
            temaValor.setColspan(4);
            temaValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            temaValor.setBorderColor(BaseColor.BLACK);
            tablaAsesorias.addCell(temaValor);

            PdfPCell fechaValor = new PdfPCell(new Paragraph("" + v2[6], FontFactory.getFont("arial", 14)));
            fechaValor.setColspan(2);
            fechaValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            fechaValor.setBorderColor(BaseColor.BLACK);
            tablaAsesorias.addCell(fechaValor);

            PdfPCell horaValor = new PdfPCell(new Paragraph("" + v2[7], FontFactory.getFont("arial", 14)));
            horaValor.setColspan(2);
            horaValor.setHorizontalAlignment(Element.ALIGN_CENTER);
            horaValor.setBorderColor(BaseColor.BLACK);
            tablaAsesorias.addCell(horaValor);
        }
    }

    documento.add(tablaAsesorias);

    documento.close();

    out.print(nombreDocente);

%>