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
 * @author Denis
 */
public interface IGestionUsuarios {
    
    /**
     * Permite verificar si el usuario y contraseña se encuentran en la base de datos
     * @param rol rol del usuario que se va a registrar, si el usuario  tiene varios roles solo elige uno
     * @param usuario ussername
     * @param password contraseña
     * @return retorna la cuenta del usuario con todos los datos cargados, es decir, que contiene todos los roles, 
     * todos los modulos y requerimientos funcionales en los cuales que puede desempeñar el usuario.
     */
    public ICuenta loggearUsuario(String rol, String usuario, String password);
    
    /**
     * permite registra un modulo en el sistema, para que el sistema sea escalable
     * @param usuario   registrar modulos solo lo pueden hacer roles super administrador y coordinador
     * @param nombreModulo  nombre del modulo que se va a registrar
     * @return true si se puedo realizar con exito, false sino puede ser que ya este registrado un modulo con el mismo
     * nombre
     */
    public boolean registrarModulo(ICuenta adminOcord, String nombreModulo);
    /**
     * permite registrar requerimientos funcionales a un modulo
     * @param usuario esta función solo la pueden hacer los usuarios con roles administrador o coordinador
     * @param nombreModulo nomnbre del modulo al cual se va a asignar los RF
     * @param RF ID del RF, es decir RF1, RF2, RF3... dependiend del ID que tenga su RF es su documento
     * @param nombreRF nombre del RF ejemplo: "consultar docentes"
     * @return return true si pudo realizar el proceso de resgitro, false sino pudo por diferentes
     * motivos como por ejemplo que nombre del modulo no exista, que el RF ya fue regustrado
     */
    public boolean registrarRF(ICuenta adminOcor, String nombreModulo, String RF, String nombreRF);
    
    /**
     * validar si el usuario esta en el sistema
     * @param rol rol del usuario que desea buscar
     * @param usuario ussername del usuario que desea buscar
     * @return true si existe ese usuario, false sino existe en el sistema
     */
    public boolean validarUsuario(String rol, String usuario);
    /**
     * permite registrar usuarios en la base de datos
     * @param usuario   ussername
     * @param pass  password
     * @param roles roles que puede tener ese usuario
     * @return puede retornar que la operacion fue un exito o si ocurrió un error, por ejemplo que
     * ya existia un ussername igual, o no existe ese rol
     */
    public String registrarUsuario(String usuario, String pass, List<String> roles);
    /**
     * Asigna roles a una cuenta
     * @param usuario Objeto cuenta al cual se le va a asignar las nuevos roles
     * @param roles roles que quiere asignar
     * @return true si se puedo realizar, false sino se pudo realizar por motivos como que los roles no
     * existen o el usuario no existe
     */
    public boolean asignarRoles(ICuenta usuario, List<String> roles);
    /**
     * Asigna privilegios a una cuenta
     * @param usuario cuenta a la cual le va a asignar RF (requerimientos funcionales)
     * @param rol rol de la cuenta que le va a asigar esos privilegios
     * @param RF requerimientos funcionales que va a agregar a esa cuenta tener en cuenta que cada RF
     * esta identificado por un ID que lo define cada módulo, es decir RF1, RF2, RF3... esto solo para un
     * modulo
     * @return boolean si se pudo realizar el registro, fasle sino pudo por que el rol, el usuario, o alguno de los RF
     * no existe
     */
    public boolean asignarPrivilegios(ICuenta usuario, String rol, String modulo, List<String> RF);
    
    /**
     * Cambia la contraseña del usuario que esta loggueado
     * @param cuenta cuenta del usuario que la va a cambiar
     * @param nuevaContra nueva contraseña del usuario
     * @return la cuenta con la contraseña cambiada si ocurrio un error retorna null
     */
    public ICuenta cambiarContrasena(ICuenta cuenta, String nuevaContra);
    /**
     * El superadministador cambia la contraseña de cualquier usuario
     * @param administrador cuenta del superadministrador
     * @param usuario ussername 
     * @param nuevaContra nuevaContraseña
     * @return true si pudo registrar exitosamente, false sino, porque el usuario no existe
     */
    public boolean cambiarContrasena(ICuenta administrador, String usuario, String nuevaContra);
    
    //aqui van los listar roles, modulos, rf por modulos
    /**
     * lista todos los roles que hay en el sistema
     * @return 
     */
    public List<RolDTO>  listarRoles();
    /**
     * lista todos los modulos que hay en el sistema
     * @return 
     */
    public List<ModuloDTO>  listarModulo();
    
    /**
     * lista los RFs que tiene un modulo
     * @param nomModulo nombre del modulo de los cuales necesita requerimientos
     * @return 
     */
    public List<RequerimientoFDTO> listarRFsDeModulos(String nomModulo);
}
