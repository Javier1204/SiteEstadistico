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
public class Docente {    
    
    String codigo;
    String cedula;
    String nombres;
    String apellidos;
    boolean habilitado;
    
    public Docente(){
        
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
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

    public boolean isHabilitado() {
        return habilitado;
    }

    public void setHabilitado(boolean habilitado) {
        this.habilitado = habilitado;
    }
    
    @Override
    public String toString() {
        return "Docente{" + "codigo=" + codigo + ", cedula=" + cedula + ", nombres=" + nombres + ", apellidos=" + apellidos + ", habilitado=" + habilitado + '}';
    }

    public Docente(String codigo, String cedula, String nombres, String apellidos, boolean habilitado) {
        this.codigo = codigo;
        this.cedula = cedula;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.habilitado = habilitado;
 
    }     
}
