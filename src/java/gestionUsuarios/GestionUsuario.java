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
    public List<String> asignarRoles(ICuenta usuario, List<String> roles) {
        return ControlGestionUsuarios.getInstance().asignarRoles(usuario, roles);
    }


    
    public static IGestionUsuarios getInstance() {
        return new GestionUsuario();
    }

    @Override
    public boolean cambiarContrasena(String usuario, String nuevaContra) {
        return ControlGestionUsuarios.getInstance().cambiarContrasena(usuario, nuevaContra);
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
        return ControlGestionUsuarios.getInstance().eliminarModulo(modulo);
    }

    @Override
    public boolean registrarRF(String nombreModulo, String RF, String nombreRF, String url) {
        return ControlGestionUsuarios.getInstance().registrarRF(nombreModulo, RF, nombreRF, url);
    }
    
    @Override
    public void eliminarRF(String modulo, String rf) {
        ControlGestionUsuarios.getInstance().eliminarRF(modulo, rf);
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
    public void quitarPrivilegios(String rol, PrivilegioDTO privilegios) {
        ControlGestionUsuarios.getInstance().quitarPrivilegios(rol, privilegios);
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
        return ControlGestionUsuarios.getInstance().eliminarRol(rol);
    }

    

    @Override
    public List<UsuarioDTO> listarUsuarios() {
        return ControlGestionUsuarios.getInstance().listarUsuarios();
    }

    @Override
    public boolean modificarModulo(String modulo, String nuevaDescripcion, String url) {
        return ControlGestionUsuarios.getInstance().modificarModulo(modulo, nuevaDescripcion, url);
    }

    @Override
    public boolean modificarRF(String modulo, String rf, String nuevoDesString, String nuevaURL) {
        return ControlGestionUsuarios.getInstance().modificarRF(modulo, rf, nuevoDesString, nuevaURL);
    }

    @Override
    public boolean quitarRol(String usuario, String rol) {
        return ControlGestionUsuarios.getInstance().quitarRol(usuario, rol);
    }

    @Override
    public boolean modificarRol(String rol, String nuevaDescripcion) {
        return ControlGestionUsuarios.getInstance().modificarRol(rol, nuevaDescripcion);
    }

    @Override
    public boolean eliminarUsuario(String usuario) {
        return ControlGestionUsuarios.getInstance().eliminarUsuario(usuario);
    }

    
    public static void main(String[] args) {
        ICuenta cuenta=new GestionUsuario().loggearUsuario("admin", "admin");
        ArrayList<ModuloDTO> listaMod=(ArrayList<ModuloDTO>)cuenta.listarModulos();
        //System.out.println(cuenta.getPassword());
        //System.out.println(new GestionUsuario().listarRoles());
        ArrayList<ModuloDTO> modulos=(ArrayList<ModuloDTO>) new GestionUsuario().listarModulo();
        for (ModuloDTO modulo : modulos) {
            System.out.println("modulo: "+modulo.getNombre());
        }
        System.out.println();        
        System.out.println(new GestionUsuario().listarModuloConRFs());
    }

   

    @Override
    public boolean actualizarPrivilegios(String rol, PrivilegioDTO privilegio) {
        return ControlGestionUsuarios.getInstance().actualizarPrivilegios(rol, privilegio);
    }

    @Override
    public boolean actualizarRoles(String usuario, List<String> roles) {
        return ControlGestionUsuarios.getInstance().actualizarRoles(usuario, roles);
    }
    
    @Override
    public List<RolDTO> cargarRolesUsuario(String usuario) {
        return ControlGestionUsuarios.getInstance().cargarRolesUsuario(usuario);
    }

    @Override
    public PrivilegioDTO cargarPrivilegio(String rol) {
        return ControlGestionUsuarios.getInstance().cargarPrivilegio(rol);
    }

}
