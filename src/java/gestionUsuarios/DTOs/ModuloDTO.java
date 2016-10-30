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
public class ModuloDTO {
    private ArrayList<RequerimientoFDTO> requerimientosFs;
    private String nombre;

    public ArrayList<RequerimientoFDTO> getRequerimientosFs() {
        return requerimientosFs;
    }

    public void setRequerimientosFs(ArrayList<RequerimientoFDTO> requerimientosFs) {
        this.requerimientosFs = requerimientosFs;
    }
    
    
    protected boolean containRF(String nomReq){
        for (RequerimientoFDTO requerimientosF : requerimientosFs) {
            if(requerimientosF.getId().equalsIgnoreCase(nomReq))return true;
        }
        return false;
    }
    
    
    protected List<String> listarRF()
    {
        ArrayList<String> lista=new ArrayList<>();
        for (RequerimientoFDTO rf : requerimientosFs) {
            lista.add(rf.getId()+"-"+rf.getNombreRF());
        }
        return listarRF();
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
