/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.DAO;

import academico.DTO.ClasificacionEntregableDTO;
import academico.Interface.IEntregableDAO;
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
public class EntregableDAO implements IEntregableDAO {

    @Override
    public boolean crearEntregable(int id_proyecto, int id_tipo, String titulo, String fecha) throws SQLException {
        Pool pool = Conexion.getPool();
        Connection con = null;
        boolean exito = false;
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("INSERT INTO `academico_entregable`(`id_proyecto`, `id_tipo`, `titulo`, `fecha_entrega`)"
                    + "VALUES(?,?,?,?");
            stmt.setInt(1, id_proyecto);
            stmt.setInt(2, id_tipo);
            stmt.setString(3, titulo);
            stmt.setString(4, fecha);
            
            int result = stmt.executeUpdate();
            if(result > 0){
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

    @Override
    public ArrayList<ClasificacionEntregableDTO> listarClasificacion() throws SQLException {
        Pool pool = Conexion.getPool();
        Connection con = null;
        ArrayList<ClasificacionEntregableDTO> list = new ArrayList();
        try{
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM `academico_clasificacion_entregable` WHERE 1");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                ClasificacionEntregableDTO dto = new ClasificacionEntregableDTO();
                dto.setId(rs.getInt(1));
                dto.setNombre(rs.getString(2));
                list.add(dto);
            }
            rs.close();
            stmt.close();
        }catch(SQLException ex){
            System.err.println(ex);
        }finally{
            if(con != null)
                con.close();
        }
        return list;
    }

}
