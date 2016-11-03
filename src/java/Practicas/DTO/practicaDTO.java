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
public class practicaDTO {
    int idpractica;
    int añopractica;
    String semestre;
    String urlCartaSolicitud;
    int idconvenio;
    String urlCartaCumplido;
    String urlCartaAceptacion;
    String estado;
    int idEmpresa;
    String idestudiante;
    int idperfil;
    String urlConvenio;

    public practicaDTO(int añopractica, String semestre, int idconvenio, String estado, int idperfil) {
        this.añopractica = añopractica;
        this.semestre = semestre;
        this.idconvenio = idconvenio;
        this.estado = estado;
        this.idperfil = idperfil;
    }

    public practicaDTO() {
    }

    
    public int getIdpractica() {
        return idpractica;
    }

    public void setIdpractica(int idpractica) {
        this.idpractica = idpractica;
    }

    public int getAñopractica() {
        return añopractica;
    }

    public void setAñopractica(int añopractica) {
        this.añopractica = añopractica;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

    public String getUrlCartaSolicitud() {
        return urlCartaSolicitud;
    }

    public void setUrlCartaSolicitud(String urlCartaSolicitud) {
        this.urlCartaSolicitud = urlCartaSolicitud;
    }

    public int getIdconvenio() {
        return idconvenio;
    }

    public void setIdconvenio(int idconvenio) {
        this.idconvenio = idconvenio;
    }

    public String getUrlCartaCumplido() {
        return urlCartaCumplido;
    }

    public void setUrlCartaCumplido(String urlCartaCumplido) {
        this.urlCartaCumplido = urlCartaCumplido;
    }

    public String getUrlCartaAceptacion() {
        return urlCartaAceptacion;
    }

    public void setUrlCartaAceptacion(String urlCartaAceptacion) {
        this.urlCartaAceptacion = urlCartaAceptacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getIdestudiante() {
        return idestudiante;
    }

    public void setIdestudiante(String idestudiante) {
        this.idestudiante = idestudiante;
    }

    public int getIdperfil() {
        return idperfil;
    }

    public void setIdperfil(int idperfil) {
        this.idperfil = idperfil;
    }

    public String getUrlConvenio() {
        return urlConvenio;
    }

    public void setUrlConvenio(String urlConvenio) {
        this.urlConvenio = urlConvenio;
    }
    
    
}
