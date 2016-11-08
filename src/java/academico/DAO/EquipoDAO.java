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

/**
 *
 * @author Mauricio
 */
public class EquipoDAO implements IEquipoDAO {

    @Override
    public int[] registrarEquipo(ArrayList<String> names) throws SQLException {
        int[] rangos = new int[2];
        Pool pool = Conexion.getPool();
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt, stmt2, stmt3;
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
            stmt.close();

            for (String s : names) {
                pool.setUsuario("ufps_76");
                pool.setContrasena("ufps_29");
                pool.inicializarDataSource();
                con = pool.getDataSource().getConnection();
                stmt2 = con.prepareStatement("INSERT INTO `academico_equipo`(`nombre_equipo`) VALUES (?)");
                stmt2.setString(1, s);
                int total = stmt.executeUpdate();
                if (total > 0) {
                    System.out.println("it worked");
                    stmt2.close();
                }
            }

            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            stmt3 = con.prepareStatement("SELECT MAX(codigo) FROM academico_equipo");
            rs = stmt.executeQuery();
            while (rs.next()) {
                rangos[1] = rs.getInt(1);
            }
            stmt3.close();
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

}
