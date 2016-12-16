/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Practicas.DTO.estudianteDTO;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Administrador
 */
public class estudianteDAO{

  
    public void registrarEstudiante(String codigo, String direccion, String email, String telefono) {
        estudianteDTO e= new estudianteDTO();
        e.setCorreo(email);
        e.setDireccion(direccion);
        e.setTelefono(telefono);
        actualizarEstudiante(e);
        crearDocumentos(codigo);
        
    }

  
    public void actualizarEstudiante(estudianteDTO e) {
         Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        boolean rta=false;
        try {

            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();
             
            String sql= "UPDATE general_estudiante SET correo='"+e.getCorreo()+"', direccion = '"+e.getDireccion()+"' , telefono='"+e.getTelefono()+"'  , asignado_practica=true WHERE (codigo= '"+e.getCodigoEstudiante()+"');";//genero el sql. 
           
            pst= con.prepareStatement(sql);
            int a= pst.executeUpdate();
            con.close();
            
            if(a == 1){
                rta= true;
                System.out.println(" registrar");    
            }

            
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

 
    public estudianteDTO buscarEstudiante(String codigo) {
        estudianteDTO x= new estudianteDTO();
        
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from general_estudiante where codigo = '" + codigo+"'";
        try{
            Pool pool = Conexion.getPool();
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            conn = pool.getDataSource().getConnection();
            
            pst = (PreparedStatement) conn.prepareStatement(sql);
            rs= pst.executeQuery();
            
            /** 
             * ESTUDIANTE DTO
             * String codigoEstudiante;     
             * String cedula;     
             * String nombresEstudiante;     
             * String apellidosEstudiante;    
             * int semestre;
             * 
             * 
             * BD: 
             * codigo	varchar(10) ;
                documento_id	varchar(10)
                nombres	varchar(50)
                apellidos	varchar(50)
                semestre	int(11)
                investigacion_codigocolciencias	varchar(10)
                programaacademico	varchar(30)
                activo	tinyint(1)
                asignado_practica	tinyint(1)

             **/
            while(rs.next()){
                x.setCodigoEstudiante(rs.getString("codigo"));
                x.setCedula(rs.getString("documento_id"));
                x.setNombresEstudiante(rs.getString("nombres"));
                x.setApellidosEstudiante(rs.getString("apellidos"));
                x.setSemestre(rs.getInt("semestre"));
            }
            conn.close();
            //lleveme al jsp
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
        
    }

    public ArrayList<estudianteDTO> listar_Estudiante() {
     Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<estudianteDTO> estudiantes = new ArrayList<>();
        
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
            stm = con.prepareStatement("Select * from general_estudiante where asignado_practica = true");//genero el sql. 
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            estudianteDTO e;
            while(resultado.next()){
                e = new estudianteDTO();
                String codigo = resultado.getString(1);
                String documento_id = resultado.getString(2);
                String nombres = resultado.getString(3);
                String apellidos = resultado.getString(4);
                int semestre = resultado.getInt(5);
                               
                e.setCodigoEstudiante(codigo);
                e.setCedula(documento_id);
                e.setNombresEstudiante(nombres);
                e.setApellidosEstudiante(apellidos);
                e.setSemestre(semestre);
                
                
                
                
                estudiantes.add(e);
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
        return estudiantes;
    
}          

 
    public List<estudianteDTO> listarEstudiante() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public void subirArhivo(List items, byte opc) throws Exception{
        String nombre= "";
        switch(opc){
            case 1: nombre="cedula";
            break;
            case 2: nombre="horario";
            break;
            case 3: nombre= "hv";
            break;
            case 4: nombre="afiliacion"; 
            break;
        }
        
        
    }
 
    public String pedirDireccion(HttpServletRequest request){
        
        return request.getRealPath("../documentos/Estudiantes");
    }
    
    public boolean guardarDocumentos(String nombre, String ruta){
        boolean rta=false;
        
        String[] tipo= nombre.split("_");
        String[] cod=tipo[1].split("\\.");
        /**String[] partes = ruta.split("\\\\.");
        String ruta2="";
        byte i=0;
        while(i<partes.length){
            ruta2= ruta2+partes[i]+"@";
            i++;
        }*/
        
            if(tipo[0].equalsIgnoreCase("cedula")){
                rta=this.guardarDoc("url_cedula", "cedula",cod[0], ruta);       
            }else if(tipo[0].equalsIgnoreCase("hv")){
                rta=this.guardarDoc("url_hojadeVida", "hojade_vida",cod[0], ruta);
            }else if(tipo[0].equalsIgnoreCase("horario")){
                rta=this.guardarDoc("url_horario", "horario",cod[0], ruta);
            }else if(tipo[0].equalsIgnoreCase("afiliacion")){
                rta=this.guardarDoc("url_eps", "eps",cod[0], ruta);
            }
            
        
        return rta;
    }

    private boolean guardarDoc(String campo1, String campo2, String codigo, String ruta) {
    
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        boolean rta=false;
        try {

            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();
             
            String sql= "UPDATE practicas_documentos_estudiantes SET "+campo1+"='"+ruta+"',"+campo2+"= true WHERE (codigo_estudiante= '"+codigo+"');";//genero el sql. 
           
            pst= con.prepareStatement(sql);
            int a= pst.executeUpdate();
            con.close();
            
            if(a == 1){
                rta= true;
                System.out.println(" registrar");    
            }

            
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    return rta;
    }
    
    public ArrayList<estudianteDTO> listar_Estudiante(int semestre, int año) {
     Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<estudianteDTO> estudiantes = new ArrayList<>();
        
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
            stm = con.prepareStatement("SELECT * FROM practicas_practica INNER JOIN general_estudiante ON general_estudiante.codigo = practicas_practica.id_estudiante where año_practica='"+año+"' and semestre_practica='"+semestre+"'");//genero el sql. 
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            System.out.println("resultado"+resultado+"");
            estudianteDTO e;
            while(resultado.next()){
                e = new estudianteDTO();
                String codigo = resultado.getString(14);
                String documento_id = resultado.getString(15);
                String nombres = resultado.getString(16);
                String apellidos = resultado.getString(17);
                int semestres = resultado.getInt(18);
                String direccion=resultado.getString(24);
                String telefono=resultado.getString(25);
                String correo=resultado.getString(23);
                               
                e.setCodigoEstudiante(codigo);
                e.setCedula(documento_id);
                e.setNombresEstudiante(nombres);
                e.setApellidosEstudiante(apellidos);
                e.setSemestre(semestres);
                e.setTelefono(telefono);
                e.setDireccion(direccion);
                e.setEmail(correo);
                
                
                
                
                estudiantes.add(e);
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
        return estudiantes;
    
}          

    public ArrayList<estudianteDTO> listar_Estudiante_asignados() {
     Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<estudianteDTO> estudiantes = new ArrayList<>();
        
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
            stm = con.prepareStatement("Select * from general_estudiante where asignado_practica = true");//genero el sql. 
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            estudianteDTO e;
            while(resultado.next()){
                e = new estudianteDTO();
                String codigo = resultado.getString(1);
                String documento_id = resultado.getString(2);
                String nombres = resultado.getString(3);
                String apellidos = resultado.getString(4);
                int semestre = resultado.getInt(5);
                               
                e.setCodigoEstudiante(codigo);
                e.setCedula(documento_id);
                e.setNombresEstudiante(nombres);
                e.setApellidosEstudiante(apellidos);
                e.setSemestre(semestre);
                
                
                
                
                estudiantes.add(e);
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
        return estudiantes;
    
}          

    private void crearDocumentos(String codigo) {
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement pst = null;
        
        try {
            /**
             * 02/11/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             *
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();
             
            String sql= "insert into practicas_documentos_estudiantes (codigo_estudiante, url_cedula) values('"+codigo+"', 'nn')";//genero el sql. 
       
            pst= con.prepareStatement(sql);
            
            int a= pst.executeUpdate();
            con.close();
            
            if(a == 1){
                
                System.out.println(" registrar");
                
            }else{
                 System.out.println("No es posible registrarlo");
                
            }
         
            
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
