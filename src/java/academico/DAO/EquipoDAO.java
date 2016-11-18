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
        PreparedStatement stmt, stmt2, stmt3, stmt4, stmt5, stmt6, stmt7, stmt8;
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
                stmt2 = con.prepareStatement("INSERT INTO `academico_equipo`(`nombre_equipo`) VALUES (?)");
                stmt2.setString(1, s);
                int total = stmt2.executeUpdate();
                if (total > 0) {
                    System.out.println("it worked");
                    stmt2.close();
                    stmt4 = con.prepareStatement("INSERT INTO `academico_proyecto`(`nombre`, `keywords`, `desc`, "
                            + "`max_integrantes`, `semillero`) VALUES(?,?,?,?,?)");
                    stmt4.setString(1, "");
                    stmt4.setString(2, "");
                    stmt4.setString(3, "");
                    stmt4.setInt(4, 3);
                    stmt4.setInt(5, 0);
                    int b = stmt4.executeUpdate();
                    if (b > 0) {
                        System.out.println("It worked x2 :v");
                    }
                    stmt4.close();
                    
                    int maxProyecto = 0;
                    int maxEquipo = 0;
                    
                    stmt5 = con.prepareStatement("SELECT MAX(id) FROM academico_proyecto");
                    rs = stmt5.executeQuery();
                    while(rs.next()){
                       maxProyecto = rs.getInt(1);
                    }
                    stmt5.close();
                    
                    stmt6 = con.prepareStatement("SELECT MAX(codigo) FROM academico_equipo");
                    rs = stmt6.executeQuery();
                    while(rs.next()){
                        maxEquipo = rs.getInt(1);
                    }
                    stmt6.close();
                    
                    stmt7 = con.prepareStatement("INSERT INTO `academico_proyectoxequipo`(`proyecto_id`, `equipo_id`)"
                            + "VALUES (?,?)");
                    stmt7.setInt(1, maxProyecto);
                    stmt7.setInt(2, maxEquipo);
                    int x = stmt7.executeUpdate();
                    if(x > 0){
                        System.out.println("worked yet again");
                    }
                    stmt7.close();
                    
                    stmt8 = con.prepareStatement("INSERT INTO `academico_proyectoxgrupo`(`id_proyecto`, `id_grupo`)"
                            + "VALUES(?,?)");
                    stmt8.setInt(1, maxProyecto);
                    stmt8.setInt(2, 6);
                    int y = stmt8.executeUpdate();
                    if(y > 0){
                        System.out.println("finally baby");
                    }
                    stmt8.close();
                }
            }
            stmt3 = con.prepareStatement("SELECT MAX(codigo) FROM academico_equipo");
            rs = stmt3.executeQuery();
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
