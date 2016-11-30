/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CargaAcademica.DTO;

/**
 *
 * @author jesus
 */
public class carga_extensionDTO {
    
    
    String nombre;
    String responsabilidad;
    String unidad;
    String programa;
    int horas_ejecu;
    int horas_progra;
    String descripcion; 

    public carga_extensionDTO() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getResponsabilidad() {
        return responsabilidad;
    }

    public void setResponsabilidad(String responsabilidad) {
        this.responsabilidad = responsabilidad;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public String getPrograma() {
        return programa;
    }

    public void setPrograma(String programa) {
        this.programa = programa;
    }

    public int getHoras_ejecu() {
        return horas_ejecu;
    }

    public void setHoras_ejecu(int horas_ejecu) {
        this.horas_ejecu = horas_ejecu;
    }

    public int getHoras_progra() {
        return horas_progra;
    }

    public void setHoras_progra(int horas_progra) {
        this.horas_progra = horas_progra;
    }
    
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
