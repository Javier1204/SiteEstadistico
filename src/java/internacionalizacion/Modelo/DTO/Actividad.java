/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Modelo.DTO;

import java.util.Date;

/**
 *
 * @author JAVIER
 */
public class Actividad {
        
    int id;
    int idconvenio;
    String nombre;
    String duracion;
    Date fechacreacion;
    Date fechaterminacion;
    short semestre;
    int tipoactividad;
    String hora;
    String responsable;
    String lugar;
    String descripcion;
    
    public Actividad(){
        
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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public Date getFechacreacion() {
        return fechacreacion;
    }

    public void setFechacreacion(Date fechacreacion) {
        this.fechacreacion = fechacreacion;
    }

    public Date getFechaterminacion() {
        return fechaterminacion;
    }

    public void setFechaterminacion(Date fechaterminacion) {
        this.fechaterminacion = fechaterminacion;
    }

    public short getSemestre() {
        return semestre;
    }

    public void setSemestre(short semestre) {
        this.semestre = semestre;
    }

    public int getTipoactividad() {
        return tipoactividad;
    }

    public void setTipoactividad(int tipoactividad) {
        this.tipoactividad = tipoactividad;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getResponsable() {
        return responsable;
    }

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
        
    public Actividad(int id, int idconvenio, String nombre, String duracion, Date fechacreacion, Date fechaterminacion, short semestre, int tipoactividad, String hora, String responsable, String lugar, String descripcion) {
        this.id = id;
        this.idconvenio = idconvenio;
        this.nombre = nombre;
        this.duracion = duracion;
        this.fechacreacion = fechacreacion;
        this.fechaterminacion = fechaterminacion;
        this.semestre = semestre;
        this.tipoactividad = tipoactividad;
        this.hora = hora;
        this.responsable = responsable;
        this.lugar = lugar;
        this.descripcion = descripcion;
    }
    
}
