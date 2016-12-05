package gruposinvestigacion.model.dto;
// Generated 18/11/2016 11:36:30 AM by Hibernate Tools 4.3.1



public class InvestigacionLineasinvestigacion  implements java.io.Serializable {

     private int codigolinea;
     private String nombre;
     private String objetivos;
     private String descripcion;

    public InvestigacionLineasinvestigacion() {
    }

	
    public InvestigacionLineasinvestigacion(int codigolinea, String nombre, String objetivos, String descripcion) {
        this.codigolinea = codigolinea;
        this.nombre = nombre;
        this.objetivos = objetivos;
        this.descripcion = descripcion;
    }

    public int getCodigolinea() {
        return this.codigolinea;
    }
    
    public void setCodigolinea(int codigolinea) {
        this.codigolinea = codigolinea;
    }

    
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    public String getObjetivos() {
        return this.objetivos;
    }
    
    public void setObjetivos(String objetivos) {
        this.objetivos = objetivos;
    }

    
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public int hashCode() {
        int hash = 5;
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
        final InvestigacionLineasinvestigacion other = (InvestigacionLineasinvestigacion) obj;
        if (this.codigolinea != other.codigolinea) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "InvestigacionLineasinvestigacion{" + "codigolinea=" + codigolinea + ", nombre=" + nombre + ", objetivos=" + objetivos + ", descripcion=" + descripcion + '}';
    }

}
