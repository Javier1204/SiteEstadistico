/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gruposinvestigacion.model.dto;

import java.io.Serializable;

/**
 *
 * @author Administrator
 */
public class Admin implements Serializable{
    
    private String user;
    private String contrasena;

    public Admin() {
    }

    public Admin(String user, String contrasena) {
        this.user = user;
        this.contrasena = contrasena;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    @Override
    public String toString() {
        return "Admin{" + "user=" + user + ", contrasena=" + contrasena + '}';
    }

}
