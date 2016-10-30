/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import general.conexion.Conexion;
import general.conexion.Pool;
import gestionUsuarios.DTOs.RolDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class GeneralUsuarioRolDAO extends ConexionGUDAOs{

    public GeneralUsuarioRolDAO(){super();}
    
    public boolean existe(String rol, String user) {      
        
        try {
            obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT * FROM general_usuario_rol WHERE user=? AND rol=? ");
            ps.setString(1, user);
            ps.setString(2, rol);
            ResultSet rs=ps.executeQuery();
            if(rs.absolute(1)){
                return true;
            }
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioRolDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            this.cerrarConexion();
        }
        
    }
    
    public List<RolDTO> obtenerRoles(String user){
        try{
            obtenerConexion();
            ArrayList<RolDTO> lista =new ArrayList<RolDTO>();
            PreparedStatement ps=conn.prepareStatement("SELECT rol FROM general_usuario_rol WHERE user=?");
            ps.setString(1, user);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                RolDTO rol=null;
                GeneralRolDAO rDAO=new GeneralRolDAO();
                rol=rDAO.getRol(rs.getString(1));
                lista.add(rol);
            }
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralUsuarioRolDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            cerrarConexion();
        }
    }
    
   
    
    public static void main(String[] args) {
        GeneralUsuarioRolDAO gur=new GeneralUsuarioRolDAO();
        System.out.println(gur.obtenerRoles("1151052").get(0).getDescripcion());
    }

}
