/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.model.dao;

import gruposinvestigacion.model.util.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Estudiante
 */
public class Dao {

    protected Connection conexion;
    protected boolean keepOpenConn;
    
    public Dao() {
    }

    public Dao(Connection conexion) {
        this.conexion = conexion;
        this.keepOpenConn = true;
    }

    public void abrirConexion() throws SQLException {
        if (!keepOpenConn) {
            conexion = Pool.getConnection();
            keepOpenConn = true;
        }
    }
    
    public void cerrarConexion() throws SQLException {

        if (keepOpenConn) {
            if (conexion != null) {
                conexion.close();
            }
        }
        keepOpenConn = false;
    }
}
