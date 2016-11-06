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
    
    public boolean RegistrarActividad(Actividad a) {
        Pool pool = Conexion.getPool();
        Connection con = null;
        ResultSet rs = null;
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("INSERT INTO `oficina_actividadconvenio`(`id_convenio`, `duracion`, `nombre`, `fechacreacion`, `fechaterminacion`, `semestre`, `tipoactividad`, `hora`, `responsable`, `lugar`, `descripcion`) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            //fijar atributos
            //stmt.setArray(), x);
            stmt.setInt(1, a.getIdconvenio());
            stmt.setString(2, a.getDuracion());
            stmt.setString(3, a.getNombre());
            stmt.setString(4, a.getFechacreacion());
            stmt.setString(5, a.getFechaterminacion());
            stmt.setShort(6, a.getSemestre());
            stmt.setString(7, a.getTipoactividad());
            stmt.setString(8, a.getHora());
            stmt.setString(9, a.getResponsable());
            stmt.setString(10, a.getLugar());
            stmt.setString(11, a.getDescripcion());
            
            stmt.executeUpdate();
           
            stmt.close();
            
            System.out.println("Se registro la actividad!");
            
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
