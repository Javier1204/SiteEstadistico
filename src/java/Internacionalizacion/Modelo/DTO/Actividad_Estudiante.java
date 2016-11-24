/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Modelo.DTO;

/**
 *
 * @author JAVIER
 */
public class Actividad_Estudiante {
    
    String codigoestudiante;
    int idactividad;

    public Actividad_Estudiante() {
    }

    public String getCodigoestudiante() {
        return codigoestudiante;
    }

    public void setCodigoestudiante(String codigoestudiante) {
        this.codigoestudiante = codigoestudiante;
    }

    public int getIdactividad() {
        return idactividad;
    }

    public void setIdactividad(int idactividad) {
        this.idactividad = idactividad;
    }

    public Actividad_Estudiante(String codigoestudiante, int idactividad) {
        this.codigoestudiante = codigoestudiante;
        this.idactividad = idactividad;
    }    
    
    
}
