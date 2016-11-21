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
    String fechainicio;
    String fechafin;
    int idempresa;
    String descripcion; 
    String vigencia;
    String estado;

    public convenioDTO() {
    }

//    public convenioDTO(String nombreConvenio,String descripcion, String fechainicio, String fechafin,String vigencia,String estado, int idempresa) {
//        
//    }

    public convenioDTO(String nombreConvenio, String descripcion, String fechainicio, String fechafin, String vigencia, String estado, int idempresa) {
        this.nombreConvenio = nombreConvenio;
        this.fechainicio = fechainicio;
        this.fechafin = fechafin;
        this.idempresa = idempresa;
        this.descripcion = descripcion;
        this.vigencia = vigencia;
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

    public String getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio (String fechainicio) {
        this.fechainicio = fechainicio;
    }

    public String getFechafin() {
        return fechafin;
    }

    public void setFechafin(String fechafin) {
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

    public String getVigencia() {
        return vigencia;
    }

    public void setVigencia(String vigencia) {
        this.vigencia = vigencia;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }


    
    
    
}
