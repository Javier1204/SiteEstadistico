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
public class Encuentro_DeportivoDTO {
    private int id_encuentro;
  private Fecha_DeportivaDTO fecha;
    private Disciplina_DeportivaDTO disciplina;
    private EquipoDTO equipo_local;
    private EquipoDTO equipo_visitante;
    private String hora;
    private int marcador_local;
    private int marcador_visitante;
    private int jugado;
    private ArbitroDTO arbitro;
    
    

    public Fecha_DeportivaDTO getFecha() {
        return fecha;
    }

    public void setFecha(Fecha_DeportivaDTO fecha) {
        this.fecha = fecha;
    }

    public Disciplina_DeportivaDTO getDisciplina() {
        return disciplina;
    }

    public void setDisciplina(Disciplina_DeportivaDTO disciplina) {
        this.disciplina = disciplina;
    }

    public EquipoDTO getEquipo_local() {
        return equipo_local;
    }

    public void setEquipo_local(EquipoDTO equipo_local) {
        this.equipo_local = equipo_local;
    }

    public EquipoDTO getEquipo_visitante() {
        return equipo_visitante;
    }

    public void setEquipo_visitante(EquipoDTO equipo_visitante) {
        this.equipo_visitante = equipo_visitante;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public int getMarcador_local() {
        return marcador_local;
    }

    public void setMarcador_local(int marcador_local) {
        this.marcador_local = marcador_local;
    }

    public int getMarcador_visitante() {
        return marcador_visitante;
    }

    public void setMarcador_visitante(int marcador_visitante) {
        this.marcador_visitante = marcador_visitante;
    }

    public int getJugado() {
        return jugado;
    }

    public void setJugado(int jugado) {
        this.jugado = jugado;
    }

    public ArbitroDTO getArbitro() {
        return arbitro;
    }

    public void setArbitro(ArbitroDTO arbitro) {
        this.arbitro = arbitro;
    }

    public int getId_encuentro() {
        return id_encuentro;
    }

    public void setId_encuentro(int id_encuentro) {
        this.id_encuentro = id_encuentro;
    }
    
    
}
