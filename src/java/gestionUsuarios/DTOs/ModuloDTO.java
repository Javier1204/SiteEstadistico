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
    private String nombre;
    private String descripcion;
    private String url;
    private ArrayList<RequerimientosFDTO> requerimientos;
    public ModuloDTO(){
       requerimientos=new ArrayList<RequerimientosFDTO>();
    }
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    

    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public ArrayList<RequerimientosFDTO> getRequerimientos() {
        return requerimientos;
    }

    public void setRequerimientos(ArrayList<RequerimientosFDTO> requerimientos) {
        this.requerimientos = requerimientos;
    }
    
    public boolean containRF(String rf){
        for (RequerimientosFDTO r : requerimientos) {
            if(r.getId().equalsIgnoreCase(rf)){
                return true;
            }
        }
        return false;
    }
    public RequerimientosFDTO getRequerimiento(String rf) {
        for (RequerimientosFDTO r : requerimientos) {
            if(r.getId().equalsIgnoreCase(rf)){
                return r;
            }
        }
        return null;
    }
    
}
