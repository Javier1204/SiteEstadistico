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
public class Disciplina_DeportivaDTO {
    private int id_disciplina;
    private String nombre_disciplina;
    private int puntos;
    private Jornada_DeportivaDTO jornada_deportiva;

    public int getId_disciplina() {
        return id_disciplina;
    }

    public void setId_disciplina(int id_disciplina) {
        this.id_disciplina = id_disciplina;
    }

    public String getNombre_disciplina() {
        return nombre_disciplina;
    }

    public void setNombre_disciplina(String nombre_disciplina) {
        this.nombre_disciplina = nombre_disciplina;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public Jornada_DeportivaDTO getJornada_deportiva() {
        return jornada_deportiva;
    }

    public void setJornada_deportiva(Jornada_DeportivaDTO jornada_deportiva) {
        this.jornada_deportiva = jornada_deportiva;
    }
   
    
}
