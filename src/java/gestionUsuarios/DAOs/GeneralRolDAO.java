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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class GeneralRolDAO extends ConexionGUDAOs{
    public GeneralRolDAO(){}
    public RolDTO getRol(String rol){
        try{
            obtenerConexion();
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
    public List<RolDTO> listarRoles(){
        try{
            obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT rol, descripcion FROM general_rol");
            ResultSet rs=ps.executeQuery();
            ArrayList<RolDTO> lista=new ArrayList<>();
            while(rs.next()){
                RolDTO r=new RolDTO();
                r.setRol(rs.getString(1));
                r.setDescripcion(rs.getString(2));
                lista.add(r);
            }
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralRolDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            cerrarConexion();
        }
        return null;
    }
    public static void main(String[] args) {
        GeneralRolDAO rol=new GeneralRolDAO();
        System.out.println(rol.getRol("super administrador").getDescripcion());
    }
}
