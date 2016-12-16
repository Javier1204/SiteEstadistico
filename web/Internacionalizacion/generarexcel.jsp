<%-- 
    Document   : generarexcel
    Created on : 15/12/2016, 02:03:35 AM
    Author     : JAVIER
--%>
<%@page import="Internacionalizacion.Modelo.DTO.Entidad"%>
<%@page import="Internacionalizacion.Modelo.DAO.DAODocente"%>
<%@page import="Internacionalizacion.Modelo.DTO.Actividad"%>
<%@page import="Internacionalizacion.Modelo.DAO.DAOActividad"%>
<%@page import="Internacionalizacion.Modelo.DAO.DAOEntidad"%>
<%@page import="org.apache.poi.ss.usermodel.Font"%>
<%@page import="org.apache.poi.ss.usermodel.CellStyle"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFFont"%>
<%@page import="Internacionalizacion.Modelo.DTO.Convenio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Internacionalizacion.Facade.Facade"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="../public/css/ufps.css" rel="stylesheet" type="text/css"/>

<!--<a href="textxls.xls"><input type="button" class="ufps-btn">Descargar</a>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>


<%
    
    

Facade f = new Facade();
ArrayList<Convenio> convenios = f.obtenerConvenios();

// create a small spreadsheet
HSSFWorkbook libro = new HSSFWorkbook();

//Creamos la hoja para el reporte de las actividades.

HSSFSheet hoja = libro.createSheet("Convenios");
HSSFRow fila = hoja.createRow(0);
HSSFCell celda;
CellStyle style = libro.createCellStyle();
HSSFFont font = libro.createFont();
font.setBoldweight(Font.BOLDWEIGHT_BOLD);
style.setFont(font);

//Para crear encabezado de los convenios.
String [] encabezado = {"RADICADO", "NOMBRE", "DESCRIPCION", "FECHA RADICACION", "FECHA INICIO", "FECHA TERMINACION", "VIGENCIA", "ESTADO", "TIPO CONVENIO", "ENTIDAD"};
for(int i=0;i<encabezado.length;i++){
    celda = fila.createCell(i);
    
    celda.setCellValue(encabezado[i]);
    celda.setCellStyle(style);
}

DAOEntidad d = new DAOEntidad();

int i = 2;
int j = 0;
for(Convenio c:convenios){
    j=0;
    fila = hoja.createRow(i++);
    celda = fila.createCell(j++);
    celda.setCellValue(c.getId());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getNombre());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getDescripcion());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getFecharadicacion());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getFechainicio());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getFechaterminacion());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getVigencia());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getEstado());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getTipoconvenio());
    celda = fila.createCell(j++);
    celda.setCellValue(d.consultarNombreEntidad(c.getEntidad()));   
    
}

//Reporte para las actividades

hoja = libro.createSheet("Actividades");
fila = hoja.createRow(0);
//Para crear encabezado de las actividades.
String [] encabezado1 = {"CONVENIO", "DURACION", "NOMBRE", "DESCRIPCION", "FECHA INICIO", "FECHA TERMINACION", "SEMESTRE", "TIPO", "HORA", "RESPONSABLE", "LUGAR"};
 
for( i=0;i<encabezado1.length;i++){
    celda = fila.createCell(i);
    
    celda.setCellValue(encabezado1[i]);
    celda.setCellStyle(style);
}

DAOActividad dao = new DAOActividad();
DAODocente docente = new DAODocente();
ArrayList<Actividad> actividades = dao.consultarActividades();
i = 2;
j = 0;
for(Actividad c:actividades){
    j=0;
    fila = hoja.createRow(i++);
    celda = fila.createCell(j++);
    celda.setCellValue(c.getIdconvenio());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getDuracion());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getNombre());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getDescripcion());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getFechacreacion());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getFechaterminacion());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getSemestre());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getTipoactividad());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getHora());
    celda = fila.createCell(j++);
    celda.setCellValue(docente.consultarDocente(c.getResponsable()).getNombres());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getLugar()); 
    
}

//Reporte para las entidades

hoja = libro.createSheet("Entidades");
fila = hoja.createRow(0);
//Para crear encabezado de las entidades.
String [] encabezado2 = {"NIT", "SECTOR", "REPRESENTANTE", "NOMBRE", "TIPO", "TELEFONO", "PAIS", "DIRECCION"};
 
for( i=0;i<encabezado2.length;i++){
    celda = fila.createCell(i);
    
    celda.setCellValue(encabezado2[i]);
    celda.setCellStyle(style);
}

DAOEntidad entidad = new DAOEntidad();

ArrayList<Entidad> entidades = entidad.consultarEntidades();
i = 2;
j = 0;
for(Entidad c:entidades){
    j=0;
    fila = hoja.createRow(i++);
    celda = fila.createCell(j++);
    celda.setCellValue(c.getNit());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getSector());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getRepresentante());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getNombre());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getTipo());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getTelefono());
    celda = fila.createCell(j++);
    celda.setCellValue(c.getPais()+"");
    celda = fila.createCell(j++);
    celda.setCellValue(c.getDireccion());
    celda = fila.createCell(j++);
    
    
}




//write it as an excel attachment
ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
libro.write(outByteStream);
byte [] outArray = outByteStream.toByteArray();
response.setContentType("application/ms-excel");
response.setContentLength(outArray.length);
response.setHeader("Expires:", "0"); // eliminates browser caching
response.setHeader("Content-Disposition", "attachment; filename=reporte.xls");
OutputStream outStream = response.getOutputStream();
outStream.write(outArray);
outStream.flush();


%>
