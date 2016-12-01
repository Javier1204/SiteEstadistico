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
public class Convenio {
    
    String id;
    String nombre;
    String descripcion;
    String fecharadicacion;
    String fechainicio;
    String fechaterminacion;
    String vigencia;   
    String estado;    
    String tipoconvenio;
    int entidad;
    String urlimagen;
    
    
    public Convenio() {
    }

    public Convenio(String radicado, String nombre, String descripcion, String fecharadicacion, String fechainicio, String fechaterminacion, String vigencia, String estado, String tipo, int entidad) {
        //this.id = id;
        this.id = radicado;
        this.nombre = nombre;
        this.fechainicio = fechainicio;
        this.fechaterminacion = fechaterminacion;
        this.fecharadicacion = fecharadicacion;
        this.descripcion = descripcion;
        this.estado = estado;
        this.vigencia = vigencia;
        this.tipoconvenio = tipo;
        this.entidad = entidad;
        //this.urlimagen = urlimagen;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio(String fechainicio) {
        this.fechainicio = fechainicio;
    }

    public String getFechaterminacion() {
        return fechaterminacion;
    }

    public void setFechaterminacion(String fechaterminacion) {
        this.fechaterminacion = fechaterminacion;
    }

    public String getFecharadicacion() {
        return fecharadicacion;
    }

    public void setFecharadicacion(String fecharadicacion) {
        this.fecharadicacion = fecharadicacion;
    }
    
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getVigencia() {
        return vigencia;
    }

    public void setVigencia(String vigencia) {
        this.vigencia = vigencia;
    }

    public String getTipoconvenio() {
        return tipoconvenio;
    }

    public void setTipoconvenio(String tipoconvenio) {
        this.tipoconvenio = tipoconvenio;
    }

    public int getEntidad() {
        return entidad;
    }

    public void setEntidad(int entidad) {
        this.entidad = entidad;
    }

    public String getUrlimagen() {
        return urlimagen;
    }

    public void setUrlimagen(String urlimagen) {
        this.urlimagen = urlimagen;
    }
    
   
    
    
}
