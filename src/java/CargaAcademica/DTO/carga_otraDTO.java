/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CargaAcademica.DTO;

/**
 *
 * @author Edna helen
 */
public class carga_otraDTO {
    
   
    String nombre;
    int horas;
    

    public carga_otraDTO(){}

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getHoras() {
        return horas;
    }

    public void setHoras(int horas) {
        this.horas = horas;
    }

    @Override
    public String toString() {
        return "carga_otraDTO{" + "nombre=" + nombre + ", horas=" + horas + '}';
    }
    
    
    
}
