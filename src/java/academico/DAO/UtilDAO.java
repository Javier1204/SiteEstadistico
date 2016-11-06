/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.DAO;

import academico.DTO.EstudianteDTO;
import academico.Facade.Facade;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import academico.Interface.IUtilDAO;

/**
 *
 * @author Mauricio
 */
public class UtilDAO implements IUtilDAO {

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
                while (rs.next()) {
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

    @Override
    public ArrayList<EstudianteDTO> obtenerEstudiantes(int cod_asign) throws SQLException {
        Pool pool = Conexion.getPool();
        Connection con = null;
        PreparedStatement stmt = null;
        ArrayList<EstudianteDTO> estudiantes = null;
        EstudianteDTO dto = null;
        try {
            estudiantes = new ArrayList();
            pool.setUsuario("ufps_76");
            pool.setUsuario("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            stmt = con.prepareStatement("SELECT general_estudiante.codigo, general_estudiante.nombres, general_estudiante.apellidos\n"
                    + "FROM academico_estudiantexgrupo, general_estudiante\n"
                    + "WHERE academico_estudiantexgrupo.id_grupo =?\n"
                    + "AND academico_estudiantexgrupo.codigo_estudiante = general_estudiante.codigo");
            stmt.setInt(1, cod_asign);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                dto = new EstudianteDTO();
                dto.setCodigo(rs.getInt(1));
                dto.setNombre(rs.getString(2));
                dto.setApellido(rs.getString(3));
                estudiantes.add(dto);
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
        return estudiantes;
    }

}
