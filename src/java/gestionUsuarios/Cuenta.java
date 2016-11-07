/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios;

import gestionUsuarios.DTOs.PrivilegioDTO;
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
    private PrivilegioDTO privilegio;

    

    @Override
    public boolean containModulo(String nomModulo) {
        return privilegio.containModulo(nomModulo);
    }

    @Override
    public boolean containRol(String rol) {
        for (RolDTO role : roles) {
            if(role.getRol().equalsIgnoreCase(rol))return true;
        }
        return false;
    }

    @Override
    public List<String> listarRoles() {
        ArrayList<String> lista=new ArrayList<>();
        for (RolDTO rol : roles) {
            lista.add(rol.getRol());
        }
        return lista;
    }

    @Override
    public List<String> listarModulos() {
        return privilegio.listarModulosN();
    }


    @Override
    public void construirCuenta(UsuarioDTO user, List<RolDTO> roles, PrivilegioDTO privilegios) {
        this.usser=user;
        this.roles=(ArrayList<RolDTO>) roles;
        this.privilegio=privilegios;
    }

    @Override
    public String getUser() {
        return this.usser.getUssername();
    }

    @Override
    public String getPassword() {
        return this.usser.getPassword();
    }


    
    
}
