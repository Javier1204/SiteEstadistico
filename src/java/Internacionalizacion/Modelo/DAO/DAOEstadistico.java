/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author JAVIER
 */
public class DAOEstadistico {
    
    //Consulta para obtener la cantidad de convenios registrados.
    public int consultarCantidadConvenios(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        int cantidad = 0;
        
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
            System.out.println("########################");
            stm = con.prepareStatement("SELECT count(*) FROM `general_convenio` where fechacreacion>=? and fechaterminacion<=?");//genero el sql. 
            System.out.println("-------------------------------");
            stm.setString(1, inicio);
            stm.setString(2, terminacion);
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            
            while(resultado.next()){
                
                cantidad = resultado.getInt(1);               
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return cantidad;
    }           
    
    //Consultar cantidad de convenios activos.
    public int consultarCantidadConveniosActivos(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        int cantidad = 0;
        
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
           
            stm = con.prepareStatement("SELECT count(*) FROM general_convenio WHERE CURDATE() <= fechaterminacion AND fechacreacion>=? and fechaterminacion<=?");//genero el sql. 
            
            stm.setString(1, inicio);
            stm.setString(2, terminacion);
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            
            while(resultado.next()){
                
                cantidad = resultado.getInt(1);               
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return cantidad;
    }           
    
    //Consulta para obtener la cantidad de convenios aprobados y terminados.
    public ArrayList<String> consultarConveniosporEstado(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<String> l = new ArrayList();
        
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
            stm = con.prepareStatement("SELECT estado, count(*) FROM `general_convenio` WHERE fechacreacion>=? and fechaterminacion<=? GROUP BY estado");//genero el sql. 
            
            stm.setString(1, inicio);
            stm.setString(2, terminacion);
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            
            while(resultado.next()){
                
                String estado = resultado.getString(1);
                int cantidad = resultado.getInt(2);
                
                String fila = ""+estado+";"+cantidad;
                l.add(fila);             
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return l;
    }    
    
    //Consulta para obtener la cantidad de convenios por tipo.
    public ArrayList<String> consultarConveniosporTipo(String inicio, String terminacion){
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<String> l = new ArrayList();
        
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
            stm = con.prepareStatement("SELECT tipo_convenio, count(*) FROM `general_convenio` WHERE fechacreacion>=? and fechaterminacion<=?  GROUP BY tipo_convenio");//genero el sql. 
            
            stm.setString(1, inicio);
            stm.setString(2, terminacion);
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            
            while(resultado.next()){
                
                String tipo = resultado.getString(1);
                int cantidad = resultado.getInt(2);
                
                String fila = ""+tipo+";"+cantidad;
                l.add(fila);             
                
            }
                        
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("No consulto");
                System.err.println(ex);
            }
        }   
        return l;
    }    
    
}
