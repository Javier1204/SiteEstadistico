/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DAO;

import Internacionalizacion.Modelo.DTO.Docente;
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
public class DAODocente {
    
    public ArrayList<Docente> ObtenerDocentes() {
        Pool pool = Conexion.getPool();
        Connection con = null;
        ArrayList<Docente> docentes = new ArrayList();
        Docente d = null;
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT codigo, cedula, nombres, apellidos, oficina_habilitado FROM general_docente");
            ResultSet resultado = stmt.executeQuery();
            
            while (resultado.next()) {
                String codigo = resultado.getString(1);
                String cedula = resultado.getString(2);
                String nombres = resultado.getString(3);
                String apellidos = resultado.getString(4);
                boolean habilitado = resultado.getBoolean(5);
                
                d = new Docente(codigo, cedula, nombres, apellidos, habilitado);
                docentes.add(d);
            }

            stmt.close();
           
            
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
             System.out.println("No consulto");
            
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
        return docentes;
    }
    
    public Docente consultarDocente(String codigo) {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        Docente d = null;
        
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
            stm = con.prepareStatement("Select codigo, cedula, nombres, apellidos, oficina_habilitado from `general_docente` where codigo=?");//genero el sql. 
            stm.setString(1, codigo);
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            while(resultado.next()){
                
                String cod = resultado.getString(1);
                String cedula = resultado.getString(2);
                String nombres = resultado.getString(3);
                String apellidos = resultado.getString(4);
                boolean habilitado = resultado.getBoolean(5);
                d = new Docente(cod, cedula, nombres, apellidos, habilitado);
                
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
        return d;
    }           
    
}
