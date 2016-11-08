/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.DAO;

import academico.DTO.EstudianteDTO;
import academico.DTO.GrupoDTO;
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
    public ArrayList<EstudianteDTO> obtenerEstudiantes(int cod_asign) throws SQLException {
        Pool pool = Conexion.getPool();
        Connection con = null;
        PreparedStatement stmt = null;
        ArrayList<EstudianteDTO> estudiantes = null;
        EstudianteDTO dto = null;
        try {
            estudiantes = new ArrayList();
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            stmt = con.prepareStatement("SELECT general_estudiante.codigo, general_estudiante.nombres, general_estudiante.apellidos\n"
                    + "FROM academico_estudiantexgrupo, general_estudiante\n"
                    + "WHERE academico_estudiantexgrupo.id_grupo =?\n"
                    + "AND academico_estudiantexgrupo.codigo_estudiante = general_estudiante.codigo");
            stmt.setString(1, "" + cod_asign);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
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

    @Override
    public ArrayList<GrupoDTO> asignaturasDoc(String codig_doc) throws SQLException {
        Pool pool = Conexion.getPool();
        Connection conn = null;
        ArrayList<GrupoDTO> data = new ArrayList();
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            conn = pool.getDataSource().getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT general_asignatura.nombre, general_asignatura.codigo, "
                    + "carga_grupo.id_grupo FROM general_asignatura, carga_grupo, carga_carga_academica "
                    + "WHERE carga_carga_academica.codig_doc = ? AND carga_grupo.id_carga = carga_carga_academica.id");
            stmt.setString(1, codig_doc);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                GrupoDTO dto = new GrupoDTO();
                dto.setNombre(rs.getString(1));
                dto.setCod_asign(rs.getString(2));
                dto.setCod_grupo(rs.getInt(3));
                data.add(dto);
            }
            stmt.close();
            rs.close();
        } catch (Exception ex) {
            System.err.println(ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return data;
    }

}
