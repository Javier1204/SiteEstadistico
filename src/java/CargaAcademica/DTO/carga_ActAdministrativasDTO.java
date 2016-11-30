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
public class carga_ActAdministrativasDTO {
    
    String cargo;
    String actividad;
    int horas_cargo;
    int horas_act;

    public carga_ActAdministrativasDTO(){
    }
    
    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getActividad() {
        return actividad;
    }

    public void setActividad(String actividad) {
        this.actividad = actividad;
    }

    public int getHoras_cargo() {
        return horas_cargo;
    }

    public void setHoras_cargo(int horas_cargo) {
        this.horas_cargo = horas_cargo;
    }

    public int getHoras_act() {
        return horas_act;
    }

    public void setHoras_act(int horas_act) {
        this.horas_act = horas_act;
    }

    @Override
    public String toString() {
        return "carga_ActAdministrativasDTO{" + "cargo=" + cargo + ", actividad=" + actividad + ", horas_cargo=" + horas_cargo + ", horas_act=" + horas_act + '}';
    }
    
    
}
