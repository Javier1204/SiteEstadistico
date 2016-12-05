/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.model.dao;

import gruposinvestigacion.model.dto.GeneralDocente;
import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionIntegrante;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class GrupoDAO extends Dao {

    private PreparedStatement state;
    private ResultSet rs;

    public GrupoDAO() {
    }

    public GrupoDAO(Connection conexion) {
        super(conexion);
    }

    public InvestigacionGrupo getGrupo(String codigoColciencias) throws SQLException {

        InvestigacionGrupo grupo = null;
        String consulta = "SELECT * FROM investigacion_grupo WHERE codigocolciencias=?";
        try {
            this.abrirConexion();

            state = this.conexion.prepareStatement(consulta);
            state.setString(1, codigoColciencias);
            rs = state.executeQuery();
            InvestigacionIntegrante<GeneralDocente> director = null;

            while (rs.next()) {
                director = new IntegranteDAO(conexion).getConexionExterna(rs.getString("investigacion_integrante_codigoDirector"), 3);
                grupo = new InvestigacionGrupo(codigoColciencias, null,
                        rs.getString("nombregrupo"), rs.getString("sigla"), director, rs.getString("correoelectronico"),
                        rs.getDate("anocreacion"), rs.getString("ubicacion"), rs.getString("telefono"));
                grupo.setLineasinvestigacion(new LineaDeInvestigacionDAO(conexion).getLineasPorGrupoConexionExterna(grupo));
                grupo.setIntegrantes(new IntegranteDAO(conexion).listarInvestigacionIntegrantesPorGrupo(grupo));
                grupo.setInvestigacionProyectos(new ProyectoDAO(conexion).listarProyectosPorGrupoConexionExterna(grupo));
                grupo.setEstado(rs.getBoolean("estado"));
            }

        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }
        return grupo;
    }

    public ArrayList<InvestigacionGrupo> listarGrupos() throws SQLException {

        ArrayList<InvestigacionGrupo> grupos = null;
        String consulta = "SELECT * FROM investigacion_grupo";
        try {
            this.abrirConexion();

            state = this.conexion.prepareStatement(consulta);
            rs = state.executeQuery();
            InvestigacionIntegrante<GeneralDocente> director = null;
            InvestigacionGrupo grupo = null;
            grupos = new ArrayList();
            while (rs.next()) {
                director = new IntegranteDAO(conexion).getConexionExterna(rs.getString("investigacion_integrante_codigoDirector"), 3);
                grupo = new InvestigacionGrupo(rs.getString("codigocolciencias"), null,
                        rs.getString("nombregrupo"), rs.getString("sigla"), director, rs.getString("correoelectronico"),
                        rs.getDate("anocreacion"), rs.getString("ubicacion"), rs.getString("telefono"));
                grupo.setLineasinvestigacion(new LineaDeInvestigacionDAO(conexion).getLineasPorGrupoConexionExterna(grupo));
                grupo.setIntegrantes(new IntegranteDAO(conexion).listarInvestigacionIntegrantesPorGrupo(grupo));
                grupo.setEstado(rs.getBoolean("estado"));
                grupos.add(grupo);
            }

        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }

        return grupos;
    }

    public boolean registrarGrupo(InvestigacionGrupo grupo) throws SQLException {

        String consulta = "INSERT INTO investigacion_grupo() VALUES(?,?,?,null,?,?,?,?,1)";
        String sql2 = "INSERT INTO investigacion_integrante VALUES (?,3,?,?,CURDATE())";
        String sql3 = "UPDATE investigacion_grupo SET investigacion_integrante_codigoDirector=? "
                + "WHERE codigocolciencias=?";
        try {
            this.abrirConexion();
            conexion.setAutoCommit(false);
            state = conexion.prepareStatement(consulta);
            state.setString(1, grupo.getCodigocolciencias());
            state.setString(2, grupo.getNombregrupo());
            state.setString(3, grupo.getSigla());
            state.setString(4, grupo.getCorreoelectronico());
            state.setDate(5, new java.sql.Date(grupo.getAnocreacion().getTime()));
            state.setString(6, grupo.getUbicacion());
            state.setString(7, grupo.getTelefono());
            state.execute();
            
            state = conexion.prepareStatement(sql2);
            state.setString(1, grupo.getDirector().getCodigo());
            state.setString(2, grupo.getDirector().getContrasena());
            state.setString(3, grupo.getCodigocolciencias());
            state.execute();
            
            state = conexion.prepareStatement(sql3);
            state.setString(1, grupo.getDirector().getCodigo());
            state.setString(2, grupo.getCodigocolciencias());
            state.execute();
            
            conexion.commit();
        } catch (SQLException e) {
            
            try{
                System.out.println("Transacción Cancelada. Revirtiendo Cambios");
                conexion.rollback();
            }catch(SQLException ex){
                throw ex;
            }
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarRecursos();
        }
        return true;
    }

    public boolean modificarGrupo(InvestigacionGrupo grupo) {

        
        return true;
    }

    public boolean desactivarGrupo(InvestigacionGrupo grupo) {

        return true;
    }

    public void cerrarRecursos() throws SQLException {
        if (state != null) {
            state.close();
            state = null;
        }
        if (rs != null) {
            rs.close();
            rs=null;
        }
    }
}
