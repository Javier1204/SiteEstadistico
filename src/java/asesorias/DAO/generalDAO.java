/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asesorias.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DiegoLeal
 */
public class generalDAO {

    private static Pool pool;

    public static Pool getPool() {
        if (pool == null) {
            pool = new Pool();
        }
        return pool;
    }

    /**
     * consulta a la base de datos
     *
     * @param codigoDocente
     * @return
     */
    public String consultarMateriasDocente(String codigoDocente) {

        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        String resul = "";
        try {
            /**
             * 28/10/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion

            stm = con.prepareStatement("SELECT cod_asignatura, grupo, g.nombre\n"
                    + "  FROM carga_grupo, general_asignatura g\n"
                    + "  WHERE id_carga = (SELECT id FROM carga_carga_academica WHERE codig_doc = ?)\n"
                    + "    AND cod_asignatura = g.codigo;");//genero el sql. 
            stm.setString(1, codigoDocente);

            ResultSet rs = stm.executeQuery();
            System.out.println("EJecuto la consulta:: " + rs.toString());
            if (rs != null) {
                System.out.println("EJecuto la consulta:222: " + rs.toString());
                while (rs.next()) {
                    System.out.println("EJecuto la consulta:333 : " + rs.toString());
                    resul += rs.getString("cod_asignatura");
                    resul += ";";
                    resul += rs.getString("grupo");
                    resul += ";";
                    resul += rs.getString("g.nombre");
                    resul += ":";
                }
            } else {
                resul = "vacio";
            }

            stm.close();//cierro el preparedstatement
            rs.close(); //cierro el resultset
        } catch (SQLException ex) {
            try {
                System.err.println(ex);
                //en el caso de que se encunetren en una consulta real se recomienta usar
                con.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(generalDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.err.println(ex);
            }
        }
        return resul;
    }

    public String consultarEstudiantes(String codMateria, String grupo) {

        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        String resul = "";
        try {
            /**
             * 28/10/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion

            stm = con.prepareStatement("SELECT nombres, apellidos, codigo FROM general_estudiante "
                    + "WHERE codigo IN (SELECT id_grupo FROM academico_estudiantexgrupo "
                    + "WHERE id_grupo = (SELECT id_grupo FROM carga_grupo "
                    + "WHERE cod_asignatura = ? AND grupo = ?));");
            stm.setString(1, codMateria);
            stm.setString(2, grupo);

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("nombres");
                    resul += ";";
                    resul += rs.getString("apellidos");
                    resul += ";";
                    resul += rs.getString("codigo");
                    resul += ":";
                }
            } else {
                resul = "vacio";
            }

            stm.close();//cierro el preparedstatement
            rs.close(); //cierro el resultset
        } catch (SQLException ex) {
            try {
                System.err.println(ex);
                //en el caso de que se encunetren en una consulta real se recomienta usar
                con.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(generalDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.err.println(ex);
            }
        }
        return resul;
    }

    public String consultarDocenteNombre(String docente) {
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        String resul = "";
        try {
            /**
             * 28/10/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion

            stm = con.prepareStatement("SELECT c.dia, c.hora_ini, c.hora_fin, g.nombres, g.apellidos "
                    + "FROM carga_asesoria c, general_docente g "
                    + "WHERE c.cod_doc IN (SELECT codigo FROM general_docente WHERE nombres LIKE ? OR apellidos LIKE ?)"
                    + "AND g.codigo = c.cod_doc");
            stm.setString(1, "%" + docente + "%");
            stm.setString(2, "%" + docente + "%");

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("c.dia");
                    resul += ";";
                    resul += rs.getString("c.hora_ini");
                    resul += ";";
                    resul += rs.getString("c.hora_fin");
                    resul += ";";
                    resul += rs.getString("g.nombres");
                    resul += ";";
                    resul += rs.getString("g.apellidos");
                    resul += ":";
                }
            } else {
                resul = "vacio";
            }

            stm.close();//cierro el preparedstatement
            rs.close(); //cierro el resultset
        } catch (SQLException ex) {
            try {
                System.err.println(ex);
                //en el caso de que se encunetren en una consulta real se recomienta usar
                con.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(generalDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.err.println(ex);
            }
        }
        return resul;
    }

    public String consultarMateriaNombre(String materia) {
        //ejemplo para usar el pool de conexiones. 
        Pool pool = Conexion.getPool(); //llamo al objeto pool 
        Connection con = null;
        PreparedStatement stm = null;
        String resul = "";
        try {
            /**
             * 28/10/2016 actualmente se utilizan el usuario ufps_76 pero a
             * futuro cuando se cambien los permisos esto se modificara
             */
            pool.setUsuario("ufps_76"); //ingreso el usuario
            pool.setContrasena("ufps_29");//ingreso la contraseña
            pool.inicializarDataSource(); // inicializo el datasource con los datos de usuario 
            con = pool.getDataSource().getConnection();  //genero la conexion

            stm = con.prepareStatement("SELECT ");

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("c.dia");
                    resul += ";";
                    resul += rs.getString("c.hora_ini");
                    resul += ";";
                    resul += rs.getString("c.hora_fin");
                    resul += ";";
                    resul += rs.getString("g.nombres");
                    resul += ";";
                    resul += rs.getString("g.apellidos");
                    resul += ":";
                }
            } else {
                resul = "vacio";
            }

            stm.close();//cierro el preparedstatement
            rs.close(); //cierro el resultset
        } catch (SQLException ex) {
            try {
                System.err.println(ex);
                //en el caso de que se encunetren en una consulta real se recomienta usar
                con.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(generalDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                System.err.println(ex);
            }
        }
        return resul;
    }

}
