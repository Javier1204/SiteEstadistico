/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios;

import gestionUsuarios.DTOs.ModuloDTO;
import gestionUsuarios.DTOs.RequerimientoFDTO;
import gestionUsuarios.DTOs.RolDTO;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class GestionUsuario implements IGestionUsuarios{
    
    
    private GestionUsuario(){}
    @Override
    public ICuenta loggearUsuario(String rol, String usuario, String password) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean registrarModulo(ICuenta adminOcord, String nombreModulo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean registrarRF(ICuenta adminOcor, String nombreModulo, String RF, String nombreRF) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean validarUsuario(String rol, String usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String registrarUsuario(String usuario, String pass, List<String> roles) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean asignarRoles(ICuenta usuario, List<String> roles) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean asignarPrivilegios(ICuenta usuario, String rol, String modulo, List<String> RF) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public static IGestionUsuarios getInstance() {
        return new GestionUsuario();
    }

    @Override
    public ICuenta cambiarContrasena(ICuenta cuenta, String nuevaContra) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean cambiarContrasena(ICuenta administrador, String usuario, String nuevaContra) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<RolDTO> listarRoles() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ModuloDTO> listarModulo() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<RequerimientoFDTO> listarRFsDeModulos(String nomModulo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
