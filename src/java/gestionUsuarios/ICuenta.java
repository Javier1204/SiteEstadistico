/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios;

import gestionUsuarios.DTOs.PrivilegioDTO;
import gestionUsuarios.DTOs.RolDTO;
import gestionUsuarios.DTOs.UsuarioDTO;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public interface ICuenta {
    public String getUser();
    public String getPassword();
    public boolean containModulo(String nomModulo);
    public boolean containRol(String rol);
    public List<String> listarRoles();
    public List<String> listarModulos();
    public void construirCuenta(UsuarioDTO user, List<RolDTO> roles, PrivilegioDTO privilegios);
    
}
