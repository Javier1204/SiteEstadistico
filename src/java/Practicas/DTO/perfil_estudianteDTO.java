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
public class perfil_estudianteDTO {
    
    String codigoestudiante;
    int idperfil;
    int valor;
    Date fecha;

    public perfil_estudianteDTO() {
    }

    public perfil_estudianteDTO(String codigoestudiante, int idperfil, int valor, Date fecha) {
        this.codigoestudiante = codigoestudiante;
        this.idperfil = idperfil;
        this.valor = valor;
        this.fecha = fecha;
    }
    

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getCodigoestudiante() {
        return codigoestudiante;
    }

    public void setCodigoestudiante(String codigoestudiante) {
        this.codigoestudiante = codigoestudiante;
    }

    public int getIdperfil() {
        return idperfil;
    }

    public void setIdperfil(int idperfil) {
        this.idperfil = idperfil;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
    
    
}
