/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import gestionUsuarios.DTOs.ModuloDTO;
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
public class GeneralModuloDAO extends ConexionGUDAOs{
    public GeneralModuloDAO (){}
    public ModuloDTO getModulo(String modulo){
        try{
            obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT modulo, descripcion FROM general_modulo WHERE modulo=?");
            ps.setString(1, modulo);
            ResultSet rs=ps.executeQuery();
            if(rs.absolute(1)){
                ModuloDTO modDTO=new ModuloDTO();
                modDTO.setNombre(rs.getString(1));
                modDTO.setDescripcion(rs.getString(2));
                return modDTO;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralModuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            cerrarConexion();
        }
    }
    public List<ModuloDTO> listaModulos()
    {
        try{
            obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT modulo, descripcion FROM general_modulo");
            ResultSet rs=ps.executeQuery();
            ArrayList<ModuloDTO> lista=new ArrayList<>();
            while(rs.next()){
                ModuloDTO modDTO=new ModuloDTO();
                modDTO.setNombre(rs.getString(1));
                modDTO.setDescripcion(rs.getString(2));
                lista.add(modDTO);
            }
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralModuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            cerrarConexion();
        }
    }
    public static void main(String[] args) {
        GeneralModuloDAO moduloDAO=new GeneralModuloDAO();
        //System.out.println(moduloDAO.getModulo("integrador").getDescripcion());
        System.out.println(moduloDAO.listaModulos().get(0).getNombre());
    }
}