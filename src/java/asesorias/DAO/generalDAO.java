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
                    + "WHERE codigo IN (SELECT codigo_estudiante FROM academico_estudiantexgrupo "
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

    public String consultarDocenteNombre(String docente, String periodo, String fechacierre) {
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
                    + "FROM carga_asesoria c, general_docente g, carga_carga_academica ca "
                    + "WHERE c.cod_doc IN (SELECT codigo FROM general_docente WHERE nombres LIKE ? OR apellidos LIKE ?)"
                    + " AND g.codigo = c.cod_doc;");
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
                    resul += "#";
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

    public String consultarMateriaNombre(String materia, String grupo, String periodo, String fechacierre) {
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

            stm = con.prepareStatement("SELECT a.dia, a.hora_ini, a.hora_fin, m.nombre "
                    + "FROM carga_asesoria a, general_asignatura m "
                    + "WHERE a.cod_doc IN (SELECT codig_doc FROM carga_carga_academica WHERE periodo = ? "
                    + "AND fechacierre = CAST(? AS DATE) AND id IN (SELECT id_carga FROM carga_grupo "
                    + "WHERE grupo =  AND cod_asignatura IN (SELECT codigo FROM general_asignatura "
                    + "WHERE nombre LIKE ?))) GROUP BY a.dia, a.hora_ini, a.hora_fin");
            stm.setInt(1, Integer.parseInt(periodo));
            stm.setString(2, fechacierre);
            stm.setString(3, grupo);
            stm.setString(4, "%" + materia + "%");

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("a.dia");
                    resul += ";";
                    resul += rs.getString("a.hora_ini");
                    resul += ";";
                    resul += rs.getString("a.hora_fin");
                    resul += ";";
                    resul += rs.getString("m.nombre");
                    resul += "#";
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

    public String consultarPeriodo() {
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

            stm = con.prepareStatement("SELECT periodo, fechacierre FROM carga_carga_academica c "
                    + "WHERE timestampdiff(month, c.fechacierre, curdate()) <= 6;");

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("periodo");
                    resul += ";";
                    resul += rs.getString("fechacierre");
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

    public String consultarDocenteCodigo(String docente) {
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
                    + "WHERE c.cod_doc = ? AND g.codigo = ?");
            stm.setString(1, docente);
            stm.setString(2, docente);

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
                    resul += "#";
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

    public String consultarMateriaCodigo(String materia, String grupo, String periodo, String fechacierre) {
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

            stm = con.prepareStatement("SELECT c.dia, c.hora_ini, c.hora_fin g.nombre"
                    + "FROM carga_asesoria c, general_asesoria g, carga_carga_academica ca"
                    + "WHERE ca.id IN (SELECT id_carga FROM carga_grupo WHERE cod_asignatura = ? AND grupo = ?) "
                    + "ca.periodo = ? AND ca.fechacierre = CAST(? AS DATE)"
                    + " AND c.cod_doc IN (SELECT  FROM carga_grupo WHERE cod_asignatura = ? AND grupo = ?)");

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("c.dia");
                    resul += ";";
                    resul += rs.getString("c.hora_ini");
                    resul += ";";
                    resul += rs.getString("c.hora_fin");
                    resul += ";";
                    resul += rs.getString("g.nombre");
                    resul += "#";
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

    public String consultarAsesoriasAnteriores(String codDoc) {
        System.out.println("consusltando asesorias anteriores " + codDoc);
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

            stm = con.prepareStatement("SELECT fecha, cod_est, cod_docente, cod_m, c.grupo, tema, hora "
                    + "FROM asesoria_formatoasesoria a, carga_grupo c "
                    + "WHERE (fecha BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL -8 DAY) OR fecha = CURDATE()) "
                    + "AND a.grupo = c.id_grupo AND cod_docente = ?;");
            stm.setString(1, codDoc);

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("fecha");
                    resul += ";";
                    resul += rs.getString("cod_est");
                    resul += ";";
                    resul += rs.getString("cod_docente");
                    resul += ";";
                    resul += rs.getString("cod_m");
                    resul += ";";
                    resul += rs.getString("c.grupo");
                    resul += ";";
                    resul += rs.getString("tema");
                    resul += ";";
                    resul += rs.getString("hora");
                    resul += "#";
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

    public String consultarNombreEst(String codEst) {
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

            stm = con.prepareStatement("SELECT nombres, apellidos FROM general_estudiante WHERE codigo = ?");
            stm.setString(1, codEst);

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("nombres");
                    resul += " ";
                    resul += rs.getString("apellidos");
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

    public String consultarNombreMat(String codMat) {
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

            stm = con.prepareStatement("SELECT nombre FROM general_asignatura WHERE codigo = ?");
            stm.setString(1, codMat);

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("nombre");
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

    public String consultarCantAsesoriasDocente(String codDoc, String periodo, String año) {
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

            stm = con.prepareStatement("SELECT COUNT(a.cod_docente), d.nombres, d.apellidos, a.cod_docente, d.tipo_vinculacion "
                    + "FROM general_docente d, asesoria_formatoasesoria a "
                    + "WHERE a.cod_docente = d.codigo GROUP BY a.cod_docente ORDER BY COUNT(cod_m) ");

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("COUNT(a.cod_docente)");
                    resul += ";";
                    resul += rs.getString("d.nombres");
                    resul += ";";
                    resul += rs.getString("d.apellidos");
                    resul += ";";
                    resul += rs.getString("a.cod_docente");
                    resul += ";";
                    resul += rs.getString("d.tipo_vinculacion");
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

    public String consultarAsesoriasMaterias(String periodo, String año) {
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
            con = pool.getDataSource().getConnection();//genero la conexion

            stm = con.prepareStatement("SELECT COUNT(cod_m), a.cod_m, ga.nombre, cg.grupo "
                    + "FROM asesoria_formatoasesoria a, general_asignatura ga, carga_grupo cg "
                    + "WHERE a.cod_m = ga.codigo AND a.grupo = cg.id_grupo AND cg.cod_asignatura = ga.codigo "
                    + "GROUP BY a.cod_m, ga.nombre, cg.grupo"
                    + " ORDER BY COUNT(cod_m)");

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("COUNT(cod_m)");
                    resul += ";";
                    resul += rs.getString("a.cod_m");
                    resul += ";";
                    resul += rs.getString("ga.nombre");
                    resul += ";";
                    resul += rs.getString("cg.grupo");
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

    public String consultarEstudiantesMateria(String periodo, String año) {
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

            stm = con.prepareStatement("SELECT ga.nombre, a.cod_m, cg.grupo, COUNT(a.cod_est) "
                    + "FROM general_asignatura ga, carga_grupo cg, asesoria_formatoasesoria a "
                    + "WHERE cg.id_grupo = a.grupo AND a.cod_m = ga.codigo "
                    + "GROUP BY a.cod_m ORDER BY COUNT(a.cod_est)");

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("ga.nombre");
                    resul += ";";
                    resul += rs.getString("a.cod_m");
                    resul += ";";
                    resul += rs.getString("cg.grupo");
                    resul += ";";
                    resul += rs.getString("COUNT(a.cod_est)");
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

    public String consultarHorasAsesoriasDocente() {
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

            stm = con.prepareStatement("");

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {

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

    public String consultarNombreDocente(String codDoc) {
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

            stm = con.prepareStatement("SELECT nombres, apellidos FROM general_docente WHERE codigo = ?");
            stm.setString(1, codDoc);

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("nombres");
                    resul += " ";
                    resul += rs.getString("apellidos");
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

    public String consultarAsesoriasDoc(String codDoc) {
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

            stm = con.prepareStatement("SELECT a.cod_m, ga.nombre, cg.grupo, ge.nombres, ge.apellidos, a.tema, a.fecha, a.hora "
                    + "FROM asesoria_formatoasesoria a, general_asignatura ga, carga_grupo cg, general_estudiante ge "
                    + "WHERE a.cod_docente = ? AND ga.codigo = a.cod_m AND cg.id_grupo = a.grupo AND ge.codigo = a.cod_est");
            stm.setString(1, codDoc);

            ResultSet rs = stm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    resul += rs.getString("a.cod_m");
                    resul += ";";
                    resul += rs.getString("ga.nombre");
                    resul += ";";
                    resul += rs.getString("cg.grupo");
                    resul += ";";
                    resul += rs.getString("ge.nombres");
                    resul += ";";
                    resul += rs.getString("ge.apellidos");
                    resul += ";";
                    resul += rs.getString("a.tema");
                    resul += ";";
                    resul += rs.getString("a.fecha");
                    resul += ";";
                    resul += rs.getString("a.hora");
                    resul += "#";
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
