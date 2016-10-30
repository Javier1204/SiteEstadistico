/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DAOs;

import gestionUsuarios.DTOs.ModuloDTO;
import gestionUsuarios.DTOs.PrivilegioDTO;
import gestionUsuarios.DTOs.RequerimientoFDTO;
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
            PreparedStatement ps=conn.prepareStatement("SELECT modulo, rf FROM general_privilegio WHERE user=?");
            ps.setString(1, user);
            ResultSet rs=ps.executeQuery();
            HashMap<String, ArrayList<RequerimientoFDTO>> modulos=new HashMap<String, ArrayList<RequerimientoFDTO>>();
            while(rs.next()){
                String nomModulo=rs.getString(1);
                if(modulos.containsKey(nomModulo)){
                    RequerimientoFDTO rfdto=new RequerimientoFDTO();
                    rfdto.setId(rs.getString(2));
                    modulos.get(nomModulo).add(rfdto);
                }else{
                    modulos.put(nomModulo, new ArrayList<RequerimientoFDTO>());
                    RequerimientoFDTO rfdto=new RequerimientoFDTO();
                    rfdto.setId(rs.getString(2));
                    modulos.get(nomModulo).add(rfdto);
                }
            }
            ArrayList<ModuloDTO> listaMod=new ArrayList<ModuloDTO>();
            for (String mod : modulos.keySet()) {
                ModuloDTO m=new ModuloDTO();
                m.setRequerimientosFs(modulos.get(m));
            }
            PrivilegioDTO privilegio=new PrivilegioDTO();
            privilegio.setModulos(listaMod);
        } catch (SQLException ex) {
            Logger.getLogger(GeneralPrivilegioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            cerrarConexion();
        }
        
    }
}
