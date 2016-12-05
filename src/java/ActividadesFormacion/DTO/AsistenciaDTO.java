/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ActividadesFormacion.DTO;

/**
 *
 * @author WILSON
 */
public class AsistenciaDTO {
    
    int codigoActividad;
    int id_asi;
    int codigoEstudiante;

    public AsistenciaDTO() {
    }

    public AsistenciaDTO(int codigoActividad, int codigoEstudiante) {
        this.codigoActividad = codigoActividad;
        this.codigoEstudiante = codigoEstudiante;
    }

    public int getId_asi() {
        return id_asi;
    }

    public void setId_asi(int id_asi) {
        this.id_asi = id_asi;
    }

    public int getCodigoActividad() {
        return codigoActividad;
    }

    public void setCodigoActividad(int codigoActividad) {
        this.codigoActividad = codigoActividad;
    }

    public int getCodigoEstudiante() {
        return codigoEstudiante;
    }

    public void setCodigoEstudiante(int codigoEstudiante) {
        this.codigoEstudiante = codigoEstudiante;
    }

    @Override
    public String toString() {
        return "AsistenciaDTO{" + "codigoActividad=" + codigoActividad + ", codigoEstudiante=" + codigoEstudiante + '}';
    }
    
    
    
    
}
