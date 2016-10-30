/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios;

import gestionUsuarios.DAOs.GeneralModuloDAO;
import gestionUsuarios.DAOs.GeneralPrivilegioDAO;
import gestionUsuarios.DAOs.GeneralUsuarioDAO;
import gestionUsuarios.DAOs.GeneralUsuarioRolDAO;
import gestionUsuarios.DTOs.ModuloDTO;
import gestionUsuarios.DTOs.PrivilegioDTO;
import gestionUsuarios.DTOs.RolDTO;
import gestionUsuarios.DTOs.UsuarioDTO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class ControlGestionUsuarios {
    
    private ControlGestionUsuarios(){}
    protected static ControlGestionUsuarios getInstance(){
        return new ControlGestionUsuarios();
    }
    protected ICuenta loggearUser(String rol, String user, String pass){
        if(!this.existeUsuario(rol, user))return null;
        if(!this.validaPass(user, pass))return null;
        return cargarCuenta(rol, user, pass);
    }
    private boolean existeUsuario(String rol, String user){
        GeneralUsuarioRolDAO ur=new GeneralUsuarioRolDAO();
        return ur.existe(rol, user);
    }
    private boolean validaPass(String user, String pass)
    {
        String ePass=encriptar(pass);
        GeneralUsuarioDAO us=new GeneralUsuarioDAO();
        return ePass.equals(us.getPass(user));
    }
    private String encriptar(String dato){
        return dato;
    }
    private ICuenta cargarCuenta(String rol, String user, String pass){
        Cuenta cuenta=new Cuenta();
        GeneralUsuarioDAO us=new GeneralUsuarioDAO();
        UsuarioDTO u=us.getUsuario(user);
        ArrayList<RolDTO> roles=(ArrayList<RolDTO>) new GeneralUsuarioRolDAO().obtenerRoles(user);
        GeneralPrivilegioDAO pdao=new GeneralPrivilegioDAO();
        PrivilegioDTO priv=pdao.getPrivilegioUsuario(user);
        cuenta.construirCuenta(u, roles, priv);
        return cuenta;
    }
    protected List<ModuloDTO> listarModulos(){
        return new GeneralModuloDAO().listaModulos();
    }
}
