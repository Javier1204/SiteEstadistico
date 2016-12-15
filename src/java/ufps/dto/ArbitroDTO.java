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
public class ArbitroDTO {

    private int documento;
    private String nombre_arbitro;
    private Disciplina_DeportivaDTO disciplina_deportiva;

    public int getDocumento() {
        return documento;
    }

    public void setDocumento(int documento) {
        this.documento = documento;
    }

    public String getNombre_arbitro() {
        return nombre_arbitro;
    }

    public void setNombre_arbitro(String nombre_arbitro) {
        this.nombre_arbitro = nombre_arbitro;
    }

    public Disciplina_DeportivaDTO getDisciplina_deportiva() {
        return disciplina_deportiva;
    }

    public void setDisciplina_deportiva(Disciplina_DeportivaDTO disciplina_deportiva) {
        this.disciplina_deportiva = disciplina_deportiva;
    }

}
