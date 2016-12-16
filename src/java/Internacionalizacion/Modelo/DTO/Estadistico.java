/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Modelo.DTO;

/**
 *
 * @author JAVIER
 */
public class Estadistico {
    
    String columna;
    int valor;

    public String getColumna() {
        return columna;
    }

    public void setColumna(String columna) {
        this.columna = columna;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
    

    public Estadistico(String columna, int valor) {
        this.columna = columna;
        this.valor = valor;
    }
    
    @Override
    public String toString(){
        return this.columna + "-"+ this.valor;
    }
    
}
