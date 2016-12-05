/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.model.dao;

import gruposinvestigacion.model.dto.GeneralDocente;
import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionIntegrante;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class IntegranteDAO extends Dao implements Serializable {

    private PreparedStatement state;
    private ResultSet rs;

    public IntegranteDAO() {
    }

    public IntegranteDAO(Connection conexion) {
        super(conexion);
    }

    public InvestigacionIntegrante validarLogin(String codigo, String contrasena) throws SQLException {

        InvestigacionIntegrante integrante = null;

        String consulta = "SELECT * FROM investigacion_integrante WHERE codigo=? AND contrasena=? AND estado=?";
        try {
            this.abrirConexion();
            state = this.conexion.prepareStatement(consulta);
            state.setString(1, codigo);
            state.setString(2, contrasena);
            state.setBoolean(3, true);
            rs = state.executeQuery();

            while (rs.next()) {
                integrante = new InvestigacionIntegrante(rs.getString("codigo"), rs.getInt("tipo"), rs.getDate("fechaingreso"));
                integrante.setGrupoCodigoColciencias(rs.getString("investigacion_grupo_codigocolciencias"));
            }

            if (integrante != null) {
                if (integrante.getTipo() == 1 || integrante.getTipo() == 3) {
                    integrante.setPersona(new DocenteDAO(conexion).getDocenteConexionExterna(integrante.getCodigo()));
                } else {
                    integrante.setPersona(new EstudianteDAO(conexion).getEstudianteGeneralExterno(integrante.getCodigo()));
                }
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }
        return integrante;
    }

    public boolean registrarIntegrante(InvestigacionIntegrante integrante, InvestigacionGrupo grupo) throws SQLException {

        String consulta = "INSERT INTO investigacion_integrante VALUES(?,?,?,?,CURDATE(),1)";

        try {
            this.abrirConexion();
            state = conexion.prepareStatement(consulta);
            state.setString(1, integrante.getCodigo());
            state.setInt(2, integrante.getTipo());
            state.setString(3, integrante.getContrasena());
            state.setString(4, grupo.getCodigocolciencias());
            state.execute();
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }

        return true;
    }

    public ArrayList<InvestigacionIntegrante> listarInvestigacionIntegrantes() throws SQLException {

        ArrayList<InvestigacionIntegrante> integrantes = null;
        String consulta = "SELECT * FROM investigacion_integrante";
        try {
            this.abrirConexion();

            state = this.conexion.prepareStatement(consulta);
            rs = state.executeQuery();

            InvestigacionIntegrante integrante = null;

            integrantes = new ArrayList<>();

            while (rs.next()) {
                integrante = new InvestigacionIntegrante(rs.getString("codigo"), rs.getInt("tipo"), rs.getDate("fechaingreso"));
                integrante.setEstado(rs.getBoolean("estado"));

                if (integrante.getTipo() != 3) {
                    if (integrante.getTipo() == 1) {
                        integrante.setPersona(new DocenteDAO(conexion).getDocenteConexionExterna(integrante.getCodigo()));
                    } else {
                        integrante.setPersona(new EstudianteDAO(conexion).getEstudianteGeneralExterno(integrante.getCodigo()));
                    }

                    integrantes.add(integrante);
                }
            }

        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }
        return integrantes;
    }

    public ArrayList<InvestigacionIntegrante> listarInvestigacionIntegrantesPorGrupo(InvestigacionGrupo grupo) throws SQLException {

        ArrayList<InvestigacionIntegrante> integrantes = null;
        String consulta = "SELECT * FROM investigacion_integrante WHERE investigacion_grupo_codigocolciencias=?";
        try {
            this.abrirConexion();

            state = this.conexion.prepareStatement(consulta);
            state.setString(1, grupo.getCodigocolciencias());
            rs = state.executeQuery();

            InvestigacionIntegrante integrante = null;

            integrantes = new ArrayList<>();

            while (rs.next()) {
                integrante = new InvestigacionIntegrante(rs.getString("codigo"), rs.getInt("tipo"), rs.getDate("fechaingreso"));
                integrante.setGrupoCodigoColciencias(rs.getString("investigacion_grupo_codigocolciencias"));
                integrante.setEstado(rs.getBoolean("estado"));

                if (integrante.getTipo() != 3) {
                    if (integrante.getTipo() == 1) {
                        integrante.setPersona(new DocenteDAO(conexion).getDocenteConexionExterna(integrante.getCodigo()));
                    } else {
                        integrante.setPersona(new EstudianteDAO(conexion).getEstudianteGeneralExterno(integrante.getCodigo()));
                    }
                    integrantes.add(integrante);
                }
            }

        } catch (SQLException e) {
            throw e;
        } finally {
                        this.cerrarRecursos();
        }
        return integrantes;
    }

    public InvestigacionIntegrante get(String id, int tipo) throws SQLException {

        InvestigacionIntegrante integrante = null;
        String consulta = "SELECT * FROM investigacion_integrante WHERE codigo=? AND tipo=?";
        try {
            this.abrirConexion();

            state = this.conexion.prepareStatement(consulta);
            state.setString(1, id);
            state.setInt(2, tipo);
            rs = state.executeQuery();

            while (rs.next()) {
                integrante = new InvestigacionIntegrante(id, tipo, rs.getDate("fechaingreso"));
                integrante.setGrupoCodigoColciencias(rs.getString("investigacion_grupo_codigocolciencias"));
                integrante.setEstado(rs.getBoolean("estado"));

                if (tipo == 1 || tipo == 3) {
                    integrante.setPersona(new DocenteDAO(conexion).getDocenteConexionExterna(id));
                } else {
                    integrante.setPersona(new EstudianteDAO(conexion).getEstudianteGeneralExterno(id));
                }
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }

        return integrante;
    }

    protected InvestigacionIntegrante getConexionExterna(String id, int tipo) throws SQLException {

        InvestigacionIntegrante integrante = null;
        String consulta = "SELECT * FROM investigacion_integrante WHERE codigo=? AND tipo=?";
        try {
            this.abrirConexion();

            state = this.conexion.prepareStatement(consulta);
            state.setString(1, id);
            state.setInt(2, tipo);
            rs = state.executeQuery();

            while (rs.next()) {
                integrante = new InvestigacionIntegrante(id, tipo, rs.getDate("fechaingreso"));
                integrante.setGrupoCodigoColciencias(rs.getString("investigacion_grupo_codigocolciencias"));
                integrante.setEstado(rs.getBoolean("estado"));
            }

            if (integrante != null) {
                if (tipo == 1 || tipo == 3) {
                    integrante.setPersona(new DocenteDAO(conexion).getDocenteConexionExterna(id));
                } else {
                    integrante.setPersona(new EstudianteDAO(conexion).getEstudianteGeneralExterno(id));
                }
            }

        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
        }

        return integrante;
    }

    public void cerrarRecursos() throws SQLException {
        if (state != null) {
            state.close();
            state = null;
        }
        if (rs != null) {
            rs.close();
            rs = null;
        }
    }
}
