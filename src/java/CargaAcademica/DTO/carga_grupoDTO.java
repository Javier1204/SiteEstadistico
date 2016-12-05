/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package CargaAcademica.DTO;

/**
 *
 * @author estudiante
 */
public class carga_grupoDTO {
    
    String cod_asignatura;
    String grupo;
    int num_estu;
    int horas_teo;
    int horas_teoprac;
    int horas_prac;
    
    public carga_grupoDTO(){}

    
    public String getCod_asignatura() {
        return cod_asignatura;
    }

    public void setCod_asignatura(String cod_asignatura) {
        this.cod_asignatura = cod_asignatura;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public int getNum_estu() {
        return num_estu;
    }

    public void setNum_estu(int num_estu) {
        this.num_estu = num_estu;
    }

    public int getHoras_teo() {
        return horas_teo;
    }

    public void setHoras_teo(int horas_teo) {
        this.horas_teo = horas_teo;
    }

    public int getHoras_teoprac() {
        return horas_teoprac;
    }

    public void setHoras_teoprac(int horas_teoprac) {
        this.horas_teoprac = horas_teoprac;
    }

    public int getHoras_prac() {
        return horas_prac;
    }

    public void setHoras_prac(int horas_prac) {
        this.horas_prac = horas_prac;
    }
    
    
    
}
