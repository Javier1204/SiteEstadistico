/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DAO;

import Practicas.DTO.perfilDTO;
import Practicas.Interface.PerfilInterface;
import com.mysql.jdbc.PreparedStatement;

import general.conexion.Conexion;
import general.conexion.Pool;
import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrador
 */
public class perfilDAO implements PerfilInterface{
    
   
    public boolean registrarPerfil(Object o) {
        boolean rta= false;
        
        try {
            Connection con = null;
            Pool pool = Conexion.getPool();
            pool.setUsuario("ufps_76");
            pool.setUsuario("ufps_29");
            pool.inicializarDataSource();
            con = pool.getDataSource().getConnection();
            
            perfilDTO p = (perfilDTO) o;
            PreparedStatement pst;
            String sql="insert into practica_perfil (nombre) values (?)";
            
            pst=(PreparedStatement) con.prepareStatement(sql);
            pst.setString(1, p.getNombre());
            int a= pst.executeUpdate();
            con.close();
            
            if(a!=0)
                rta=true;
         
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rta;
    }

 
    public boolean editarPerfil(Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    public boolean eliminarPerfil(Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  
    public List<perfilDTO> listarPerfiles() {
        List<perfilDTO> lista = new ArrayList <>();
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        String sql = "select * from practica_perfil";
        try{
            Pool pool = Conexion.getPool();
            pool.setUsuario("ufps_76");
            pool.setUsuario("ufps_29");
            pool.inicializarDataSource();
            conn = pool.getDataSource().getConnection();
            
            pst = (PreparedStatement) conn.prepareStatement(sql);
            rs= pst.executeQuery();
            
            while(rs.next()){
                lista.add(new perfilDTO(rs.getInt("idpefil"),rs.getString("nombre")));
            }
            conn.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(perfilDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public perfilDTO buscarPerfil(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
   
}
