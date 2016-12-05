/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufps.dto;

/**
 *
 * @author jeffersson sinza
 */
public class CapitanDTO {

    private int codigo_capitan;
    private String correo_electronico;
    private String nombre_capitan;
    private String contrasena;

    public int getCodigo_capitan() {
        return codigo_capitan;
    }

    public void setCodigo_capitan(int codigo_capitan) {
        this.codigo_capitan = codigo_capitan;
    }

    public String getCorreo_electronico() {
        return correo_electronico;
    }

    public void setCorreo_electronico(String correo_electronico) {
        this.correo_electronico = correo_electronico;
    }

    public String getNombre_capitan() {
        return nombre_capitan;
    }

    public void setNombre_capitan(String nombre_capitan) {
        this.nombre_capitan = nombre_capitan;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

 
}
