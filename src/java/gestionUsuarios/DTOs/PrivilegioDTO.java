/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionUsuarios.DTOs;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class PrivilegioDTO {
    private ArrayList<ModuloDTO> modulos;

    public ArrayList<ModuloDTO> getModulos() {
        return modulos;
    }

    public void setModulos(ArrayList<ModuloDTO> modulos) {
        this.modulos = modulos;
    }
    
    public boolean containModulo(String nombreM)
    {
        for (ModuloDTO modulo : modulos) {
            if(modulo.getNombre().equalsIgnoreCase(nombreM))return true;
        }
        return false;
    }
    public List<String> listarModulosN()
    {
        ArrayList<String> lista=new ArrayList<>();
        for (ModuloDTO m : modulos) {
            lista.add(m.getNombre());
        }
        return lista;
    }
    public boolean containRF(String modulo, String rf){
        for (ModuloDTO mod : modulos) {
            if(mod.getNombre().equalsIgnoreCase(modulo)){
                return mod.containRF(rf);
            }
        }
        return false;
    }
    public ModuloDTO getModulo(String modulo){
        for (ModuloDTO mod : modulos) {
            if(mod.getNombre().equalsIgnoreCase(modulo))return mod;
        }
        return null;
    }
    public RequerimientosFDTO getRequerimiento(String modulo, String rf) {
        for (ModuloDTO mod : modulos) {
            if(mod.getNombre().equalsIgnoreCase(modulo)){
                return mod.getRequerimiento(rf);
            }
        }
        return null;
    }
    public List<RequerimientosFDTO> listarRFs(String modulo) {
        for (ModuloDTO mod : modulos) {
            if(mod.getNombre().equalsIgnoreCase(modulo))return mod.getRequerimientos();
        }
        return null;
    }
    
}
