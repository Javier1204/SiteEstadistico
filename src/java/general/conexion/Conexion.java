/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package general.conexion;

import general.conexion.Pool;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author carlos
 */
public class Conexion {
     private static Pool pool;

    public static Pool getPool() {
        if (pool == null) {
            pool = new Pool();
        }
        return pool;
    }

    public static void main(String ar[]) 
    { 
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        try {
            /**
             * 28/10/2016
             * actualmente se utilizan el usuario ufps_76 pero a futuro cuando se cambien los permisos esto se modificara
             **/
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
           
            if (con != null) {
               System.out.println("me conecte");
            }
        } catch (SQLException ex) {
            System.err.println(ex);
            //en el caso de que se encunetren en una consulta real se recomienta usar
            //    con.rollback();
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.err.println(ex);
            }
        }

    }
}
