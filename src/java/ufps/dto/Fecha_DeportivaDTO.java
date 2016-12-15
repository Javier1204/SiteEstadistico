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
public class Fecha_DeportivaDTO {
     private int id_fecha;
    private String fecha;
    private Jornada_DeportivaDTO jornada;

    public int getId_fecha() {
        return id_fecha;
    }

    public void setId_fecha(int id_fecha) {
        this.id_fecha = id_fecha;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Jornada_DeportivaDTO getJornada() {
        return jornada;
    }

    public void setJornada(Jornada_DeportivaDTO jornada) {
        this.jornada = jornada;
    }
    
}
