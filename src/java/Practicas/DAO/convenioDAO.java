/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import Practicas.DTO.convenioDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class convenioDAO {
    
    public String registrarConvenio(convenioDTO c) {
     //ejemplo para usar el pool de conexiones. 
        System.out.println(c.toString());
        String rta= "No conecto";
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
             
            String sql= "insert into general_convenio (id, nombre, descripcion,fechacreacion,fechaterminacion, vigencia,estado, id_entidad) values(null,'"
                    + ""+c.getNombreConvenio()+"','"+c.getDescripcion()+"','"+c.getFechainicio()+"','"+c.getFechafin()+"','"+c.getVigencia()+"','"+c.getEstado()+"','"+c.getIdempresa()+"')";//genero el sql. 
            System.out.println(c.getNombreConvenio());
            pst= con.prepareStatement(sql);
            
            int a= pst.executeUpdate();
            con.close();
            
            if(a == 1){
                rta= "Registro";
                System.out.println(" registrar");
                
            }else{
                 System.out.println("no registrar");
                rta = "No registro";
            }
         
            
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rta;
    }
    
    
    public ArrayList<convenioDTO> consultarConvenios() {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<convenioDTO> convenios = new ArrayList();
        
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
            stm = con.prepareStatement("Select * from general_convenio");//genero el sql. 
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            convenioDTO c;
            while(resultado.next()){
                
                int id = resultado.getInt(1);
                String nombreConvenio = resultado.getString(2);
                String descripcion = resultado.getString(3);
                String fechainicio = resultado.getString(4);
                String fechafin = resultado.getString(5);
                String vigencia = resultado.getString(6);
                String estado = resultado.getString(7);
                int idempresa = resultado.getInt(9);
                
                c = new convenioDTO( nombreConvenio, descripcion, fechainicio, fechafin, vigencia, estado, idempresa);
                c.setIdconvenio(idempresa);
                
                convenios.add(c);
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
        return convenios;
    }
    
    public convenioDTO consultarConvenio(String nombreconvenio) {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        convenioDTO c = null;
        
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
            stm = con.prepareStatement("Select * from `general_convenio` where nombre=?");//genero el sql. 
            stm.setString(1, nombreconvenio);
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            while(resultado.next()){
                c = new convenioDTO();
                int id = resultado.getInt(1);
                String nombre = resultado.getString(2);
                String descripcion = resultado.getString(3);
                String creacion = resultado.getString(4);
                String terminacion = resultado.getString(5);
                String vigencia = resultado.getString(6);
                String estado = resultado.getString(7);
                
                int entidad = resultado.getInt(9);
                
                
                c.setIdconvenio(id);
                c.setNombreConvenio(nombreconvenio);
                c.setDescripcion(descripcion);
                c.setFechainicio(creacion);
                c.setFechafin(terminacion);
                c.setVigencia(vigencia);
                c.setEstado(estado);
                c.setIdempresa(entidad);
                
                
                
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
        return c;
    }
    
}
