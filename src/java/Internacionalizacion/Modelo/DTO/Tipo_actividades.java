/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DTO;

/**
 *
 * @author JAVIER
 */
public class Tipo_actividades {
    
    int id;
    int idconvenio;
    boolean movilidad;
    boolean practica;
    boolean extension;
    boolean investigacion;
    boolean social;
    boolean pasantia;
    
    public Tipo_actividades(){
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdconvenio() {
        return idconvenio;
    }

    public void setIdconvenio(int idconvenio) {
        this.idconvenio = idconvenio;
    }

    public boolean isMovilidad() {
        return movilidad;
    }

    public void setMovilidad(boolean movilidad) {
        this.movilidad = movilidad;
    }

    public boolean isPractica() {
        return practica;
    }

    public void setPractica(boolean practica) {
        this.practica = practica;
    }

    public boolean isExtension() {
        return extension;
    }

    public void setExtension(boolean extension) {
        this.extension = extension;
    }

    public boolean isInvestigacion() {
        return investigacion;
    }

    public void setInvestigacion(boolean investigacion) {
        this.investigacion = investigacion;
    }

    public boolean isSocial() {
        return social;
    }

    public void setSocial(boolean social) {
        this.social = social;
    }

    public boolean isPasantia() {
        return pasantia;
    }

    public void setPasantia(boolean pasantia) {
        this.pasantia = pasantia;
    }

    public Tipo_actividades(int id, int idconvenio, boolean movilidad, boolean practica, boolean extension, boolean investigacion, boolean social, boolean pasantia) {
        this.id = id;
        this.idconvenio = idconvenio;
        this.movilidad = movilidad;
        this.practica = practica;
        this.extension = extension;
        this.investigacion = investigacion;
        this.social = social;
        this.pasantia = pasantia;
    }
        
}
