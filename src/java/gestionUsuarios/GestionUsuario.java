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
    public List<String> asignarRoles(ICuenta usuario, List<String> roles) {
        return ControlGestionUsuarios.getInstance().asignarRoles(usuario, roles);
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
    public boolean registrarModulo(String nombreModulo, String descripcion, String url) {
        return ControlGestionUsuarios.getInstance().registrarModulo(nombreModulo, descripcion, url);
    }

    @Override
    public boolean eliminarModulo(String modulo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean registrarRF(String nombreModulo, String RF, String nombreRF, String url) {
        return ControlGestionUsuarios.getInstance().registrarRF(nombreModulo, RF, nombreRF, url);
    }

    @Override
    public boolean eliminarRF(String modulo, String rf) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean registrarUsuario(String usuario, String pass) {
        return ControlGestionUsuarios.getInstance().registrarUsuario(usuario, pass);
    }

    @Override
    public void asignarPrivilegios(String rol, PrivilegioDTO privilegios) {
        ControlGestionUsuarios.getInstance().asignarPrivilegios(rol, privilegios);
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
        return ControlGestionUsuarios.getInstance().listarRF(modulo);
    }
    
    @Override
    public List<ModuloDTO> listarModuloConRFs() {
        return ControlGestionUsuarios.getInstance().listarModulosConRFs();
    }
    
       
    @Override
    public boolean registrarRol(String rol, String descripcion) {
        return ControlGestionUsuarios.getInstance().registrarRol(rol, descripcion);
    }

    @Override
    public boolean eliminarRol(String rol) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public static void main(String[] args) {
        ICuenta cuenta=new GestionUsuario().loggearUsuario("admin", "admin");
        ArrayList<ModuloDTO> listaMod=(ArrayList<ModuloDTO>)cuenta.listarModulos();
        System.out.println(cuenta.getPassword());
        System.out.println(new GestionUsuario().listarRoles());
        System.out.println(new GestionUsuario().listarModulo());        
        System.out.println(new GestionUsuario().listarModuloConRFs());
    }

    @Override
    public List<UsuarioDTO> listarUsuarios() {
        return ControlGestionUsuarios.getInstance().listarUsuarios();
    }

    
    

}
