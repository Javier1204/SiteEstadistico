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
public class documentos_estudiantes_DTO {
    
    String codigoEstudiante;
    String urlCedula;
    String urlEPS;
    String urlHorario;
    String urlHV;
    boolean cedula;
    boolean eps;
    boolean horario;
    boolean hv;
    int iddocumentos;

    public documentos_estudiantes_DTO() {
    }

    public documentos_estudiantes_DTO(String codigoEstudiante) {
        this.codigoEstudiante = codigoEstudiante;
    }

    
    public String getCodigoEstudiante() {
        return codigoEstudiante;
    }

    public void setCodigoEstudiante(String codigoEstudiante) {
        this.codigoEstudiante = codigoEstudiante;
    }

    public String getUrlCedula() {
        return urlCedula;
    }

    public void setUrlCedula(String urlCedula) {
        this.urlCedula = urlCedula;
    }

    public String getUrlEPS() {
        return urlEPS;
    }

    public void setUrlEPS(String urlEPS) {
        this.urlEPS = urlEPS;
    }

    public String getUrlHorario() {
        return urlHorario;
    }

    public void setUrlHorario(String urlHorario) {
        this.urlHorario = urlHorario;
    }

    public String getUrlHV() {
        return urlHV;
    }

    public void setUrlHV(String urlHV) {
        this.urlHV = urlHV;
    }

    public boolean isCedula() {
        return cedula;
    }

    public void setCedula(boolean cedula) {
        this.cedula = cedula;
    }

    public boolean isEps() {
        return eps;
    }

    public void setEps(boolean eps) {
        this.eps = eps;
    }

    public boolean isHorario() {
        return horario;
    }

    public void setHorario(boolean horario) {
        this.horario = horario;
    }

    public boolean isHv() {
        return hv;
    }

    public void setHv(boolean hv) {
        this.hv = hv;
    }

    public int getIddocumentos() {
        return iddocumentos;
    }

    public void setIddocumentos(int iddocumentos) {
        this.iddocumentos = iddocumentos;
    }
    
    
    
    
}
