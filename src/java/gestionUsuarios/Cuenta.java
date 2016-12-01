/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios;

import gestionUsuarios.DTOs.ModuloDTO;
import gestionUsuarios.DTOs.PrivilegioDTO;
import gestionUsuarios.DTOs.RequerimientosFDTO;
import gestionUsuarios.DTOs.RolDTO;
import gestionUsuarios.DTOs.UsuarioDTO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class Cuenta implements ICuenta{
    private UsuarioDTO usser;
    private ArrayList<RolDTO> roles;

    

    @Override
    public boolean containModulo(String rol, String nomModulo) {
        for (RolDTO role : roles) {
            if(role.getRol().equalsIgnoreCase(rol))return role.containModulo(nomModulo);
        }
        return false;
    }

    @Override
    public boolean containRol(String rol) {
        for (RolDTO role : roles) {
            if(role.getRol().equalsIgnoreCase(rol))return true;
        }
        return false;
    }

    @Override
    public ArrayList<RolDTO> listarRoles() {
        return roles;
    }

    @Override
    public ArrayList<ModuloDTO> listarModulos(String rol) {
        for (RolDTO role : roles) {
            if(role.getRol().equalsIgnoreCase(rol))return role.getPrivilegio().getModulos();
        }
        return null;
    }


    

    @Override
    public String getUser() {
        return this.usser.getUssername();
    }

    @Override
    public String getPassword() {
        return this.usser.getPassword();
    }

    @Override
    public boolean containRF(String modulo, String rf) {
        
        for (RolDTO role : roles) {
            if(role.containRF(modulo, rf))return true;
        }
        return false;
    }

    

    @Override
    public RolDTO getRol(String rol) {
        for (RolDTO role : roles) {
            if(role.getRol().equalsIgnoreCase(rol)){
                return role;
            }
        }
        return null;
    }

    

    

    

    @Override
    public boolean containModulo(String nomModulo) {
        for (RolDTO role : roles) {
            if(role.containModulo(nomModulo))return true;
        }
        return false;
    }

    @Override
    public ModuloDTO getModulo(String rol, String modulo) {
        for (RolDTO role : roles) {
            if(role.getRol().equalsIgnoreCase(rol))return role.getModuloDTO(modulo);
        }
        return null;
    }

    @Override
    public RequerimientosFDTO getRequerimiento(String rol, String modulo, String rf) {
        for (RolDTO role : roles) {
            if(role.getRol().equalsIgnoreCase(rol))return role.getRequerimiento(modulo, rf);
        }
        return null;
    }

    @Override
    public PrivilegioDTO getPrivilegioDTO(String rol) {
        for (RolDTO role : roles) {
            if(role.getRol().equalsIgnoreCase(rol))return role.getPrivilegio();
        }
        return null;
    }

    @Override
    public List<RequerimientosFDTO> listarRFs(String rol, String modulo) {
        for (RolDTO role : roles) {
            if(role.getRol().equalsIgnoreCase(rol))return role.getPrivilegio().listarRFs(modulo);
        }
        return null;
    }

    @Override
    public void construirCuenta(UsuarioDTO user, List<RolDTO> roles) {
        this.usser=user;
        this.roles=(ArrayList<RolDTO>)roles;
    }

    @Override
    public List<ModuloDTO> listarModulos() {
        ArrayList<ModuloDTO> lista=new ArrayList<ModuloDTO>();
        for (RolDTO rol:this.roles ){
            ArrayList<ModuloDTO> modulos=rol.getPrivilegio().getModulos();
            for (ModuloDTO modulo : modulos) {
                boolean e=false;
                for (ModuloDTO lismod : lista) {
                    if(modulo.getNombre().equalsIgnoreCase(lismod.getNombre())){
                        e=true;
                        break;
                    }
                }
                if(!e)lista.add(modulo);
            }
        }
        return lista;
    }


    
    public String getNombre(){
        return this.usser.getNombre();
    }
}
