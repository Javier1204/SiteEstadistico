/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DTO;

/**
 *
 * @author Administrador
 */
public class perfil_estudianteDTO {
    
    int codigoestudiante;
    int idperfil;
    int valor;
    boolean estado;

    public perfil_estudianteDTO() {
    }

    public perfil_estudianteDTO(int codigoestudiante, int idperfil, int valor,  boolean estado) {
        this.codigoestudiante = codigoestudiante;
        this.idperfil = idperfil;
        this.valor = valor;
        this.estado = estado;
    }

    public int getCodigoestudiante() {
        return codigoestudiante;
    }

    public void setCodigoestudiante(int codigoestudiante) {
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

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
     
    
}
