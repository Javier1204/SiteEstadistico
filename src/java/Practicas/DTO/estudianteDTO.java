package practicas.DTO;

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
    String nombresEstudiante;
    String apellidosEstudiante;
    int semestre;

    public estudianteDTO() {
    }

    public estudianteDTO(String codigoEstudiante, String cedula, String nombresEstudiante, String apellidosEstudiante) {
        this.codigoEstudiante = codigoEstudiante;
        this.cedula = cedula;
        this.nombresEstudiante = nombresEstudiante;
        this.apellidosEstudiante = apellidosEstudiante;
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
   
    
}
