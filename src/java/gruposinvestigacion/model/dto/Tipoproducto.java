package gruposinvestigacion.model.dto;

import java.util.Objects;

public class Tipoproducto  implements java.io.Serializable {


     private Integer codigo;
     private String descripcion;

    public Tipoproducto() {
    }

    public Tipoproducto(Integer codigo, String descripcion) {
        this.codigo = codigo;
        this.descripcion = descripcion;
    }

    public Tipoproducto(String descripcion) {
       this.descripcion = descripcion;
    }

    public Integer getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Tipoproducto other = (Tipoproducto) obj;
        if (!Objects.equals(this.codigo, other.codigo)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "InvestigacionTipoproducto{" + "codigo=" + codigo + ", descripcion=" + descripcion + '}';
    }
}