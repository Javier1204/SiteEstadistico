/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import gestionUsuarios.DTOs.ModuloDTO;
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
public class GeneralModuloDAO {
    protected Connection conn;
    public GeneralModuloDAO (Connection con){conn=con;}
    public ModuloDTO getModulo(String modulo){
        try{
            //obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT modulo, descripcion,url FROM general_modulo WHERE modulo=?");
            ps.setString(1, modulo);
            ResultSet rs=ps.executeQuery();
            if(rs.absolute(1)){
                ModuloDTO modDTO=new ModuloDTO();
                modDTO.setNombre(rs.getString(1));
                modDTO.setDescripcion(rs.getString(2));
                modDTO.setUrl(rs.getString(3));
                return modDTO;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralModuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            //cerrarConexion();
        }
    }
    public List<ModuloDTO> listaModulos()
    {
        try{
            //obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT modulo, descripcion,url FROM general_modulo");
            ResultSet rs=ps.executeQuery();
            ArrayList<ModuloDTO> lista=new ArrayList<>();
            while(rs.next()){
                ModuloDTO modDTO=new ModuloDTO();
                modDTO.setNombre(rs.getString(1));
                modDTO.setDescripcion(rs.getString(2));
                modDTO.setUrl(rs.getString(3));
                lista.add(modDTO);
            }
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralModuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            //cerrarConexion();
        }
    }
    public boolean insertar(ModuloDTO mod){
        try{
           PreparedStatement ps=conn.prepareStatement("INSERT INTO general_modulo (modulo, descripcion, url) VALUES (?, ?, ?)"); 
           ps.setString(1, mod.getNombre());
           ps.setString(2, mod.getDescripcion());
           ps.setString(3, mod.getUrl());
           int row=ps.executeUpdate();
           if(row>0){
               return true;
           }
           
        } catch (SQLException ex) {
            Logger.getLogger(GeneralModuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;        
    }
    public boolean elminarModulo(String modulo){
        try{
            PreparedStatement ps=conn.prepareStatement("DELETE FROM general_modulo WHERE modulo=?");
            ps.setString(1, modulo);
            int row=ps.executeUpdate();
            if(row==1){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GeneralModuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean modificarModulo(String modulo, String nuevaDescripcion, String url){
        try{
            PreparedStatement ps=conn.prepareStatement("UPDATE general_modulo SET descripcion=?, url=? WHERE modulo=?");
            ps.setString(3, modulo);
            ps.setString(2, url);
            ps.setString(1, nuevaDescripcion);
            int row=ps.executeUpdate();
            if(row==1){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GeneralModuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public List<ModuloDTO> listarModulosNoRol(String rol){
        try{
            //obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT M.modulo, M.descripcion, M.url FROM general_modulo M WHERE M.modulo NOT IN (SELECT P.modulo FROM general_privilegio P WHERE P.rol=?)");
            ps.setString(1, rol);
            ResultSet rs=ps.executeQuery();
            ArrayList<ModuloDTO> lista=new ArrayList<>();
            while(rs.next()){
                ModuloDTO modDTO=new ModuloDTO();
                modDTO.setNombre(rs.getString(1));
                modDTO.setDescripcion(rs.getString(2));
                modDTO.setUrl(rs.getString(3));
                lista.add(modDTO);
            }
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralModuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            //cerrarConexion();
        }
    }
    public static void main(String[] args) {
        Connection con=ConexionGUDAOs.obtenerConexion();
        GeneralModuloDAO moduloDAO=new GeneralModuloDAO(con);
        //System.out.println(moduloDAO.getModulo("integrador").getDescripcion());
        //System.out.println(moduloDAO.listaModulos().get(0).getNombre());
        System.out.println(moduloDAO.listarModulosNoRol("Administrador").get(0).getNombre());
        ConexionGUDAOs.cerrarConexion(con);
    }
}
