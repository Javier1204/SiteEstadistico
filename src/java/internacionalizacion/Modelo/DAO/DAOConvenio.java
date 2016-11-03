/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Modelo.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import internacionalizacion.Modelo.DTO.Convenio;
import internacionalizacion.Modelo.DTO.Entidad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author JAVIER
 */
public class DAOConvenio {
    
    
    
    public ArrayList<Convenio> consultarConvenios() {
     //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        ArrayList<Convenio> convenios= new  ArrayList();
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
            stm = con.prepareStatement("Select * from general_convenio"); //genero el sql. 
            
            ResultSet resultado = stm.executeQuery();//ejecuto la consulta
            
            Convenio c;
            while (resultado.next()) {
                
                int id = resultado.getInt(1);
                String nombre = resultado.getString(2);
                String descripcion = resultado.getString(3);
                Date creacion = resultado.getDate(4);
                Date terminacion = resultado.getDate(5);
                String vigencia = resultado.getString(6);
                String estado = resultado.getString(7);
                String tipo_convenio = resultado.getString(8);
                int entidad = resultado.getInt(9);
                String urlimagen = resultado.getString(10);
                c = new Convenio(id,nombre,descripcion,creacion,terminacion,vigencia,estado,tipo_convenio,entidad,urlimagen);
                convenios.add(c);
                
                
            } 
            stm.close();//cierro el preparedstatement
            
            
        } catch (SQLException ex) {
            System.err.println(ex);
            System.out.println("No consulto convenios");
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                 System.out.println("Error cerrando conexión!");
                System.err.println(ex);
            }
        }   
        return convenios;
    }
    
}
