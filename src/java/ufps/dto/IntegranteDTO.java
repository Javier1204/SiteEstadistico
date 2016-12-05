/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ufps.dto;

/**
 *
 * @author jeffersson sinza
 */
public class IntegranteDTO {
     private int codigo_integrante;
    private String nombre_integrante;
    private int semestre;
    private String genero;
    private EquipoDTO equipo;

    public int getCodigo_integrante() {
        return codigo_integrante;
    }

    public void setCodigo_integrante(int codigo_integrante) {
        this.codigo_integrante = codigo_integrante;
    }

    public String getNombre_integrante() {
        return nombre_integrante;
    }

    public void setNombre_integrante(String nombre_integrante) {
        this.nombre_integrante = nombre_integrante;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public EquipoDTO getEquipo() {
        return equipo;
    }

    public void setEquipo(EquipoDTO equipo) {
        this.equipo = equipo;
    }
    
    
}
