/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import gestionUsuarios.DTOs.ModuloDTO;
import gestionUsuarios.DTOs.PrivilegioDTO;
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
public class GeneralPrivilegioDAO extends ConexionGUDAOs{
    public GeneralPrivilegioDAO(){super();}
    
    public PrivilegioDTO getPrivilegioUsuario(String user)
    {
        try{
            obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT modulo FROM general_privilegio WHERE user=?");
            ps.setString(1, user);
            ResultSet rs=ps.executeQuery();
            ArrayList<ModuloDTO> listaMod=new ArrayList<ModuloDTO>();
            while(rs.next()){
                String nomModulo=rs.getString(1);
                GeneralModuloDAO modDAO=new GeneralModuloDAO();
                ModuloDTO m=modDAO.getModulo(nomModulo);    
                listaMod.add(m);
            }
            PrivilegioDTO privilegio=new PrivilegioDTO();
            privilegio.setModulos(listaMod);
            return privilegio;
        } catch (SQLException ex) {
            Logger.getLogger(GeneralPrivilegioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }finally{
            cerrarConexion();
        }
        
    }
    public static void main(String[] args) {
        GeneralPrivilegioDAO p=new GeneralPrivilegioDAO();
        System.out.println(p.getPrivilegioUsuario("1151234").getModulos().get(0).getNombre());
    }
}
