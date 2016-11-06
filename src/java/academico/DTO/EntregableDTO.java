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
public class EntregableDTO {
    
    private int entregable_id, proyecto_id, tipo_id;
    private String entregable_titulo, fecha_entrega;

    public EntregableDTO() {
    }

    public int getEntregable_id() {
        return entregable_id;
    }

    public void setEntregable_id(int entregable_id) {
        this.entregable_id = entregable_id;
    }

    public int getProyecto_id() {
        return proyecto_id;
    }

    public void setProyecto_id(int proyecto_id) {
        this.proyecto_id = proyecto_id;
    }

    public int getTipo_id() {
        return tipo_id;
    }

    public void setTipo_id(int tipo_id) {
        this.tipo_id = tipo_id;
    }

    public String getEntregable_titulo() {
        return entregable_titulo;
    }

    public void setEntregable_titulo(String entregable_titulo) {
        this.entregable_titulo = entregable_titulo;
    }

    public String getFecha_entrega() {
        return fecha_entrega;
    }

    public void setFecha_entrega(String fecha_entrega) {
        this.fecha_entrega = fecha_entrega;
    }
    
    
}
