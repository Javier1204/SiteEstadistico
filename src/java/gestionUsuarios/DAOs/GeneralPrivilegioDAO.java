/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import gestionUsuarios.DTOs.ModuloDTO;
import gestionUsuarios.DAOs.GeneralRequerimientoFDAO;
import gestionUsuarios.DTOs.PrivilegioDTO;
import gestionUsuarios.DTOs.RequerimientosFDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class GeneralPrivilegioDAO {

    protected Connection conn;

    public GeneralPrivilegioDAO(Connection con) {
        conn = con;
    }

    public PrivilegioDTO getPrivilegioUsuarioPorRol(String rol) {
        try {
            //obtenerConexion();
            PreparedStatement ps = conn.prepareStatement("SELECT modulo, rf FROM general_privilegio WHERE rol=?");
            ps.setString(1, rol);
            ResultSet rs = ps.executeQuery();
            ArrayList<ModuloDTO> listaMod = new ArrayList<ModuloDTO>();
            while (rs.next()) {
                String nomModulo = rs.getString(1);
                String rf = rs.getString(2);
                boolean exito = false;
                for (ModuloDTO mod : listaMod) {
                    if (mod.getNombre().equalsIgnoreCase(nomModulo)) {
                        exito = true;
                        GeneralRequerimientoFDAO rfDAO = new GeneralRequerimientoFDAO(conn);
                        RequerimientosFDTO rfDTO = rfDAO.getRF(nomModulo, rf);
                        mod.getRequerimientos().add(rfDTO);
                        break;
                    }
                }
                if (!exito) {
                    GeneralModuloDAO modDAO = new GeneralModuloDAO(conn);
                    ModuloDTO m = modDAO.getModulo(nomModulo);
                    GeneralRequerimientoFDAO rfDAO = new GeneralRequerimientoFDAO(conn);
                    RequerimientosFDTO rfDTO = rfDAO.getRF(nomModulo, rf);
                    m.getRequerimientos().add(rfDTO);
                    listaMod.add(m);
                }

            }
            PrivilegioDTO privilegio = new PrivilegioDTO();
            privilegio.setModulos(listaMod);
            return privilegio;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralPrivilegioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }
    public boolean insertarPrivilegio(String rol, String rf, String modulo){
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO general_privilegio(rol, rf, modulo) VALUES (?, ?, ?)");
            ps.setString(1, rol);
            ps.setString(2, rf);
            ps.setString(3, modulo);
            
            int row=ps.executeUpdate();
            if(row==1){
                return true;
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(GeneralPrivilegioDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("rol: "+rol+" rf: "+rf+" modulo: "+modulo+" YA EXISTE");
        }
        return false;
    }
    
    public void eliminarRF(String modulo, String rf){
         try {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM general_privilegio WHERE rf=? AND modulo=?");
            ps.setString(1, rf);
            ps.setString(2, modulo);
            int row=ps.executeUpdate();
             System.out.println(row);
        } catch (SQLException ex) {
            Logger.getLogger(GeneralPrivilegioDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }
    public boolean eliminarPrivilegio(String rol, String modulo, String rf){
        try {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM general_privilegio WHERE rf=? AND modulo=? AND rol=?");
            ps.setString(1, rf);
            ps.setString(2, modulo);
            ps.setString(3, rol);
            int row=ps.executeUpdate();
            if(row==1)return true;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralPrivilegioDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return false;
    }
    public void eliminarPorRol(String rol){
        try {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM general_privilegio WHERE rol=?");
            ps.setString(1, rol);
            int row=ps.executeUpdate();
            System.out.println(row);
        } catch (SQLException ex) {
            Logger.getLogger(GeneralPrivilegioDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }
    public static void main(String[] args) {
        //GeneralPrivilegioDAO p=new GeneralPrivilegioDAO();
        //System.out.println(p.getPrivilegioUsuario("1151234").getModulos().get(0).getNombre());
    }
}
