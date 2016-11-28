/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import gestionUsuarios.DTOs.RequerimientosFDTO;
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
public class GeneralRequerimientoFDAO {
    protected Connection conn;
    public GeneralRequerimientoFDAO(Connection con){conn=con;}
    
    
    public RequerimientosFDTO getRF(String modulo,String rf){
        try{
            PreparedStatement ps=conn.prepareStatement("SELECT id, nombre,  url FROM general_requerimiento_funcional WHERE id=? AND modulo=? ");
            ps.setString(1, rf);
            ps.setString(2, modulo);
            ResultSet rs=ps.executeQuery();

            if(rs.absolute(1)){
                RequerimientosFDTO rfdto=new RequerimientosFDTO();
                rfdto.setId(rs.getString(1));
                rfdto.setNombre(rs.getString(2));
                rfdto.setUrl(rs.getString(3));
                return rfdto;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralRequerimientoFDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public List<RequerimientosFDTO> getRFs(String modulo){
        try{
            PreparedStatement ps=conn.prepareStatement("SELECT id, nombre,  url FROM general_requerimiento_funcional WHERE modulo=? ");
            
            ps.setString(1, modulo);
            ResultSet rs=ps.executeQuery();
            ArrayList<RequerimientosFDTO> lista=new ArrayList<RequerimientosFDTO>();
            while(rs.next()){
                RequerimientosFDTO rfdto=new RequerimientosFDTO();
                rfdto.setId(rs.getString(1));
                rfdto.setNombre(rs.getString(2));
                rfdto.setUrl(rs.getString(3));
                lista.add(rfdto);
            }
            return lista;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralRequerimientoFDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public boolean insertarRF(RequerimientosFDTO rfDTO, String modulo){
        try{
            PreparedStatement ps=conn.prepareStatement("INSERT INTO general_requerimiento_funcional(id, nombre, modulo, url) VALUES (?,?,?,?)");
            ps.setString(1, rfDTO.getId());
            ps.setString(2, rfDTO.getNombre());
            ps.setString(3, modulo);
            ps.setString(4, rfDTO.getUrl());
            
            int row=ps.executeUpdate();
            if(row==1){
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(GeneralRequerimientoFDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean modificarRF(String modulo, String rf, String nuevoNombre, String nuevaUrl){
        try{
            PreparedStatement ps=conn.prepareStatement("UPDATE general_requerimiento_funcional SET nombre=?, url=? WHERE modulo=? AND id=?");
            ps.setString(1, nuevoNombre);
            ps.setString(2, nuevaUrl);
            ps.setString(3, modulo);
            ps.setString(4, rf);
            
            int row=ps.executeUpdate();
            if(row==1){
                return true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(GeneralRequerimientoFDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
