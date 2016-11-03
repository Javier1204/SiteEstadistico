/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CargaAcademica.DAO;

import java.sql.Connection;
import CargaAcademica.DTO.general_docenteDTO;
import general.conexion.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author jesus
 */
public class general_docenteDAO {
     private Connection conn;
     
     
     public general_docenteDTO consultarDocenteo(String codigo){
         Pool pool= Conexion.getPool();
         Connection con = null;
         ResultSet rs = null;
         general_docenteDTO dto = null;
         
        try {
            pool.setUsuario("ufps_76");
            pool.setUsuario("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM general_docente WHERE codigo='?' ");
            stmt.setString(1,codigo);
            
            
            
         } catch (SQLException ex) {
             Logger.getLogger(general_docenteDAO.class.getName()).log(Level.SEVERE, null, ex);
         }
        
        return dto;
     }
}
