/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import gestionUsuarios.DTOs.RolDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class GeneralRolDAO extends ConexionGUDAOs{
    public GeneralRolDAO(){super();}
    public RolDTO getRol(String rol){
        try{
            PreparedStatement ps=conn.prepareStatement("SELECT * FROM general_rol WHERE rol=?");
            ps.setString(1, rol);
            ResultSet rs=ps.executeQuery();
            if(rs.absolute(1)){
                RolDTO r=new RolDTO();
                r.setRol(rs.getString(1));
                r.setDescripcion(rs.getString(2));
                return r;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralRolDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            cerrarConexion();
        }
    }
    public static void main(String[] args) {
        GeneralRolDAO rol=new GeneralRolDAO();
        System.out.println(rol.getRol("super administrador").getDescripcion());
    }
}