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
public class Pasantia {
    
    int id;
    String idconvenio;
    String proyecto;
    String tutorempresa;
    String tutoruniversidad;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdconvenio() {
        return idconvenio;
    }

    public void setIdconvenio(String idconvenio) {
        this.idconvenio = idconvenio;
    }

    public String getProyecto() {
        return proyecto;
    }

    public void setProyecto(String proyecto) {
        this.proyecto = proyecto;
    }

    public String getTutorempresa() {
        return tutorempresa;
    }

    public void setTutorempresa(String tutorempresa) {
        this.tutorempresa = tutorempresa;
    }

    public String getTutoruniversidad() {
        return tutoruniversidad;
    }

    public void setTutoruniversidad(String tutoruniversidad) {
        this.tutoruniversidad = tutoruniversidad;
    }
    
    
    
}
