/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package integrador.DTO;

/**
 *
 * @author carlos
 */
public class InformeDTO {
    
    private int Id_informe;
    private String Nombre;
    private String Url_informe;
    private String Modulo;
    private int Semestre;
    private int Ano;
    private String Descripcion;

    public int getId_informe() {
        return Id_informe;
    }

    public void setId_informe(int Id_informe) {
        this.Id_informe = Id_informe;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getUrl_informe() {
        return Url_informe;
    }

    public void setUrl_informe(String Url_informe) {
        this.Url_informe = Url_informe;
    }

    public String getModulo() {
        return Modulo;
    }

    public void setModulo(String Modulo) {
        this.Modulo = Modulo;
    }

    public int getSemestre() {
        return Semestre;
    }

    public void setSemestre(int Semestre) {
        this.Semestre = Semestre;
    }

    public int getAno() {
        return Ano;
    }

    public void setAno(int Ano) {
        this.Ano = Ano;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

 
    

   
}
