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
public class carga_investigacionDTO {
    
    int cod_acta;
    String nombre;
    String responsabilidad;
    String unidad_investigativa;
    String institucion;
    int horas_semana;

    public carga_investigacionDTO(){}
    
    public int getCod_acta() {
        return cod_acta;
    }

    public void setCod_acta(int cod_acta) {
        this.cod_acta = cod_acta;
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

    public String getUnidad_investigativa() {
        return unidad_investigativa;
    }

    public void setUnidad_investigativa(String unidad_investigativa) {
        this.unidad_investigativa = unidad_investigativa;
    }

    public String getInstitucion() {
        return institucion;
    }

    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }

    public int getHoras_semana() {
        return horas_semana;
    }

    public void setHoras_semana(int horas_semana) {
        this.horas_semana = horas_semana;
    }
    
    
    
}
