/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.DAO;

import academico.Facade.Facade;
import academico.Interface.IPanelDocenteDAO;
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
public class PanelDocenteDAO implements IPanelDocenteDAO {

    @Override
    public ArrayList<String> asignaturasDoc(int codig_doc) throws SQLException {
        ArrayList<String> asign = null;
        Pool pool = Conexion.getPool();
        Connection con = null;
        PreparedStatement stmt = null;
        Facade fc = new Facade();
        try {
            asign = new ArrayList();
            ArrayList<Integer> codigos = fc.obtenerAsignaturas(codig_doc);
            pool.setUsuario("ufps_76");
            pool.setUsuario("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            ResultSet rs = null;
            for (int i : codigos) {
                stmt = con.prepareStatement("SELECT general_asignatura.nombre\n"
                        + "FROM general_asignatura\n"
                        + "WHERE general_asignatura.codigo =?");
                stmt.setInt(1, i);
                rs = stmt.executeQuery();
                while(rs.next()){
                    asign.add(rs.getString(1));
                }
                stmt.close();
                rs.close();
            }
        } catch (Exception ex) {
            System.err.println(ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return asign;
    }

}
