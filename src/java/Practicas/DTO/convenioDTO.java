/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DTO;

import java.sql.Date;

/**
 *
 * @author Administrador
 */
public class convenioDTO {
 
    int idconvenio;
    String nombreConvenio;
    Date fechainicio;
    Date fechafin;
    int idempresa;
    String descripcion; 
    byte vigencia;
    String estado;

    public convenioDTO() {
    }

    public convenioDTO(String nombreConvenio, Date fechainicio, Date fechafin, String estado) {
        this.nombreConvenio = nombreConvenio;
        this.fechainicio = fechainicio;
        this.fechafin = fechafin;
        this.estado = estado;
    }
    
    

    public int getIdconvenio() {
        return idconvenio;
    }

    public void setIdconvenio(int idconvenio) {
        this.idconvenio = idconvenio;
    }

    public String getNombreConvenio() {
        return nombreConvenio;
    }

    public void setNombreConvenio(String nombreConvenio) {
        this.nombreConvenio = nombreConvenio;
    }

    public Date getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio(Date fechainicio) {
        this.fechainicio = fechainicio;
    }

    public Date getFechafin() {
        return fechafin;
    }

    public void setFechafin(Date fechafin) {
        this.fechafin = fechafin;
    }

    public int getIdempresa() {
        return idempresa;
    }

    public void setIdempresa(int idempresa) {
        this.idempresa = idempresa;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public byte getVigencia() {
        return vigencia;
    }

    public void setVigencia(byte vigencia) {
        this.vigencia = vigencia;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
