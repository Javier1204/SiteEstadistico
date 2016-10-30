/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import gestionUsuarios.DTOs.RequerimientoFDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class GeneralRequerimientoFuncionalDAO extends ConexionGUDAOs{
    public GeneralRequerimientoFuncionalDAO(){}
    public RequerimientoFDTO getRequerimiento(String modulo, String rf){
        try{
            obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT rf, nombre FROM general_requerimiento_funcional WHERE rf=? AND modulo=?");
            ps.setString(1, rf);
            ps.setString(2, modulo );
            ResultSet rs=ps.executeQuery();
            if(rs.absolute(1)){
                RequerimientoFDTO rdto=new RequerimientoFDTO();
                rdto.setId(rs.getString(1));
                rdto.setNombreRF(rs.getString(2));
                return rdto;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralRequerimientoFuncionalDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            cerrarConexion();
        }
    }
    public static void main(String[] args) {
        GeneralRequerimientoFuncionalDAO rfDAO=new GeneralRequerimientoFuncionalDAO();
        System.out.println(rfDAO.getRequerimiento("integrador", "RF10").getNombreRF());
    }
}
