/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.DAO;

import academico.DTO.ProyectoDTO;
import academico.Interface.IEstudianteDAO;
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
public class EstudianteDAO implements IEstudianteDAO {

    @Override
    public ArrayList<ProyectoDTO> listarProyectos(String cod_estudiante) throws SQLException {
        ArrayList<ProyectoDTO> list = new ArrayList();
        Pool pool = Conexion.getPool();
        Connection con = null;
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT p.id, p.nombre, p.keywords, p.desc, p.semillero, p.modificable, e.nombre_equipo "
                    + "FROM academico_proyecto p, academico_equipo e, academico_proyectoxequipo pe, academico_estudiantexequipo ee, general_estudiante e "
                    + "WHERE p.id = pe.proyecto_id AND pe.equipo_id = ee.equipo AND pe.equipo_id = e.codigo AND ee.estudiante = ?");
            stmt.setString(1, cod_estudiante);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ProyectoDTO dto = new ProyectoDTO();
                dto.setProyecto_id(rs.getInt(1));
                dto.setProyecto_name(rs.getString(2));
                dto.setKeywords(rs.getString(3));
                dto.setDesc(rs.getString(4));
                dto.setSemillero(rs.getInt(5));
                dto.setModificable(rs.getBoolean(6));
                dto.setEquipo_encargado(rs.getString(7));
                list.add(dto);
            }
            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    @Override
    public int obtenerCodigoEquipo(String cod_estudiante, int proyecto) throws SQLException {
        Pool pool = Conexion.getPool();
        Connection con = null;
        int value = 0;
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT ee.equipo FROM academico_estudiantexequipo ee, academico_proyectoxequipo pe"
                    + "WHERE ee.estudiante = ? AND pe.proyecto_id = ?");
            stmt.setString(1, cod_estudiante);
            stmt.setInt(2, proyecto);
            value = stmt.executeUpdate();
            stmt.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return value;
    }

    @Override
    public boolean subirEntregable(int cod_equipo, int cod_entregable, String url) throws SQLException {
        boolean exito = false;
        Pool pool = Conexion.getPool();
        Connection con = null;
        try{
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("INSERT INTO `academico_entregable_equipo`"
                    + "(`equipo_id`, `entregable_id`, `url_deposito`) VALUES(?,?,?)");
            stmt.setInt(1, cod_equipo);
            stmt.setInt(2, cod_entregable);
            stmt.setString(3, url);
            
            int value = stmt.executeUpdate();
            if(value > 0){
                exito = true;
                stmt.close();
            }
            stmt.close();
        }catch(SQLException ex){
            System.err.println(ex);
        }finally{
            if(con != null)
                con.close();
        }
        return exito;
    }

}
