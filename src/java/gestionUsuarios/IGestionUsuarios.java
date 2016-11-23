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
 * @author Denis
 */
public interface IGestionUsuarios {
    
    /**
     * Permite verificar si el usuario y contraseña se encuentran en la base de datos
     * @param usuario ussername
     * @param password contraseña
     * @return retorna la cuenta del usuario con todos los datos cargados, es decir, que contiene todos los roles, 
     * todos los modulos y requerimientos funcionales en los cuales que puede desempeñar el usuario.
     */
    public ICuenta loggearUsuario(String usuario, String password);
    
    /**
     * permite registra un modulo en el sistema, para que el sistema sea escalable
     * @param descripcion descripcion del modulo
     * @param nombreModulo  nombre del modulo que se va a registrar
     * @return true si se puedo realizar con exito, false sino puede ser que ya este registrado un modulo con el mismo
     * nombre
     */
    public boolean registrarModulo(String nombreModulo, String descripcion);
    
    /**
     * elimina el modulo del sistema, 
     * ALERTA: al hacer esto se eleminan todos los requerimientos funcionales de ese modulo
     * @param modulo modulo que quiere elminar
     * @return true si pudo eliminar el modulo
     */
    public boolean eliminarModulo(String modulo);
    
    /**
     * permite registrar requerimientos funcionales a un modulo
     * @param usuario esta función solo la pueden hacer los usuarios con roles administrador o coordinador
     * @param nombreModulo nomnbre del modulo al cual se va a asignar los RF
     * @param RF ID del RF, es decir RF1, RF2, RF3... dependiend del ID que tenga su RF es su documento
     * @param nombreRF nombre del RF ejemplo: "consultar docentes"
     * @return return true si pudo realizar el proceso de resgitro, false sino pudo por diferentes
     * motivos como por ejemplo que nombre del modulo no exista, que el RF ya fue regustrado
     */
    public boolean registrarRF(String nombreModulo, String RF, String nombreRF, String url);
    
    /**
     * Elimina el RF de un modulo, si este requeriminato lo usa un rol será desasignado
     * @param modulo modulo que contiene el RF
     * @param rf requerimiento funacional
     * @return 
     */
    public boolean eliminarRF(String modulo, String rf);
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
     * @return puede retornar que la operacion fue un exito o si ocurrió un error, por ejemplo que
     * ya existia un ussername igual, o no existe ese rol
     */
    public String registrarUsuario(String usuario, String pass);
    
    /**
     * Asigna roles a una cuenta
     * @param usuario Objeto cuenta al cual se le va a asignar las nuevos roles
     * @param roles roles que quiere asignar
     * @return true si se puedo realizar, false sino se pudo realizar por motivos como que los roles no
     * existen o el usuario no existe
     */
    public boolean asignarRoles(ICuenta usuario, List<String> roles);
    
    
    /**
     * Asigna privilegios (requerimientos funcionales de modulos) a un rol
     * @param rol rol al cual se le van a agregar requerimientos funcionales
     * @param privilegios los privilegios deben tener los modulos con los requerimientos funcionales 
     * que va a agregarle a ese rol, el sistema se encarga de guarda los nuevos modulos
     * @return boolean si se pudieron agregar los modulos a el rol, false sino se pudo
     */
    public boolean asignarPrivilegios(String rol, PrivilegioDTO privilegios);
    
    /**
     * quitar Requerimientos funcionales a un rol
     * @param rol rol al cual se le van a quitar los requerimientos funcionales
     * @param privilegios Todos los roles que va a quitarle, si estos ya los tiene reguistrados
     * ignora la peticion
     * @return todos los privilegios que fueron eliminados.
     */
    public PrivilegioDTO quitarPrivilegios(String rol, PrivilegioDTO privilegios);
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
    public boolean cambiarContrasena(String usuario, String viejaContrasena, String nuevaContra);
    
    /**
     * lista todos los roles que hay en el sistema
     * @return 
     */
    public List<RolDTO>  listarRoles();
    
    /**
     * lista todos los modulos que hay en el sistema, junto con sus requermientos funcionales
     * @return 
     */
    public List<ModuloDTO>  listarModulo();
    
    /**
     * lista todos los requerimientos funcionales de un modulo
     * @param modulo modulo del cual se necesitan los RF
     * @return lista de todos los requerimientos funcionales de ese modulo
     */
    public List<RequerimientosFDTO> listarRF(String modulo);
    
}
