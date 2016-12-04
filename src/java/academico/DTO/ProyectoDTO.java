/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.DTO;

/**
 *
 * @author Mauricio
 */
public class ProyectoDTO {
    
    private int proyecto_id, max_integrantes, semillero;
    private String proyecto_name, keywords, desc, equipo_encargado;
    private boolean modificable;

    public ProyectoDTO() {
    }

    public int getProyecto_id() {
        return proyecto_id;
    }

    public void setProyecto_id(int proyecto_id) {
        this.proyecto_id = proyecto_id;
    }

    public int getMax_integrantes() {
        return max_integrantes;
    }

    public void setMax_integrantes(int max_integrantes) {
        this.max_integrantes = max_integrantes;
    }

    public int getSemillero() {
        return semillero;
    }

    public void setSemillero(int semillero) {
        this.semillero = semillero;
    }

    public String getProyecto_name() {
        return proyecto_name;
    }

    public void setProyecto_name(String proyecto_name) {
        this.proyecto_name = proyecto_name;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public boolean isModificable() {
        return modificable;
    }

    public void setModificable(boolean modificable) {
        this.modificable = modificable;
    }

    public String getEquipo_encargado() {
        return equipo_encargado;
    }

    public void setEquipo_encargado(String equipo_encargado) {
        this.equipo_encargado = equipo_encargado;
    }
    
}
