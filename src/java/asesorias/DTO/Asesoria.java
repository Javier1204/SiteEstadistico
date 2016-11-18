/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asesorias.DTO;

/**
 *
 * @author DiegoLeal
 */
public class Asesoria {
    
    public String fecha;
    public String cod_est;
    public String cod_docente;
    public String cod_m;
    public String grupo;
    public String tema;
    public String hora;

    public Asesoria() {
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCod_est() {
        return cod_est;
    }

    public void setCod_est(String cod_est) {
        this.cod_est = cod_est;
    }

    public String getCod_docente() {
        return cod_docente;
    }

    public void setCod_docente(String cod_docente) {
        this.cod_docente = cod_docente;
    }

    public String getCod_m() {
        return cod_m;
    }

    public void setCod_m(String cod_m) {
        this.cod_m = cod_m;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    @Override
    public String toString() {
        return "Asesoria{" + "fecha=" + fecha + ", cod_est=" + cod_est + ", cod_docente=" + cod_docente + ", cod_m=" + cod_m + ", grupo=" + grupo + ", tema=" + tema + ", hora=" + hora + '}';
    }
}
