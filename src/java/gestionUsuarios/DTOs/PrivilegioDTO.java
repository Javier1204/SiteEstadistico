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
    
}
