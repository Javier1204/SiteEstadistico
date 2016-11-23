/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Integrador.DTO;

import java.sql.Date;

/**
 *
 * @author carlos
 */
public class PublicacionDTO {
    
    private int id;
    private String titulo;
    private String contenido;
   private InformeDTO informe;
   private Date fecha;

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

   
   
   
   
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public InformeDTO getInforme() {
        return informe;
    }

    public void setInforme(InformeDTO informe) {
        this.informe = informe;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

   
    
    
    
}
