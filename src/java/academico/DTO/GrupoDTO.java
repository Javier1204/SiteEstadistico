/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package academico.DTO;

/**
 *
 * @author Mauricio
 */
public class GrupoDTO {
    
    private String nombre, cod_asign;
    private int cod_grupo;

    public GrupoDTO() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCod_asign() {
        return cod_asign;
    }

    public void setCod_asign(String cod_asign) {
        this.cod_asign = cod_asign;
    }

    public int getCod_grupo() {
        return cod_grupo;
    }

    public void setCod_grupo(int cod_grupo) {
        this.cod_grupo = cod_grupo;
    }
    
    
}
