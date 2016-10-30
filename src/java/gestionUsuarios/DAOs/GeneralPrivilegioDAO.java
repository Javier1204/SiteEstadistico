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
            obtenerConexion();
            PreparedStatement ps=conn.prepareStatement("SELECT modulo, rf FROM general_privilegios WHERE user=?");
            ps.setString(1, user);
            ResultSet rs=ps.executeQuery();
            HashMap<String, ArrayList<RequerimientoFDTO>> modulos=new HashMap<String, ArrayList<RequerimientoFDTO>>();
            while(rs.next()){
                String nomModulo=rs.getString(1);
                GeneralRequerimientoFuncionalDAO rfDAO=new GeneralRequerimientoFuncionalDAO();
                RequerimientoFDTO rfdto=rfDAO.getRequerimiento(nomModulo, rs.getString(2));
                
                if(modulos.containsKey(nomModulo)){                   
                                        
                    modulos.get(nomModulo).add(rfdto);
                }else{//creo modulos para el hashmap
                    modulos.put(nomModulo, new ArrayList<RequerimientoFDTO>());
                    modulos.get(nomModulo).add(rfdto);
                }
            }
            ArrayList<ModuloDTO> listaMod=new ArrayList<ModuloDTO>();
            for (String mod : modulos.keySet()) {//creo objetos modulos                
                GeneralModuloDAO modDAO=new GeneralModuloDAO();
                ModuloDTO m=modDAO.getModulo(mod);                
                m.setRequerimientosFs(modulos.get(mod));
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
        System.out.println(p.getPrivilegioUsuario("1151052").getModulos().get(0).getNombre());
    }
}
