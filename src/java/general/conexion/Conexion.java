/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package general.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

/**
 *
 * @author javie
 */
public class Conexion {
     private static String bd = "site";
    private static String login = "ufps_32";
    private static String password = "ufps_26";
    private static String url = "jdbc:mysql://sandbox2.ufps.edu.co:3306/";
    private static String DRIVER = "org.gjt.mm.mysql.Driver";
    private static JDBCMiddler jdbc;
    
    
    /**
     * Comprueba si hay o no hay conexion
     *
     * @return un boolean, true si hay conexion y false si no
     */
    public static boolean hayConexion() {
        return (jdbc != null && jdbc.hayconexion());
    }

    /**
     * Método que realiza la conexion con administrador de la base de datos
     */
    public static Connection conectar() throws Exception {
        Connection conn = null;
        Class.forName(DRIVER).newInstance();
        conn = DriverManager.getConnection(url + bd, login, password);
        if (conn != null) {
            System.out.println("Conexion establecida");
        }
        return conn;
    }

    /**
     * Método que ejecuta una actualizacion en una bae de datos
     *
     * @param comandoSQL es de tipo Sting y contiene el comando SQL para
     * ejecutar la actualizacion
     * @return un tipo boolean, true si ejecuta la actualiza y false sino.
     */
    public static boolean ejecutarActualizacionSQL(String comandoSQL) {
        try {
            return (jdbc.ejecutarActualizacionSQL(comandoSQL));
        } catch (Exception e) {
            System.err.println("SQL Error:" + e.getMessage());
            return (false);
        }
    }

    /**
     * Método que desconecta la aplicacion de la base de datos
     */
    public static void desconectar() {
        try {
            jdbc.desconectar();
        } catch (Exception e) {
            System.err.println("SQL Error:" + e.getMessage());
        }
    }

    /**
     * Método que retorna una consulta en formato de tabla HTML
     *
     * @param sql contiene la consulta en sql
     * @return un Stirng con la informacion en formato de tabla HTML
     */
    public static String getTablaHTML(String sql) {
        try {
            return (jdbc.getHTML(sql));
        } catch (Exception e) {
            System.err.println("SQL Error:" + e.getMessage());
            return ("No se pudo crear la tabla");
        }
    }

    /**
     * Método que ejecuta una instruccion SQL
     *
     * @param consultaSQL es de tipo Stringy contiene la consulta en SQL
     * @return un tipo ResultSet que contiene la informacion sobre la consulta.
     */
    public static ResultSet ejecutarSQL(String consultaSQL) {
        try {
            return (jdbc.ejecutarSQL(consultaSQL));
        } catch (Exception e) {
            System.err.println("SQL Error:" + e.getMessage());
            return (null);
        }
    }

    /**
     * Método que ejecuta una consulta en SQL
     *
     * @param sql es de tipo String y contiene la consulta en sql
     * @return un tipo ArrayList y contiene la informacion que retorna la
     * consulta
     */
    public static java.util.ArrayList<String> getConsultaSQL(String sql) {
        try {
            return (jdbc.getSQL(sql));
        } catch (Exception e) {
            System.err.println("SQL Error:" + e.getMessage());
            return (null);
        }
    }
}


