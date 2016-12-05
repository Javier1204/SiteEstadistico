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
public class EquipoDTO {

    private int id_equipo;
    private String nombre_equipo;
    private int puntos;
    private CapitanDTO capitan_equipo;
    private Jornada_DeportivaDTO jornada_deportiva;

    public int getId_equipo() {
        return id_equipo;
    }

    public void setId_equipo(int id_equipo) {
        this.id_equipo = id_equipo;
    }

    public String getNombre_equipo() {
        return nombre_equipo;
    }

    public void setNombre_equipo(String nombre_equipo) {
        this.nombre_equipo = nombre_equipo;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public CapitanDTO getCapitan_equipo() {
        return capitan_equipo;
    }

    public void setCapitan_equipo(CapitanDTO capitan_equipo) {
        this.capitan_equipo = capitan_equipo;
    }

    public Jornada_DeportivaDTO getJornada_deportiva() {
        return jornada_deportiva;
    }

    public void setJornada_deportiva(Jornada_DeportivaDTO jornada_deportiva) {
        this.jornada_deportiva = jornada_deportiva;
    }

}
