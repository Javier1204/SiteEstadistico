/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.model.dao;

import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.InvestigacionLineasinvestigacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class LineaDeInvestigacionDAO extends Dao {

    private PreparedStatement state;
    private ResultSet rs;

    public LineaDeInvestigacionDAO() {
    }

    public LineaDeInvestigacionDAO(Connection conexion) {
        super(conexion);
    }

    public InvestigacionLineasinvestigacion getLinea(int id) throws SQLException {

        InvestigacionLineasinvestigacion linea = null;
        try {
            linea = this.getLineaConexionExterna(id);
        } catch (SQLException e) {
            throw e;
        } finally {
            this.cerrarConexion();
        }

        return linea;
    }

    public InvestigacionLineasinvestigacion getLineaConexionExterna(int id) throws SQLException {

        InvestigacionLineasinvestigacion linea = null;
        String consulta = "SELECT * FROM investigacion_lineasinvestigacion WHERE codigolinea=?";
        try {
            this.abrirConexion();

            state = this.conexion.prepareStatement(consulta);
            state.setInt(1, id);
            rs = state.executeQuery();

            while (rs.next()) {
                linea = new InvestigacionLineasinvestigacion(id, rs.getString("nombre"), rs.getString("objetivos"),
                        rs.getString("descripcion"));
            }

        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
        }

        return linea;
    }

    public ArrayList<InvestigacionLineasinvestigacion> getLineasPorGrupo(InvestigacionGrupo grupo) throws SQLException {

        ArrayList<InvestigacionLineasinvestigacion> lineas = null;
        String consulta = "SELECT * FROM investigacion_lineasinvestigacion WHERE Grupo_codigocolciencias=?";
        try {
            this.abrirConexion();

            state = this.conexion.prepareStatement(consulta);
            state.setString(1, grupo.getCodigocolciencias());
            rs = state.executeQuery();

            lineas = new ArrayList();
            InvestigacionLineasinvestigacion linea = null;
            while (rs.next()) {
                linea = new InvestigacionLineasinvestigacion(rs.getInt("codigolinea"), rs.getString("nombre"), rs.getString("objetivos"),
                        rs.getString("descripcion"));
                lineas.add(linea);
            }

        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }

        return lineas;
    }

    public ArrayList<InvestigacionLineasinvestigacion> getLineasPorGrupoConexionExterna(InvestigacionGrupo grupo) throws SQLException {

        ArrayList<InvestigacionLineasinvestigacion> lineas = null;
        String consulta = "SELECT * FROM investigacion_lineasinvestigacion WHERE Grupo_codigocolciencias=?";
        try {
            this.abrirConexion();

            state = this.conexion.prepareStatement(consulta);
            state.setString(1, grupo.getCodigocolciencias());
            rs = state.executeQuery();

            lineas = new ArrayList();
            InvestigacionLineasinvestigacion linea = null;
            while (rs.next()) {
                linea = new InvestigacionLineasinvestigacion(rs.getInt("codigolinea"), rs.getString("nombre"), rs.getString("objetivos"),
                        rs.getString("descripcion"));
                lineas.add(linea);
            }

        } catch (SQLException e) {
            throw e;
        } finally {
            this.cerrarRecursos();
        }

        return lineas;
    }

    public boolean registrarLinea(InvestigacionLineasinvestigacion lineaDeInvestigacion, InvestigacionGrupo grupo) throws SQLException {

        String consulta = "INSERT INTO investigacion_lineasinvestigacion VALUES(null,?,?,?,?)";
        try {
            this.abrirConexion();

            state = this.conexion.prepareStatement(consulta);
            state.setString(1, grupo.getCodigocolciencias());
            state.setString(2, lineaDeInvestigacion.getNombre());
            state.setString(3, lineaDeInvestigacion.getObjetivos());
            state.setString(4, lineaDeInvestigacion.getDescripcion());
            state.execute();
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }

        return true;
    }

    public boolean modificarLinea(InvestigacionLineasinvestigacion lineaDeInvestigacion) throws SQLException {

        int numFilas = 0;

        String consulta = "UPDATE investigacion_lineasinvestigacion SET nombre=?, objetivos=?, descripcion=? "
                + "WHERE codigolinea=?";
        try {
            this.abrirConexion();

            state = this.conexion.prepareStatement(consulta);
            state.setString(1, lineaDeInvestigacion.getNombre());
            state.setString(2, lineaDeInvestigacion.getObjetivos());
            state.setString(3, lineaDeInvestigacion.getDescripcion());
            state.setInt(4, lineaDeInvestigacion.getCodigolinea());
            numFilas = state.executeUpdate();
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }

        return numFilas > 0;
    }

    public boolean eliminarLinea(InvestigacionLineasinvestigacion lineaDeInvestigacion) throws SQLException {

        int numFilas = 0;

        String consulta = "DELETE FROM investigacion_lineasinvestigacion WHERE codigolinea=?";
        try {
            this.abrirConexion();

            state = this.conexion.prepareStatement(consulta);
            state.setInt(1, lineaDeInvestigacion.getCodigolinea());
            numFilas = state.executeUpdate();
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }

        return numFilas > 0;
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
