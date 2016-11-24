/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Modelo.DTO;

/**
 *
 * @author JAVIER
 */
public class Convenio_Entidad {
    
    int idconvenio;
    int identidad;
            
    public Convenio_Entidad(){
        
    }

    public int getIdconvenio() {
        return idconvenio;
    }

    public void setIdconvenio(int idconvenio) {
        this.idconvenio = idconvenio;
    }

    public int getIdentidad() {
        return identidad;
    }

    public void setIdentidad(int identidad) {
        this.identidad = identidad;
    }        
    
    public Convenio_Entidad(int idconvenio, int identidad) {
        this.idconvenio = idconvenio;
        this.identidad = identidad;
    }
}
