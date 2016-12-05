/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.model.dao;

import gruposinvestigacion.model.dto.InvestigacionGrupo;
import gruposinvestigacion.model.dto.Proyecto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Estudiante
 */
public class ProyectoDAO extends Dao {

    private PreparedStatement state;
    private ResultSet rs;
    private SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-mm-dd");

    public ProyectoDAO() {
    }

    public ProyectoDAO(Connection conexion) {
        super(conexion);
    }

    public boolean registrarProyecto(Proyecto proyecto, InvestigacionGrupo grupo) throws SQLException {

        String sql = "INSERT INTO investigacion_proyecto(lineainvestigacion,grupo,nombreproyecto,integrante_codigoLider,"
                + "fechainicio,fechafin,tipofinanciamiento,tipolider) VALUES(?,?,?,?,?,?,?,1)";

        boolean exito = false;

        try {
            this.abrirConexion();

            state = conexion.prepareStatement(sql);
            state.setInt(1, proyecto.getInvestigacionLineasinvestigacion().getCodigolinea());
            state.setString(2, grupo.getCodigocolciencias());
            state.setString(3, proyecto.getNombreproyecto());
            state.setInt(4, Integer.parseInt(proyecto.getLiderproyecto().getCodigo()));
            state.setDate(5, new java.sql.Date(proyecto.getFechainicio().getTime()));
            state.setDate(6, new java.sql.Date(proyecto.getFechafin().getTime()));
            state.setString(7, proyecto.getTipofinanciamiento());
            exito = state.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            this.cerrarRecursos();
            this.cerrarConexion();
        }

        return exito;
    }

    public boolean desactivarProyecto(Proyecto proyecto) throws SQLException {

        String sql = "UPDATE investigacion_proyecto SET estado=? WHERE codigoproyecto=?";

        boolean exito = false;

        try {
            this.abrirConexion();

            state = conexion.prepareStatement(sql);
            state.setBoolean(1, false);
            state.setInt(2, proyecto.getInvestigacionLineasinvestigacion().getCodigolinea());
            exito = state.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            this.cerrarRecursos();
            this.cerrarConexion();
        }

        return exito;
    }

    public Proyecto getProyecto(int codigoProyecto) throws SQLException {

        Proyecto proyecto = null;

        String sql = "SELECT * from investigacion_proyecto WHERE codigoproyecto=?";

        try {
            this.abrirConexion();

            state = conexion.prepareStatement(sql);
            state.setInt(1, codigoProyecto);
            rs = state.executeQuery();

            while (rs.next()) {
                proyecto = new Proyecto(codigoProyecto, new LineaDeInvestigacionDAO(conexion).getLineaConexionExterna(rs.getInt("lineainvestigacion")),
                        rs.getString("nombreproyecto"), new IntegranteDAO(conexion).getConexionExterna(rs.getString("integrante_codigoLider"),
                        rs.getInt("tipoLider")), formatoDelTexto.parse(rs.getString("fechainicio")),formatoDelTexto.parse(rs.getString("fechafin")), rs.getString("tipofinanciamiento"));
                proyecto.setEstado(rs.getBoolean("estado"));
                proyecto.setInvestigacionProductos(new ProductoDAO(conexion).listarProductosPorProyectoConexionExterna(proyecto));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } catch (ParseException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrarRecursos();
            this.cerrarConexion();
        }
        return proyecto;
    }

    public ArrayList<Proyecto> listarProyectosPorGrupo(InvestigacionGrupo grupo) throws SQLException {

        ArrayList<Proyecto> proyectos = null;

        try {
            proyectos = this.listarProyectosPorGrupoConexionExterna(grupo);
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            this.cerrarRecursos();
        }

        return proyectos;
    }

    public ArrayList<Proyecto> listarProyectosPorGrupoConexionExterna(InvestigacionGrupo grupo) throws SQLException {
        ArrayList<Proyecto> proyectos = null;
        String sql = "SELECT * FROM investigacion_proyecto WHERE grupo=?";

        try {
            this.abrirConexion();
            state = conexion.prepareStatement(sql);
            state.setString(1, grupo.getCodigocolciencias());
            rs = state.executeQuery();

            Proyecto proyecto = null;
            proyectos = new ArrayList();
            while (rs.next()) {
                proyecto = new Proyecto(rs.getInt("codigoProyecto"), new LineaDeInvestigacionDAO(conexion).getLineaConexionExterna(rs.getInt("lineainvestigacion")),
                        rs.getString("nombreproyecto"), new IntegranteDAO(conexion).getConexionExterna(rs.getString("integrante_codigoLider"),
                        rs.getInt("tipoLider")), formatoDelTexto.parse(rs.getString("fechainicio")),formatoDelTexto.parse(rs.getString("fechafin")), rs.getString("tipofinanciamiento"));
                proyecto.setEstado(rs.getBoolean("estado"));
                proyecto.setInvestigacionProductos(new ProductoDAO(conexion).listarProductosPorProyectoConexionExterna(proyecto));
                proyectos.add(proyecto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } catch (ParseException ex) {
            Logger.getLogger(ProyectoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.cerrarRecursos();
        }

        return proyectos;
    }

    public void cerrarRecursos() throws SQLException {
        if (state != null) {
            state.close();
        }
        if (rs != null) {
            rs.close();
        }
    }
}
