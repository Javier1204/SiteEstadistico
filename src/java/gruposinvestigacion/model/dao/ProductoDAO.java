/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.model.dao;

import gruposinvestigacion.model.dto.Producto;
import gruposinvestigacion.model.dto.Proyecto;
import gruposinvestigacion.model.dto.Tipoproducto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Estudiante
 */
public class ProductoDAO extends Dao {

    private PreparedStatement state;
    private ResultSet rs;

    public ProductoDAO() {
    }

    public ProductoDAO(Connection conexion) {
        super(conexion);
    }

    public boolean registrarProducto(Producto producto, Proyecto proyecto) throws SQLException {

        String sql = "INSERT INTO investigacion_producto(codigoproyecto, tipoproducto, informaciontecnica) VALUES(?,?,?)";

        boolean exito = false;

        try {
            this.abrirConexion();

            state = conexion.prepareStatement(sql);
            state.setInt(1, proyecto.getCodigoproyecto());
            state.setInt(2, producto.getTipoproducto().getCodigo());
            state.setString(3, producto.getInformaciontecnica());
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

    public Producto getProducto(int codigoProducto) throws SQLException {

        Producto producto = null;

        String sql = "SELECT p.*, t.descripcion from investigacion_producto p, investigacion_tipoproducto t WHERE codigoproducto=? "
                + "AND p.tipoproducto=t.codigo";

        try {
            this.abrirConexion();

            state = conexion.prepareStatement(sql);
            state.setInt(1, codigoProducto);
            rs = state.executeQuery();

            while (rs.next()) {
                producto = new Producto(codigoProducto, new Tipoproducto(rs.getInt("tipoproducto"), rs.getString("descripcion")), rs.getString("informaciontecnica"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            this.cerrarRecursos();
            this.cerrarConexion();
        }
        return producto;
    }

    public ArrayList<Producto> listarProductosPorProyecto(Proyecto proyecto) throws SQLException {

        ArrayList<Producto> productos = null;

        try {
            productos = this.listarProductosPorProyectoConexionExterna(proyecto);
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            this.cerrarRecursos();
            this.cerrarConexion();
        }

        return productos;
    }

    public ArrayList<Producto> listarProductosPorProyectoConexionExterna(Proyecto proyecto) throws SQLException {
        ArrayList<Producto> productos = null;
        String sql = "SELECT p.*, t.descripcion from investigacion_producto p, investigacion_tipoproducto t WHERE p.codigoproyecto=? AND p.tipoproducto=t.codigo";

        try {
            this.abrirConexion();
            state = conexion.prepareStatement(sql);
            state.setInt(1, proyecto.getCodigoproyecto());
            rs = state.executeQuery();

            Producto producto = null;
            productos = new ArrayList();
            while (rs.next()) {
                producto = new Producto(rs.getInt("codigoproducto"), new Tipoproducto(rs.getInt("tipoproducto"), rs.getString("descripcion")), rs.getString("informaciontecnica"));
                productos.add(producto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
                        this.cerrarRecursos();
        }

        return productos;
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
