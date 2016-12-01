/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DAO;

import Internacionalizacion.Modelo.DTO.Pasantia;
import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author JAVIER
 */
public class DAOPasantia {
 
    public String RegistrarActividad(Pasantia a) {
        Pool pool = Conexion.getPool();
        Connection con = null;
        
        try {
            pool.setUsuario("ufps_76");
            pool.setContrasena("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("INSERT INTO `oficina_pasantia`(`idconvenio`, `proyecto`, `tutorempresa`, `tutoruniversidad`) VALUES (?,?,?,?)");
            //fijar atributos
            //stmt.setArray(), x);
            stmt.setString(1, a.getIdconvenio());
            stmt.setString(2, a.getProyecto());
            stmt.setString(3, a.getTutorempresa());
            stmt.setString(4, a.getTutoruniversidad());
            
            
            int can = stmt.executeUpdate();
            stmt.close();
            if(can == 1){
                System.out.println("Registro!");
                return "Se registro actividad!";
            }else{
                 System.out.println("No registro!");
                return "No se registro actividad!";
            }
            
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            
        } finally {
            try {
                if (con != null) {
                    con.close(); // se cierra la conexion. este es un paso muy importante
                }
            } catch (SQLException ex) {
                 System.out.println("asdasd no registrar");
                System.err.println(ex);
            }
        }   
        return null;
    }
    
    
}
