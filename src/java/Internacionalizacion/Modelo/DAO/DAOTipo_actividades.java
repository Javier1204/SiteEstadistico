/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import Internacionalizacion.Modelo.DTO.Tipo_actividades;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author JAVIER
 */
public class DAOTipo_actividades {
 
    public DAOTipo_actividades(){
        
    }
    
    public boolean registrarTipo_actividades(Tipo_actividades act) {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
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
            stm = con.prepareStatement("INSERT INTO `oficina_tipo_actividades`(`idconvenio`, `movilidad`, `pasantia`, `investigacion`, `extension`, `social`, `practica`) VALUES (?,?,?,?,?,?,?)");//genero el sql. 
            
            stm.setString(1, act.getIdconvenio());
            stm.setBoolean(2, act.isMovilidad());
            stm.setBoolean(3, act.isPasantia());
            stm.setBoolean(4, act.isInvestigacion());
            stm.setBoolean(5, act.isExtension());
            stm.setBoolean(6, act.isSocial());
            stm.setBoolean(7, act.isPractica());
            stm.executeUpdate();//ejecuto la consulta
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("no  registro");
             return false;
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.out.println("no registro");
                System.err.println(ex);
            }
        }   
        return true;
    }
    
    
     public ArrayList<String> consultarTipo_actividades(String idconvenio) {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<String> actividades = new ArrayList();
        
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
            stm = con.prepareStatement("SELECT `movilidad`, `pasantia`, `investigacion`, `extension`, `social`, `practica` FROM `oficina_tipo_actividades` WHERE idconvenio=?");//genero el sql. 
            stm.setString(1, idconvenio);
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
           
            while(resultado.next()){
                
               
                boolean mov = resultado.getBoolean(1);
                boolean pas = resultado.getBoolean(2);
                boolean inv = resultado.getBoolean(3);
                boolean ext = resultado.getBoolean(4);
                boolean soc = resultado.getBoolean(5);
                boolean prac = resultado.getBoolean(6);
                
               if(mov)
                   actividades.add("Movilidad");
               if(pas)
                actividades.add("Pasantia");
               if(inv)
                   actividades.add("Investigacion");
               if(ext)
                   actividades.add("Extension");
               if(soc)
                   actividades.add("Social");
               if(prac)
                   actividades.add("Practica");
               
            }
            
            
            //System.out.println(actividades);
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
        return actividades;
    }
}
