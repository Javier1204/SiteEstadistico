/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DTO;

/**
 *
 * @author Administrador
 */
public class tutor_empresaDTO {
    
    int idtutor;
    String nombreTutor;
    String telefono;
    String cargo;
    String email;
    int id_empresa;

    public int getId_empresa() {
        return id_empresa;
    }

    public void setId_empresa(int id_empresa) {
        this.id_empresa = id_empresa;
    }
    
    public tutor_empresaDTO() {
    }

    public tutor_empresaDTO(String nombreTutor, String telefono, String cargo, String email, int id_empresa) {
        this.nombreTutor = nombreTutor;
        this.telefono = telefono;
        this.cargo = cargo;
        this.email = email;
        this.id_empresa=id_empresa;
    }

    public int getIdtutor() {
        return idtutor;
    }

    public void setIdtutor(int idtutor) {
        this.idtutor = idtutor;
    }

    public String getNombreTutor() {
        return nombreTutor;
    }

    public void setNombreTutor(String nombreTutor) {
        this.nombreTutor = nombreTutor;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "tutor_empresaDTO{" + "idtutor=" + idtutor + ", nombreTutor=" + nombreTutor + ", telefono=" + telefono + ", cargo=" + cargo + ", email=" + email + ", id_empresa=" + id_empresa + '}';
    }
    
   
    
}
