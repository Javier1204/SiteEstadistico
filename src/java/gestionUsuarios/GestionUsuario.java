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
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class GestionUsuario implements IGestionUsuarios{
    
    
    private GestionUsuario(){}
    @Override
    public ICuenta loggearUsuario(String usuario, String password) {
        ControlGestionUsuarios c=ControlGestionUsuarios.getInstance();
        return c.loggearUser(usuario, password);
    }


    @Override
    public boolean validarUsuario(String rol, String usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    @Override
    public boolean asignarRoles(ICuenta usuario, List<String> roles) {
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
    public List<RolDTO> listarRoles() {
        ControlGestionUsuarios c=ControlGestionUsuarios.getInstance();
        return c.listarRoles();
        
    }

    @Override
    public List<ModuloDTO> listarModulo() {
        return ControlGestionUsuarios.getInstance().listarModulos();
    }

    
    @Override
    public boolean registrarModulo(String nombreModulo, String descripcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarModulo(String modulo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean registrarRF(String nombreModulo, String RF, String nombreRF, String url) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarRF(String modulo, String rf) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String registrarUsuario(String usuario, String pass) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean asignarPrivilegios(String rol, PrivilegioDTO privilegios) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PrivilegioDTO quitarPrivilegios(String rol, PrivilegioDTO privilegios) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean cambiarContrasena(String usuario, String viejaContrasena, String nuevaContra) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<RequerimientosFDTO> listarRF(String modulo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public static void main(String[] args) {
        ICuenta cuenta=new GestionUsuario().loggearUsuario("admin", "admin");
        System.out.println(cuenta.getPassword());
    }
    

}
