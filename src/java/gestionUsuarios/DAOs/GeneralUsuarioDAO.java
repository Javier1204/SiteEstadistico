/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import gestionUsuarios.DTOs.UsuarioDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class GeneralUsuarioDAO extends ConexionGUDAOs{
    public GeneralUsuarioDAO(){super();}
    
    public String getPass(String user)
    {
        try{
            obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT password FROM general_usuario WHERE user=?");
            ps.setString(1, user);
            ResultSet rs=ps.executeQuery();
            if(rs.absolute(1)){
                return rs.getString(1);
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            cerrarConexion();
        }
    }
    
    public UsuarioDTO getUsuario(String user){
        try{
            obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT * FROM general_usuario WHERE user=?");
            ps.setString(1, user);
            ResultSet rs=ps.executeQuery();
            if(rs.absolute(1)){
                UsuarioDTO u=new UsuarioDTO();
                u.setUssername(rs.getString(1));
                u.setPassword(rs.getString(2));
                return u;
            }
            return null;
        } catch (SQLException ex) {
            
            Logger.getLogger(GeneralUsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            cerrarConexion();
        }
        
    }
    public static void main(String[] args) {
        GeneralUsuarioDAO us=new GeneralUsuarioDAO();
        System.out.println(us.getPass("1151052"));
    }
}
