/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import gestionUsuarios.DTOs.RolDTO;
import java.sql.Connection;
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
public class GeneralRolDAO {
    protected Connection conn;
    public GeneralRolDAO(Connection con){conn=con;}
    public RolDTO getRol(String rol){
        try{
            //obtenerConexion();
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
            //cerrarConexion();
        }
    }
    public List<RolDTO> listarRoles(){
        try{
            //obtenerConexion();
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
            //cerrarConexion();
        }
        return null;
    }
    public boolean insertarRol(RolDTO rolDTO)
    {
        try{
            //obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("INSERT INTO general_rol(rol, descripcion) VALUES (?,?)");
            ps.setString(1, rolDTO.getRol());
            ps.setString(2, rolDTO.getDescripcion());
            int row=ps.executeUpdate();
            if(row==1)return true;
            
        } catch (SQLException ex) {
            Logger.getLogger(GeneralRolDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            //cerrarConexion();
        }
        return false;
    }
    public boolean eliminarRol(String rol){
        try{
            //obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("DELETE FROM general_rol WHERE rol=?");
            ps.setString(1, rol);
            int row=ps.executeUpdate();
            if(row==1)return true;
            
        } catch (SQLException ex) {
            Logger.getLogger(GeneralRolDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean modificar(String rol, String nuevaDescripcion){
        try{
            //obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("UPDATE general_rol SET descripcion=? WHERE rol=?");
            ps.setString(2, rol);
            ps.setString(1, nuevaDescripcion);
            int row=ps.executeUpdate();
            if(row==1)return true;
            
        } catch (SQLException ex) {
            Logger.getLogger(GeneralRolDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public static void main(String[] args) {
        //GeneralRolDAO rol=new GeneralRolDAO();
        //System.out.println(rol.listarRoles().get(0).getRol());
    }
}
