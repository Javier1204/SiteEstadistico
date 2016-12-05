/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.model.dao;

import gruposinvestigacion.model.dto.Admin;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Administrator
 */
public class AdminDAO extends Dao implements Serializable {

    private PreparedStatement state;
    private ResultSet rs;

    public AdminDAO() {
    }

    public AdminDAO(Connection conexion) {
        super(conexion);
    }

    public Admin validarLogin(String codigo, String contrasena) throws SQLException {

        Admin admin = null;

        String consulta = "SELECT * FROM general_usuario WHERE user=? AND password=?";
        try {
            this.abrirConexion();
            state = this.conexion.prepareStatement(consulta);
            state.setString(1, codigo);
            state.setString(2, contrasena);
            rs = state.executeQuery();

            while (rs.next()) {
                admin = new Admin(rs.getString("user"), rs.getString("password"));
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            cerrarRecursos();
            this.cerrarConexion();
        }

        return admin;
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
