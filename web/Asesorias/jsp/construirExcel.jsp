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
    String rutaPrueba = getServletContext().getRealPath("/Asesorias/jsp/informe/").replace("./", "/");
    String rutaAlter = System.getProperty("user.home");
    System.out.println(System.getProperty("user.home"));

    HSSFWorkbook libro = new HSSFWorkbook();

    // Se crea una hoja dentro del libro
    HSSFSheet hoja = libro.createSheet();

    //Consultar horas de asesorias de docentes
    String codDoc = "6";
    String horaDocentes = controller.consultarHorasAsesorias(codDoc);
    System.out.println("horario:: " + horaDocentes);

    HSSFRow filaTitulos = hoja.createRow(0);
    // Se crea una celda dentro de la fila
    HSSFCell celdaTitulo = filaTitulos.createCell((short) 0);
    HSSFRichTextString textoTitulo = new HSSFRichTextString("Códgio docente");
    celdaTitulo.setCellValue(textoTitulo);

    HSSFCell celdaTituloDos = filaTitulos.createCell((short) 1);
    HSSFRichTextString textoTituloDos = new HSSFRichTextString("Nombre docente");
    celdaTituloDos.setCellValue(textoTituloDos);

    HSSFCell celdaTituloTres = filaTitulos.createCell((short) 2);
    HSSFRichTextString textoTituloTres = new HSSFRichTextString("Horas de asesoria");
    celdaTituloTres.setCellValue(textoTituloTres);

    String v1[] = horaDocentes.split("#");
    String nombreDoc = "";
    int cantHoras = 0;
    String codigoDoc = "";
    int f = 1;
    for (int j = 0; j < v1.length; j++) {
        String v2[] = v1[j].split(";");
        //c.hora_ini, c.hora_fin, g.nombres, g.apellidos, g.codigo

        String horaI[] = v2[0].split(":");
        String horaF[] = v2[1].split(":");
        int horaIni = Integer.parseInt(horaI[0]);
        int horaFin = Integer.parseInt(horaF[0]);
        if (nombreDoc.isEmpty()) {
            nombreDoc = v2[2] + " " + v2[3];
            cantHoras += (horaFin - horaIni);
            codigoDoc = v2[4];
        } else {
            if (nombreDoc.equals(v2[2] + " " + v2[3])) {
                System.out.println("Dos cant horas:: " + cantHoras);
                cantHoras += (horaFin - horaIni);
                System.out.println("tres cant horas:: " + cantHoras);
            } else {
                // Se crea una fila dentro de la hoja
                HSSFRow fila = hoja.createRow(f);
                // Se crea una celda dentro de la fila
                HSSFCell celdaCod = fila.createCell((short) 0);
                HSSFRichTextString textoCod = new HSSFRichTextString("" + v2[4]);
                celdaCod.setCellValue(textoCod);

                HSSFCell celdaNombre = fila.createCell((short) 1);
                HSSFRichTextString textoNombre = new HSSFRichTextString("" + nombreDoc);
                celdaNombre.setCellValue(textoNombre);

                HSSFCell celdaHoras = fila.createCell((short) 2);
                HSSFRichTextString textoHoras = new HSSFRichTextString("" + cantHoras + " Semanales");
                celdaHoras.setCellValue(textoHoras);
                // Se crea el contenido de la celda y se mete en ella.

                nombreDoc = "";
                cantHoras = 0;
                codigoDoc = "";
                nombreDoc = v2[2] + " " + v2[3];
                cantHoras += (horaIni - horaFin);
                codigoDoc = v2[4];
                f++;
            }
        }
    }
    
     // Se crea una fila dentro de la hoja
     HSSFRow fila = hoja.createRow(f);
     // Se crea una celda dentro de la fila
     HSSFCell celdaCod = fila.createCell((short) 0);
     HSSFRichTextString textoCod = new HSSFRichTextString("" + codigoDoc);
     celdaCod.setCellValue(textoCod);

     HSSFCell celdaNombre = fila.createCell((short) 1);
     HSSFRichTextString textoNombre = new HSSFRichTextString("" + nombreDoc);
     celdaNombre.setCellValue(textoNombre);

     HSSFCell celdaHoras = fila.createCell((short) 2);
     HSSFRichTextString textoHoras = new HSSFRichTextString("" + cantHoras + " semanales");
     celdaHoras.setCellValue(textoHoras);
     

    // Se salva el libro.
    try {
        //FileOutputStream elFichero = new FileOutputStream("holamundo.xls");
        FileOutputStream archivo = new FileOutputStream(rutaPrueba + "/Informe Administrador.xls");
        libro.write(archivo);
        archivo.close();
    } catch (Exception e) {
        System.out.println("Este es el error:: " + e.getMessage());
        e.printStackTrace();
    }

%>