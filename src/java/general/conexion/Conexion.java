/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package general.conexion;

import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    /**
     * conexion a la base de datos
     */
    private void ejemploConexion() {
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        try {
            /**
             * 28/10/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             *
             */
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

    /**
     * consulta a la base de datos
     */
    private void ejemploConexionConsulta() {

        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;  
        PreparedStatement stm = null;
        try {
            /**
             * 28/10/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             *
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("select * from general_estudiante where codigo=?");//genero el sql. 
            stm.setString(1, "115");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString(1));//Numero de la columna
                System.out.println(rs.getString(2));//Numero de la columna
            }
            stm.close();//cierro el preparedstatement
            rs.close(); //cierro el resultset
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

    /**
     * consulta a la base de datos
     */
    private void ejemploConexionInsertar() {

        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        try {
            /**
             * 28/10/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             *
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion
            stm = con.prepareStatement("insert into general_estudiante values(?,?,?,?,?,?,?,?,?)");//genero el sql. 
            stm.setString(1, "1151111");
            stm.setString(2, "9999999");
            stm.setString(3, "prueba");
            stm.setString(4, "prueba 2");
            stm.setInt(5, 0);
            stm.setString(6, "1");
            stm.setString(7, "ingenieria de sistemas");
            stm.setBoolean(8, false);
            stm.setBoolean(9, false);
            stm.executeUpdate();//ejecuto la consulta
            stm.close();//cierro el preparedstatement

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

    public static void main(String ar[]) {
//        Conexion conexion = new Conexion();
//        conexion.ejemploConexionConsulta();
    }
}
