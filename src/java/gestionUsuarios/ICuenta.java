/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios;

import gestionUsuarios.DTOs.ModuloDTO;
import gestionUsuarios.DTOs.PrivilegioDTO;
import gestionUsuarios.DTOs.RolDTO;
import gestionUsuarios.DTOs.UsuarioDTO;
import gestionUsuarios.DTOs.RequerimientosFDTO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public interface ICuenta {
    
    /**
     * Devulve el username, que en este caso es el codigo del profesor o estudiante
     * @return 
     */
    public String getUser();
    /**
     * retorna la contraseña de la cuenta no encriptada
     * @return 
     */
    public String getPassword();
    /**
     * metodo para saber si el usuario puede controlar un modulo, es independiente del rol
     * @param nomModulo
     * @return 
     */
    public boolean containModulo(String nomModulo);
    /**
     * Metodo para saber si el rol del usuario contiene un modulo especifico
     * @param rol
     * @param nomModulo
     * @return 
     */
    public boolean containModulo(String rol, String nomModulo);
    
    public boolean containRol(String rol);
    /**
     * para saber si el usuario puede usar un requermiento funcional de un modulo
     * independiente del rol
     * @param modulo
     * @param rf
     * @return 
     */
    public boolean containRF(String modulo, String rf);
    /**
     * me obtiene un modulo con los requerimientos funcionales que puede usar un rol
     * @param rol
     * @param modulo
     * @return 
     */
    public ModuloDTO getModulo(String rol, String modulo);
    /**
     * obtiene el rol
     * @param rol
     * @return 
     */
    public RolDTO getRol(String rol);
    /**
     * obtiene el requerimiento funcional del modulo de un rol
     * @param modulo
     * @param rf
     * @return 
     */
    public RequerimientosFDTO getRequerimiento(String rol, String modulo, String rf);
    /**
     * Obtiene el privilegio (modulos con los reqerimientos funcionales) de un rol
     * @param rol
     * @return 
     */
    public PrivilegioDTO getPrivilegioDTO(String rol);
    
    /**
     * Lista los roles del usuario
     * @return 
     */
    public ArrayList<RolDTO> listarRoles();

    /**
     *
     * @param rol
     * @return
     */
    public ArrayList<ModuloDTO> listarModulos(String rol);
    
    /**
     * lista todos los modulos que tiene el usuario, sin los requerimientos
     * @return 
     */
    public List<ModuloDTO> listarModulos();
    /**
     * lista los requerimientos funcaionales del modulo de un rol
     * @param rol
     * @param modulo
     * @return 
     */
    
    public List<RequerimientosFDTO> listarRFs(String rol, String modulo);
    /**
     * crea una cuenta
     * @param user
     * @param roles 
     */
    public void construirCuenta(UsuarioDTO user, List<RolDTO> roles);
    
    /**
     * retorna el nombre del profesor o estudiante
     * @return 
     */
    public String getNombre();
    
    public boolean probarAcceso(String url);
}
