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
 
    String idconvenio;
    String nombreConvenio;
    String fechainicio;
    String fechafin;
    int idempresa;
    String descripcion; 
    String vigencia;
    String estado;
    String fecha_radicacion;
    empresaDTO empresa;
    String tipoConvenio;

    public convenioDTO(String id, String nombreConvenio, String descripcion, String fecha_radicacion, String fechainicio, String fechafin, String vigencia, String estado, int idempresa, String tipoConvenio) {
        this.idconvenio=idconvenio;
        this.nombreConvenio = nombreConvenio;
        this.fechainicio = fechainicio;
        this.fechafin = fechafin;
        this.idempresa = idempresa;
        this.descripcion = descripcion;
        this.vigencia = vigencia;
        this.estado = estado;
        this.fecha_radicacion=fecha_radicacion;
        this.tipoConvenio=tipoConvenio;
    }

    public String getTipoConvenio() {
        return tipoConvenio;
    }

    public void setTipoConvenio(String tipoConvenio) {
        this.tipoConvenio = tipoConvenio;
    }

    public String getFecha_radicacion() {
        return fecha_radicacion;
    }

    public void setFecha_radicacion(String fecha_radicacion) {
        this.fecha_radicacion = fecha_radicacion;
    }
        public convenioDTO() {
    }

    
    public String getIdconvenio() {
        return idconvenio;
    }
    

    public void setIdconvenio(String idconvenio) {
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

    @Override
    public String toString() {
        return "convenioDTO{" + "idconvenio=" + idconvenio + ", nombreConvenio=" + nombreConvenio + ", fechainicio=" + fechainicio + ", fechafin=" + fechafin + ", idempresa=" + idempresa + ", descripcion=" + descripcion + ", vigencia=" + vigencia + ", estado=" + estado + ", fecha_radicacion=" + fecha_radicacion + '}';
    }
 
 public void setEmpresa(int id_empresa, String nombreEmpresa){
     
     empresa=new empresaDTO();
     empresa.setIdempresa(idempresa);
     empresa.setNombreEmpresa(nombreEmpresa);
 }
    
    public empresaDTO getEmpresa(){
     return empresa;
 }
}
