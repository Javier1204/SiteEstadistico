/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Modelo.DAO;

import general.conexion.Conexion;
import general.conexion.Pool;
import internacionalizacion.Modelo.DTO.Actividad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JAVIER
 */
public class DAOActividad {
    
    public DAOActividad(){        
    }
    
    public boolean RegistrarActividad(Actividad a) {
        Pool pool = Conexion.getPool();
        Connection con = null;
        ResultSet rs = null;
        try {
            pool.setUsuario("ufps_76");
            pool.setUsuario("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT MAX(codigo) FROM academico_equipo");
            //fijar atributos
            //stmt.setArray(), x);
            stmt.executeQuery();
            while (rs.next()) {
                
            }
            stmt.close();
            
            
            
            rs.close();
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            return false;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DAOActividad.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
       return true;
    }
}
