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
}
