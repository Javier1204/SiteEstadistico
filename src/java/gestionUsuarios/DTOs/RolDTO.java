/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DTOs;

/**
 *
 * @author Lenovo
 */
public class RolDTO {
    private String rol;
    private String descripcion;
    private PrivilegioDTO privilegio;

    public PrivilegioDTO getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(PrivilegioDTO privilegio) {
        this.privilegio = privilegio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    public boolean containModulo(String modulo){
        return privilegio.containModulo(modulo);
    }
    public boolean containRF(String modulo,String rf){
        return this.privilegio.containRF(modulo, rf);
    }
    public ModuloDTO getModuloDTO(String modulo){
        return privilegio.getModulo(modulo);
    }
    public RequerimientosFDTO getRequerimiento(String modulo, String rf) {
        return privilegio.getRequerimiento(modulo, rf);
    }
    public boolean containRF(String rf){
        return privilegio.containRF(rf);
    }
}
