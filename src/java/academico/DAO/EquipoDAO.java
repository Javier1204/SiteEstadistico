/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.DAO;

import academico.Interface.IEquipoDAO;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mauricio
 */
public class EquipoDAO implements IEquipoDAO {

    @Override
    public int[] registrarEquipo(ArrayList<String> names, String[] equipos, int cod_grupo) throws SQLException {
        int[] rangos = new int[2];
        Pool pool = Conexion.getPool();
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt;
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            stmt = con.prepareStatement("SELECT MAX(codigo) FROM academico_equipo");
            rs = stmt.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) < 1) {
                    rangos[0] = 0;
                } else {
                    rangos[0] = rs.getInt(1);
                }
            }

            for (String s : names) {
                stmt = con.prepareStatement("INSERT INTO `academico_equipo`(`nombre_equipo`) VALUES (?)");
                stmt.setString(1, s);
                int total = stmt.executeUpdate();
                if (total > 0) {
                    System.out.println("it worked");
                    stmt = con.prepareStatement("INSERT INTO `academico_proyecto`(`nombre`, `keywords`, `desc`, "
                            + "`semillero`, `modificable`) VALUES(?,?,?,?,?)");
                    stmt.setString(1, "");
                    stmt.setString(2, "");
                    stmt.setString(3, "");
                    stmt.setInt(4, 0);
                    stmt.setBoolean(5, false);
                    int b = stmt.executeUpdate();
                    if (b > 0) {
                        System.out.println("It worked x2 :v");
                    }

                    int maxProyecto = 0;
                    int maxEquipo = 0;

                    stmt = con.prepareStatement("SELECT MAX(id) FROM academico_proyecto");
                    rs = stmt.executeQuery();
                    while (rs.next()) {
                        maxProyecto = rs.getInt(1);
                    }

                    stmt = con.prepareStatement("SELECT MAX(codigo) FROM academico_equipo");
                    rs = stmt.executeQuery();
                    while (rs.next()) {
                        maxEquipo = rs.getInt(1);
                    }

                    stmt = con.prepareStatement("INSERT INTO `academico_proyectoxequipo`(`proyecto_id`, `equipo_id`)"
                            + "VALUES (?,?)");
                    stmt.setInt(1, maxProyecto);
                    stmt.setInt(2, maxEquipo);
                    int x = stmt.executeUpdate();
                    if (x > 0) {
                        System.out.println("worked yet again");
                    }

                    stmt = con.prepareStatement("INSERT INTO `academico_proyectoxgrupo`(`id_proyecto`, `id_grupo`)"
                            + "VALUES(?,?)");
                    stmt.setInt(1, maxProyecto);
                    stmt.setInt(2, cod_grupo);
                    int y = stmt.executeUpdate();
                    if (y > 0) {
                        System.out.println("finally baby");
                    }
                }
            }
            stmt = con.prepareStatement("SELECT MAX(codigo) FROM academico_equipo");
            rs = stmt.executeQuery();
            while (rs.next()) {
                rangos[1] = rs.getInt(1);
            }
            stmt.close();
            rs.close();
        } catch (Exception ex) {
            System.err.println(ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return rangos;
    }

    @Override
    public int[] registrarEquipoModificable(ArrayList<String> names, String[][] data, int number, int cod_grupo) throws SQLException {
        int[] rangos = new int[2];
        Pool pool = Conexion.getPool();
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt;
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            stmt = con.prepareStatement("SELECT MAX(codigo) FROM academico_equipo");
            rs = stmt.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) < 1) {
                    rangos[0] = 0;
                } else {
                    rangos[0] = rs.getInt(1);
                }
            }
            int v = 0;
            for (String s : names) {
                stmt = con.prepareStatement("INSERT INTO `academico_equipo`(`nombre_equipo`) VALUES (?)");
                stmt.setString(1, s);
                int total = stmt.executeUpdate();
                if (total > 0) {
                    System.out.println("it worked");
                    stmt = con.prepareStatement("INSERT INTO `academico_proyecto`(`nombre`, `keywords`, `desc`, "
                            + "`semillero`, `modificable`) VALUES(?,?,?,?,?)");
                    stmt.setString(1, data[v][0]);
                    stmt.setString(2, data[v][1]);
                    stmt.setString(3, data[v][2]);
                    stmt.setInt(4, 0);
                    stmt.setBoolean(5, true);
                    v++;
                    int b = stmt.executeUpdate();
                    if (b > 0) {
                        System.out.println("It worked x2 :v");
                    }

                    int maxProyecto = 0;
                    int maxEquipo = 0;

                    stmt = con.prepareStatement("SELECT MAX(id) FROM academico_proyecto");
                    rs = stmt.executeQuery();
                    while (rs.next()) {
                        maxProyecto = rs.getInt(1);
                    }

                    stmt = con.prepareStatement("SELECT MAX(codigo) FROM academico_equipo");
                    rs = stmt.executeQuery();
                    while (rs.next()) {
                        maxEquipo = rs.getInt(1);
                    }

                    stmt = con.prepareStatement("INSERT INTO `academico_proyectoxequipo`(`proyecto_id`, `equipo_id`)"
                            + "VALUES (?,?)");
                    stmt.setInt(1, maxProyecto);
                    stmt.setInt(2, maxEquipo);
                    int x = stmt.executeUpdate();
                    if (x > 0) {
                        System.out.println("worked yet again");
                    }

                    stmt = con.prepareStatement("INSERT INTO `academico_proyectoxgrupo`(`id_proyecto`, `id_grupo`)"
                            + "VALUES(?,?)");
                    stmt.setInt(1, maxProyecto);
                    stmt.setInt(2, cod_grupo);
                    int y = stmt.executeUpdate();
                    if (y > 0) {
                        System.out.println("finally baby");
                    }
                }
            }
            stmt = con.prepareStatement("SELECT MAX(codigo) FROM academico_equipo");
            rs = stmt.executeQuery();
            while (rs.next()) {
                rangos[1] = rs.getInt(1);
            }
            stmt.close();
            rs.close();
        } catch (Exception ex) {
            System.err.println(ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return rangos;
    }

    @Override
    public boolean asignarEstudianteAEquipo(String[][] data) throws SQLException {
        Pool pool = Conexion.getPool();
        Connection con = null;
        boolean exito = false;
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            int iterador = 0;
            PreparedStatement stmt = null;
            while (iterador < data.length) {
                stmt = con.prepareStatement("INSERT INTO `academico_estudiantexequipo`(`estudiante`, `equipo`)"
                        + " VALUES(?,?)");
                stmt.setString(1, data[iterador][0]);
                stmt.setInt(2, Integer.parseInt(data[iterador][1]));
                int value = stmt.executeUpdate();
                if(value > 0){
                    iterador++;
                }
            }
            if(iterador == data.length){
                exito = true;
                stmt.close();
            }
            stmt.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return exito;
    }

}
