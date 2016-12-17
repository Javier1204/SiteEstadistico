/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ufps.util;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Clase que permite conectar con una Base De datos Mysql; sin embargo,
 * con solo cambiar el atributo controlador puede usarse para cualquier motor de base de datos
 * @author madarme
 */
public class BaseDeDatos {
    private static final String bd = "ufps_25";
    private static final String login = "root";
    private static final String password = "";
//   private static final String url = "jdbc:mysql://sandbox2.ufps.edu.co/"+bd;
    private static final String url = "jdbc:mysql://localhost:3306/"+bd;
   private static final String controlador = "com.mysql.jdbc.Driver";
    private static JDBCMiddler jdbc;
    
    /**
     *
     * @return
     */
    public static boolean hayConexion() {
        return (jdbc != null && jdbc.hayConexion());
    }
    
   
    /**
     *
     */
    public static void conectar() {

        //BaseDeDatos.url = BaseDeDatos.url+BaseDeDatos.bd;
        jdbc = new JDBCMiddler(controlador, url, login, password);
        try {
            jdbc.conectar();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    
    //  == P A R A M E T R I Z A D A S ==
    
    
    /**
     * Metodo para ejecutar consultas parametrizadas en la base de datos
     * @param String sql con la con la consulta parametrizada
     * @param Object[] param arreglo de tamaño igual al numero de ? en la
     * consulta parametrizada y en cada posición guarda el dato correspondiente.
     * @return boolean si es verdad que se pudo ejecutar la consulta
     */
    public static boolean ejecutarActualizacionSQL(String sql, Object[] param) {
        
        try {
            return (jdbc.ejecutarActualizacionSQL(sql, param));
        } catch (Exception e) {
            System.err.println("SQL error " + e.getMessage());
            return false;
        }
    }
    
     public static boolean ejecutarActualizacion1SQL(String sql, Object[] param,String[]error) {
        
        try {
            return (jdbc.ejecutarActualizacionSQL(sql, param));
        } catch (Exception e) {
          error[0]=("SQL error " + e.getMessage());
            return false;
        }
    }
    

    /**
     * Metodo para ejecutar consultas parametrizadas en la base de datos
     * @param String sql con la con la consulta parametrizada
     * @param Object[] param arreglo de tamaño igual al numero de ? en la
     * consulta parametrizada y en cada posición guarda el dato correspondiente.
     * @return ResultSet objeto que contiene los datos de la consulta
     */
    public static ResultSet ejecutarSQL(String consultaSQL, Object[] param) {
        try {
            return (jdbc.ejecutarSQL(consultaSQL, param));
        } catch (Exception e) {
            System.err.println("SQL Error:" + e.getMessage());
            return (null);
        }
    }
    
    
    /**
     * Metodo para ejecutar consultas parametrizadas en la base de datos
     * @param String sql con la con la consulta parametrizada
     * @param Object[] param arreglo de tamaño igual al numero de ? en la
     * consulta parametrizada y en cada posición guarda el dato correspondiente.
     * @return ArrayLis<String> contiene los datos de la consulta, cada nodo
     * equivale a un registro, los datos de los campos están concatenados
     */
    public static java.util.ArrayList<String> getConsultaSQL(String sql, Object[] param) {
        try {
            return jdbc.getSQL(sql, param);
        } catch (Exception e) {
            System.err.println("SQL Error:" + e.getMessage());
            return (null);
        }
    }
    
    //  == F I N == 

    /**
     *
     * @param comandoSQL
     * @return
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
     *
     */
    public static void desconectar() {
        
        try {
            jdbc.desconectar();
        } catch (Exception e) {
            System.err.println("SQL Error:" + e.getMessage());

        }
    }

    /**
     *
     * @param sql
     * @return
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
     *
     * @param consultaSQL
     * @return
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
     *
     * @param sql
     * @return
     */
    public static java.util.ArrayList<String> getConsultaSQL(String sql) {
        try {
            return (jdbc.getSQL(sql));
        } catch (Exception e) {
            System.err.println("SQL Error:" + e.getMessage());
            return (null);
        }
    }
/**
 * para realizaccion de transcacciones
 * @param bandera
 * @throws SQLException 
 */
    public static  void setAutocommit(Boolean bandera) throws SQLException{
          
        try {
            jdbc.setAutocommit(bandera);
        } catch (Exception ex) {
          System.err.println("SQL Error:" + ex.getMessage());
        }
    }

    public static  void rollback() throws SQLException{
        try {
            jdbc.rollback();
        } catch (Exception ex) {
            System.err.println("SQL Error:" + ex.getMessage());
        }
    }
    public static  void commit() throws SQLException{
        try {
            jdbc.commit();
        } catch (Exception ex) {
            System.err.println("SQL Error:" + ex.getMessage());
        }
    }



 
}
