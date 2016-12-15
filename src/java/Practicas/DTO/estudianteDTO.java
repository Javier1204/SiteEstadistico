package Practicas.DTO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrador
 */
public class estudianteDTO {
    
    String codigoEstudiante;
    String cedula;
    String direccion;
    String telefono;
    String email;
    String fechaNacimiento;
    String nombresEstudiante;
    String apellidosEstudiante;
    int semestre;
    String correo;

    public estudianteDTO() {
    }

    public estudianteDTO(String codigoEstudiante, String cedula, String nombresEstudiante, String apellidosEstudiante,int semestre) {
        this.codigoEstudiante = codigoEstudiante;
        this.cedula = cedula;
        this.nombresEstudiante = nombresEstudiante;
        this.apellidosEstudiante = apellidosEstudiante;
        this.semestre=semestre;
    }

    
    public String getCodigoEstudiante() {
        return codigoEstudiante;
    }

    public void setCodigoEstudiante(String codigoEstudiante) {
        this.codigoEstudiante = codigoEstudiante;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombresEstudiante() {
        return nombresEstudiante;
    }

    public void setNombresEstudiante(String nombresEstudiante) {
        this.nombresEstudiante = nombresEstudiante;
    }

    public String getApellidosEstudiante() {
        return apellidosEstudiante;
    }

    public void setApellidosEstudiante(String apellidosEstudiante) {
        this.apellidosEstudiante = apellidosEstudiante;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    

    @Override
    public String toString() {
        return "estudianteDTO{" + "codigoEstudiante=" + codigoEstudiante + ", cedula=" + cedula + ", nombresEstudiante=" + nombresEstudiante + ", apellidosEstudiante=" + apellidosEstudiante + ", semestre=" + semestre + '}';
    }
   
    
}
