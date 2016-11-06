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
public class informeDTO {
    
    int idinforme;
    Date fechaEnvio;
    String tipo;
    String urlDireccion;

    public informeDTO() {
    }

    public informeDTO(Date fechaEnvio, String tipo, String urlDireccion) {
        this.fechaEnvio = fechaEnvio;
        this.tipo = tipo;
        this.urlDireccion = urlDireccion;
    }

    
    public int getIdinforme() {
        return idinforme;
    }

    public void setIdinforme(int idinforme) {
        this.idinforme = idinforme;
    }

    public Date getFechaEnvio() {
        return fechaEnvio;
    }

    public void setFechaEnvio(Date fechaEnvio) {
        this.fechaEnvio = fechaEnvio;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getUrlDireccion() {
        return urlDireccion;
    }

    public void setUrlDireccion(String urlDireccion) {
        this.urlDireccion = urlDireccion;
    }
    
    
}
