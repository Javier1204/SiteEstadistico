/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DTO;

import java.util.Date;

/**
 *
 * @author JAVIER
 */
public class Actividad {
        
    int id;
    String idconvenio;
    String nombre;
    String duracion;
    String fechacreacion;
    String fechaterminacion;
    short semestre;
    String tipoactividad;
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

    public String getIdconvenio() {
        return idconvenio;
    }

    public void setIdconvenio(String idconvenio) {
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

    public String getFechacreacion() {
        return fechacreacion;
    }

    public void setFechacreacion(String fechacreacion) {
        this.fechacreacion = fechacreacion;
    }

    public String getFechaterminacion() {
        return fechaterminacion;
    }

    public void setFechaterminacion(String fechaterminacion) {
        this.fechaterminacion = fechaterminacion;
    }

    public short getSemestre() {
        return semestre;
    }

    public void setSemestre(short semestre) {
        this.semestre = semestre;
    }

    public String getTipoactividad() {
        return tipoactividad;
    }

    public void setTipoactividad(String tipoactividad) {
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
        
    public Actividad(int id, String idconvenio, String nombre, String duracion, String fechacreacion, String fechaterminacion, short semestre, String tipoactividad, String hora, String responsable, String lugar, String descripcion) {
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
