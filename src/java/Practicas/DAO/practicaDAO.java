/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DAO;

import Practicas.DTO.practicaDTO;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import static com.itextpdf.text.PageSize.A1;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfName;
import com.itextpdf.text.pdf.PdfWriter;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;


/**
 *
 * @author Usuario
 */
public class practicaDAO {
    
    public String registrarPractica(practicaDTO p) {
        //corra el programa 
        System.out.println(p.toString());
        String rta= "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        
        try {
          
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection(); 
           
            String sql="insert into practicas_practica (año_practica,semestre_practica,id_convenio,estado,id_docente,id_estudiante,id_perfil,id_tutor) values ('"+p.getAño_practica()+"','"+p.getSemestre_practica()+"','"+p.getId_convenio()+"','"+p.getEstado()+"','"+p.getId_docente()+"','"+p.getId_estudiante()+"',"+p.getId_perfil()+","+p.getId_tutor()+")";
            
            pst= con.prepareStatement(sql);
            System.out.println(sql);
            int a= pst.executeUpdate();
            con.close();
            
            if(a == 1){
                System.out.println(" registrar");
                rta= "Se ha registrado la practica correctamente";
            }else{
                 System.out.println("no registrar");
                rta = "No es posible registrar la practica";
            }
            
         
        } catch (SQLException ex) {
            Logger.getLogger(tutorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rta;
    }
    public ArrayList<practicaDTO> consultarPracticas() {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<practicaDTO> practicas = new ArrayList();
        
        try {
            /**
             * 02/11/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             *
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("SELECT * FROM practicas_practica INNER JOIN general_convenio ON general_convenio.id = practicas_practica.id_convenio INNER JOIN oficina_entidad ON general_convenio.id_entidad= oficina_entidad.id INNER JOIN general_estudiante ON general_estudiante.codigo = practicas_practica.id_estudiante INNER JOIN practicas_perfil ON practicas_perfil.id_perfil = practicas_practica.id_perfil ");//genero el sql. 
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            System.out.println(resultado);
            practicaDTO c;
            while(resultado.next()){
                int id_practica=resultado.getInt(1);
                String año_practica = resultado.getString(2);
                String semestre_practica  = resultado.getString(3);
                String id_convenio = resultado.getString(5);
                String estado =resultado.getString(8);
                String id_docente = resultado.getString(9);
                String id_estudiante = resultado.getString(10);
                String nombre_estudiante=resultado.getString(36);
                int id_perfil = resultado.getInt(11);
                String nombre_perfil= resultado.getString(44);
                int id_tutor =resultado.getInt(13);
                int iEmpresa=resultado.getInt(23);
                String nombreEmpresa = resultado.getString(29);
                
                c = new practicaDTO(id_practica,año_practica,semestre_practica, id_convenio, estado, id_docente, id_estudiante, id_perfil, id_tutor);
                c.setEmpresa(id_convenio, iEmpresa, nombreEmpresa);
                c.setPerfil(id_perfil, nombre_perfil);
                c.setEstudiante(id_estudiante, nombre_estudiante);
                practicas.add(c);
            }
            
            
            
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
             System.out.println("no  registrar");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                 System.out.println("asdasd no registrar");
                System.err.println(ex);
            }
        }   
        return practicas;
    }
    public ArrayList<practicaDTO> consultarPracticas_anio(String semestre,String anio) {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<practicaDTO> practicas = new ArrayList();
        
        try {
            /**
             * 02/11/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             *
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("SELECT * FROM practicas_practica INNER JOIN general_convenio ON general_convenio.id = practicas_practica.id_convenio INNER JOIN oficina_entidad ON general_convenio.id_entidad= oficina_entidad.id INNER JOIN general_estudiante ON general_estudiante.codigo = practicas_practica.id_estudiante INNER JOIN practicas_perfil ON practicas_perfil.id_perfil = practicas_practica.id_perfil where año_practica= '"+anio+"' and semestre_practica='"+semestre+"' ");//genero el sql. 
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            System.out.println(resultado);
            practicaDTO c;
            while(resultado.next()){
                
                String año_practica = resultado.getString(2);
                String semestre_practica  = resultado.getString(3);
                String id_convenio = resultado.getString(5);
                String estado =resultado.getString(8);
                String id_docente = resultado.getString(9);
                String id_estudiante = resultado.getString(10);
                String nombre_estudiante=resultado.getString(36);
                int id_perfil = resultado.getInt(11);
                String nombre_perfil= resultado.getString(44);
                int id_tutor =resultado.getInt(13);
                int iEmpresa=resultado.getInt(23);
                String nombreEmpresa = resultado.getString(29);
                
                c = new practicaDTO(año_practica,semestre_practica, id_convenio, estado, id_docente, id_estudiante, id_perfil, id_tutor);
                c.setEmpresa(id_convenio, iEmpresa, nombreEmpresa);
                c.setPerfil(id_perfil, nombre_perfil);
                c.setEstudiante(id_estudiante, nombre_estudiante);
                practicas.add(c);
            }
            
            
            
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
             System.out.println("no  registrar");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                 System.out.println("asdasd no registrar");
                System.err.println(ex);
            }
        }   
        return practicas;
    }
    
    public ArrayList<String> fechas_practicas (){
        ArrayList<String> fechas = new ArrayList<String>();
        
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        
        try {  
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection(); 
           
            String sql="select DISTINCT año_practica from practicas_practica";   
            pst= con.prepareStatement(sql);
            
            ResultSet rs= pst.executeQuery();
             while(rs.next()){
                fechas.add(rs.getString("año_practica"));
            }
            con.close();
      
         
        } catch (SQLException ex) {
            Logger.getLogger(practicaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return fechas;
    }
    public String editarPractica(practicaDTO p) throws SQLException {
        
        String rta = "No conecto";
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;

        try {

            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();
            
            String sql = "update  practicas_practica SET año_practica='"+p.getAño_practica()+"',semestre_practica='"+p.getSemestre_practica()+ "',estado='" + p.getEstado()+"',id_estudiante='"+p.getId_estudiante()+"',id_tutor='" +p.getId_tutor()+"' where id_practica='"+p.getIdpractica()+"';";
            System.out.println(sql);
            pst = con.prepareStatement(sql);

            int a = pst.executeUpdate();
            con.close();
            
              
            

            if (a == 1) {
                System.out.println(" registrar");
                rta = "Se ha actualizado la empresa";
            } else {
                System.out.println("no registrar");
                rta = "No es posible actualizarla";
            }

        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.close();
        }
        return rta;
    }
    
    public practicaDTO buscarPractica(int id) {
        practicaDTO dato = new practicaDTO();
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from practicas_practica where id_practica = " + id;
        try {
            Pool pool = Conexion.getPool();
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            conn = pool.getDataSource().getConnection();

            pst = (PreparedStatement) conn.prepareStatement(sql);
            rs = pst.executeQuery();

            while (rs.next()) {
                dato.setIdpractica(rs.getInt("id_practica"));
                dato.setAño_practica(rs.getString("año_practica"));
                dato.setSemestre_practica(rs.getString("semestre_practica"));
                dato.setEstado(rs.getString("estado"));
                dato.setId_perfil(rs.getInt("id_perfil"));
                dato.setId_convenio(rs.getString("id_convenio"));
                dato.setId_tutor(rs.getInt("id_tutor"));
                dato.setId_docente(rs.getString("id_docente"));
                dato.setId_estudiante(rs.getString("id_estudiante"));
            }
            conn.close();

        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dato;
    }
    
    public String eliminarPractica(int id) throws SQLException {
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        String rta = "No conecto";
        

        try {
            /**
             * 02/11/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             *
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            
            String sql = "DELETE FROM practicas_practica WHERE id_practica="+id+";";
            System.out.println(sql);
            pst = con.prepareStatement(sql);

            int a = pst.executeUpdate();
            con.close();
            
              
            

            if (a == 1) {
                System.out.println(" registrar");
                rta = "Se ha actualizado la empresa";
            } else {
                System.out.println("no registrar");
                rta = "No es posible actualizarla";
            }

        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            con.close();
        }
        return rta;
    }
    
    public String generarEstaditicas(int añop, int semestrep) throws IOException {
        String rta= "";
        
        
            String url1=grafico_por_empresas(añop, semestrep);
                 
            String url2= grafico_de_empresas_por_tipo(añop, semestrep);
            
            String url3= grafico_de_perfiles(añop, semestrep);
          
            rta=crear_documento(url1, url2, url3, añop, semestrep);
            
            
        
        return rta;
    }
    
    private String grafico_por_empresas (int añop, int semestrep) {
        String ruta=null;
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        
        try {  
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection(); 
           
            String sql="SELECT e.sector, COUNT(p.id_practica) AS cantidad FROM practicas_practica p, general_convenio c, oficina_entidad e "
                    + "WHERE (p.año_practica ="+añop+" AND p.semestre_practica="+semestrep+" AND p.id_convenio=c.id AND c.id_entidad=e.id) GROUP BY e.sector";   
            pst= con.prepareStatement(sql);
            
            ResultSet rs= pst.executeQuery();
            
            DefaultCategoryDataset datos= new DefaultCategoryDataset();
            
             while(rs.next()){
                datos.setValue(rs.getInt(2), "Sector", rs.getString(1));
            }
            con.close();
            
            JFreeChart grafico= ChartFactory.createBarChart("", "Sectores", "Cantidad", datos, PlotOrientation.VERTICAL,true, true, true);
            ruta= "C://Users//Usuario//Documents//NetBeansProjects//SiteEstadistico//build//documentos//Informes//reporte-por-sector-"+añop+"-"+semestrep+".jpg";
            File f = new File(ruta);
            ChartUtilities.saveChartAsJPEG(f,grafico,400,400);
         
        } catch (SQLException | IOException ex) {
            Logger.getLogger(practicaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ruta;
    }
    
    private String grafico_de_empresas_por_tipo (int añop, int semestrep){
        
        String ruta=null;
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        
        try {  
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection(); 
           
            String sql="SELECT e.tipo, COUNT(p.id_practica) AS cantidad FROM practicas_practica p, general_convenio c, oficina_entidad e "
                    + "WHERE (p.año_practica ="+añop+" AND p.semestre_practica="+semestrep+" AND p.id_convenio=c.id AND c.id_entidad=e.id) GROUP BY e.tipo";   
            pst= con.prepareStatement(sql);
            
            ResultSet rs= pst.executeQuery();
            
            DefaultCategoryDataset datos= new DefaultCategoryDataset();
            
             while(rs.next()){
                datos.setValue(rs.getInt(2), "Tipo", rs.getString(1));
            }
            con.close();
            
            JFreeChart grafico= ChartFactory.createBarChart("", "Tipo", "Cantidad", datos, PlotOrientation.VERTICAL,true, true, true);
            ruta= "C://Users//Usuario//Documents//NetBeansProjects//SiteEstadistico//build//documentos//Informes//reporte-por-tipo-"+añop+"-"+semestrep+".jpg";
            File f = new File(ruta);
            ChartUtilities.saveChartAsJPEG(f,grafico,400,400);
         
        } catch (SQLException | IOException ex) {
            Logger.getLogger(practicaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ruta;
    }

    private String grafico_de_perfiles(int añop, int semestrep) {
        String ruta=null;
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        
        try {  
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection(); 
           
            String sql="SELECT pf.nombre, COUNT(p.id_practica) AS cantidad FROM practicas_practica p, practicas_perfil pf "
                    + "WHERE (p.año_practica ="+añop+" AND p.semestre_practica="+semestrep+" AND p.id_perfil= pf.id_perfil) GROUP BY pf.nombre";   
            pst= con.prepareStatement(sql);
            
            ResultSet rs= pst.executeQuery();
            
          
            DefaultCategoryDataset datos= new DefaultCategoryDataset();
            
             while(rs.next()){
                datos.setValue(rs.getInt(2), "Perfil", rs.getString(1));
            }
            con.close();
            
            JFreeChart grafico= ChartFactory.createBarChart("", "Perfil", "Cantidad", datos, PlotOrientation.VERTICAL,true, true, true);
            ruta= "C://Users//Usuario//Documents//NetBeansProjects//SiteEstadistico//build//documentos//Informes//reporte-por-perfil-"+añop+"-"+semestrep+".jpg";
            File f = new File(ruta);
            ChartUtilities.saveChartAsJPEG(f,grafico,400,400);
         
        } catch (SQLException | IOException ex) {
            Logger.getLogger(practicaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ruta;
    }

    private String crear_documento(String url1, String url2, String url3, int añop, int semestrep) {
        String rta="";
       
        try {
            String nombreArchivo= "Informe-practicas-"+añop+"-"+semestrep+".pdf";
            String url= "C://Users//Usuario//Documents//NetBeansProjects//SiteEstadistico//build//documentos//Informes//";
            Document document = new Document(PageSize.LETTER, 20, 20, 0, 20);
            rta=url+nombreArchivo;
            PdfWriter.getInstance(document, new FileOutputStream(url+nombreArchivo));
            Paragraph titulo = new Paragraph("\n ESTADISTICAS DE PRACTICAS DEL PROGRAMA DE INGENIERIA DE SISTEMAS AÑO " +añop + " semestre " +semestrep);
            Paragraph p1 = new Paragraph("\n DIAGRAMA 1. Clasificacion de empresas por empresa" ) ;
            Paragraph p2 = new Paragraph("\n DIAGRAMA 2. Clasificacion de empresas por tipo" );
            Paragraph p3 = new Paragraph("\n DIAGRAMA 3. Clasificacion de practicas por perfil" );
            titulo.setAlignment(Element.ALIGN_CENTER);
            Image g1 = Image.getInstance(url1);
            Image g2 = Image.getInstance(url2);
            Image g3 = Image.getInstance(url3);
            g1.setAlignment(Element.ALIGN_CENTER);
            g2.setAlignment(Element.ALIGN_CENTER);
            g3.setAlignment(Element.ALIGN_CENTER);

            document.open();
            
            //Image banner = Image.getInstance("C://Users//USUARIO//Documents//NetBeansProjects//SiteEstadistico//src//java//Practicas//Reporte//banner.png");
            //Image pie = Image.getInstance("C://Users//USUARIO//Documents//NetBeansProjects//SiteEstadistico//src//java//Practicas//Reporte//pie.png");
            //pie.setAbsolutePosition(0f, 0f);
            //document.add(banner);
            document.add(titulo);
            document.add(p1);
            document.add(g1);
            //document.add(pie);
            document.newPage();      
            //document.add(banner);
            document.add(p2);
            document.add(g2);
            //document.add(pie);
            document.newPage();
            //document.add(banner);
            document.add(p3);
            document.add(g3);
            //document.add(pie);
            document.newPage();
            
            
            document.close();
            
        } catch (FileNotFoundException | DocumentException ex) {
            Logger.getLogger(practicaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(practicaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
       
        return rta;
        
        
    }
    
    
    public boolean generarInformes(int añop, int semestrep){
        boolean rta=false;
                //Creamos una instancia de la clase HSSFWorkbook llamada libro
        HSSFWorkbook libro = new HSSFWorkbook();
        
        //Creamos una instancia de la clase HSSFSheet llamada hoja y la creamos
        HSSFSheet hoja = libro.createSheet();
        
        //Creamos una instancia de la clase HSSFRow llamada fila y creamos la fila con el indice 0
        HSSFRow fila = hoja.createRow(0);
        
        //estilos
        HSSFCellStyle estilo = libro.createCellStyle();
        estilo.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        estilo.setFillForegroundColor(HSSFColor.BLUE.index);
        
        String[] cabezal = new String[]{
            "NOMBRES Y APELLIDOS DEL ESTUDIANTE",
            "CODIGO DEL ESTUDIANTE",
            "PROGRAMA ACADEMICO",
            "REGISTRO SNIES",
            "NIVEL DE FORMACION",
            "MODALIDAD PROGRAMA",
            "FORMA DE PARTICIPACION",
            "CODIGO ASIGNATURA",
            "NOMBRE ASIGNATURA",
            "NOMBRE DE LA EMPRESA O INSTITUCION DONDE REALIZA LA EXTENSION",
            "SEMESTRE QUE CURSA EL ESTUDIANTE",
            "AÑO EN QUE SE REALIZA LA PRACTICA",
            "SEMESTRE DEL AÑO EN QUE SE REALIZA LA PRACTICA",
            "FACULTAD"
        };
        //Colocar titulos
        for (int i = 0; i < cabezal.length; ++i) {
            String header = cabezal[i];
            HSSFCell cell = fila.createCell(i);
            cell.setCellStyle(estilo);
            cell.setCellValue(header);
        }
     
       //Consultar BD
       
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        
        try {  
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection(); 
           
            String sql="SELECT * FROM practicas_practica p, general_estudiante e, oficina_entidad o, general_convenio g "
                    + "WHERE (p.id_estudiante=e.codigo AND p.año_practica ="+añop+" AND p.semestre_practica="+semestrep+" AND p.id_convenio=g.id AND g.id_entidad=o.id)";   
            pst= con.prepareStatement(sql);
            
            ResultSet rs= pst.executeQuery();
           
            int i=1;
            
             while(rs.next()){
                fila = hoja.createRow(i);                
                
                fila.createCell(0).setCellValue(rs.getString("e.nombres"));
                fila.createCell(1).setCellValue(rs.getString("e.codigo"));
                fila.createCell(2).setCellValue("Ingenieria de Sistemas");
                fila.createCell(3).setCellValue("856");
                fila.createCell(4).setCellValue("Pregrado");
                fila.createCell(5).setCellValue("Presencial");
                fila.createCell(6).setCellValue("Practica Academica");
                fila.createCell(7).setCellValue("1150909");
                fila.createCell(8).setCellValue("Practica en Sistema");
                fila.createCell(9).setCellValue(rs.getString("o.nombre"));
                fila.createCell(10).setCellValue("9");
                fila.createCell(11).setCellValue(""+añop);
                fila.createCell(12).setCellValue(""+semestrep);
                fila.createCell(13).setCellValue("Ingenieria");
               i++;
            }
            con.close();
        
        
        }catch(Exception e){
            e.getMessage();
        }
        try{
            String ex = "informe-"+añop+"-"+semestrep;
            //String rutaArchivo = System.getProperty("../documentos/Estadisticas");
            //System.out.println(rutaArchivo);

            try (FileOutputStream archivo = new FileOutputStream("C:\\Users\\Usuario\\Documents\\NetBeansProjects\\SiteEstadistico\\build\\documentos\\Estadisticas\\"+ ex +".xls")) {
                libro.write(archivo);
            }
            rta=true;
            
          
        }catch(Exception e){
         e.getMessage();
        }
        return rta;
    }

}
