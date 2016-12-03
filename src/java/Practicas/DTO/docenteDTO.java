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
public class docenteDTO {
 
    String codigo;
    String cedulaDocente;
    String nombreDocente;
    String apellidosDocente;
  
    Date fechaNacimiento;
    String celular;
    String emailPersonal;
    String nivelEstudio;
    String tituloPregrado;
    String emailInstitucional;
    String tipoVinculacion;
    byte añosExperiencia;
    String direccion;

    public docenteDTO() {
    }

    public docenteDTO(String codigo, String cedulaDocente, String nombreDocente, String apellidosDocente, Date fechaNacimiento, String nivelEstudio, String tipoVinculacion) {
        this.codigo = codigo;
        this.cedulaDocente = cedulaDocente;
        this.nombreDocente = nombreDocente;
        this.apellidosDocente = apellidosDocente;
        this.fechaNacimiento = fechaNacimiento;
        this.nivelEstudio = nivelEstudio;
        this.tipoVinculacion = tipoVinculacion;
    }

    
    public String get_Codigo() {
        return codigo;
    }

    public void set_Codigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCedulaDocente() {
        return cedulaDocente;
    }

    public void setCedulaDocente(String cedulaDocente) {
        this.cedulaDocente = cedulaDocente;
    }

    public String getNombreDocente() {
        return nombreDocente;
    }

    public void setNombreDocente(String nombreDocente) {
        this.nombreDocente = nombreDocente;
    }

    public String getApellidosDocente() {
        return apellidosDocente;
    }

    public void setApellidosDocente(String apellidosDocente) {
        this.apellidosDocente = apellidosDocente;
    }

    

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getEmail() {
        return emailPersonal;
    }

    public void setEmail(String email) {
        this.emailPersonal = email;
    }

    public String getNivelEstudio() {
        return nivelEstudio;
    }

    public void setNivelEstudio(String nivelEstudio) {
        this.nivelEstudio = nivelEstudio;
    }

    public String getTituloPregrado() {
        return tituloPregrado;
    }

    public void setTituloPregrado(String tituloPregrado) {
        this.tituloPregrado = tituloPregrado;
    }

    public String getEmail2() {
        return emailInstitucional;
    }

    public void setEmail2(String email2) {
        this.emailInstitucional = email2;
    }

    public String getTipoVinculacion() {
        return tipoVinculacion;
    }

    public void setTipoVinculacion(String tipoVinculacion) {
        this.tipoVinculacion = tipoVinculacion;
    }

    public byte getAñosExperiencia() {
        return añosExperiencia;
    }

    public void setAñosExperiencia(byte añosExperiencia) {
        this.añosExperiencia = añosExperiencia;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Override
    public String toString() {
        return "docenteDTO{" + "codigo=" + codigo + ", cedulaDocente=" + cedulaDocente + ", nombreDocente=" + nombreDocente + ", apellidosDocente=" + apellidosDocente + ", fechaNacimiento=" + fechaNacimiento + ", celular=" + celular + ", emailPersonal=" + emailPersonal + ", nivelEstudio=" + nivelEstudio + ", tituloPregrado=" + tituloPregrado + ", emailInstitucional=" + emailInstitucional + ", tipoVinculacion=" + tipoVinculacion + ", a\u00f1osExperiencia=" + añosExperiencia + ", direccion=" + direccion + '}';
    }

    
    
   
}
