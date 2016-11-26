/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DTO;

/**
 *
 * @author JAVIER
 */
public class Estudiante {
    
    String codigo;
    String documento;
    String nombres;
    String apellidos;
    int semestre;
    String investigacion_codigocolciencias;
    String programaacademico;
    boolean activo;
    
    public Estudiante(){
        
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    public String getInvestigacion_codigocolciencias() {
        return investigacion_codigocolciencias;
    }

    public void setInvestigacion_codigocolciencias(String investigacion_codigocolciencias) {
        this.investigacion_codigocolciencias = investigacion_codigocolciencias;
    }

    public String getProgramaacademico() {
        return programaacademico;
    }

    public void setProgramaacademico(String programaacademico) {
        this.programaacademico = programaacademico;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public Estudiante(String codigo, String documento, String nombres, String apellidos, int semestre, String investigacion_codigocolciencias, String programaacademico, boolean activo) {
        this.codigo = codigo;
        this.documento = documento;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.semestre = semestre;
        this.investigacion_codigocolciencias = investigacion_codigocolciencias;
        this.programaacademico = programaacademico;
        this.activo = activo;
    }        
}
