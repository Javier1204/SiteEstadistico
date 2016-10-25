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
    public boolean containRF(String idRF){
        for (ModuloDTO modulo : modulos) {
            if(modulo.containRF(idRF))return true;
        }
        return true;
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
    
    public List<String> listarRF()
    {
        ArrayList<String> lista=new ArrayList<>();
        for (ModuloDTO m : modulos) {
            lista.addAll(m.listarRF());
        }
        return lista;
    }
    
    public List<String> listarRF(String modulo)
    {
        for (ModuloDTO m : modulos) {
            if(m.getNombre().equalsIgnoreCase(modulo))return m.listarRF();
        }
        return null;
    }
}
