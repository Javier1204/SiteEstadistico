package gruposinvestigacion.model.dto;
// Generated 18/11/2016 11:36:30 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.ArrayList;

public class Proyecto  implements java.io.Serializable {


     private int codigoproyecto;
     private InvestigacionLineasinvestigacion investigacionLineasinvestigacion;
     private String nombreproyecto;
     private InvestigacionIntegrante liderproyecto;
     private Date fechainicio;
     private Date fechafin;
     private String tipofinanciamiento;
     private ArrayList<InvestigacionAliados> investigacionAliadoses;
     private ArrayList<Producto> investigacionProductos;
     private boolean estado;
     
    public Proyecto() {
    }

    public Proyecto(int codigoproyecto, InvestigacionLineasinvestigacion investigacionLineasinvestigacion, String nombreproyecto, InvestigacionIntegrante liderproyecto, Date fechainicio, Date fechafin, String tipofinanciamiento) {
        this.codigoproyecto = codigoproyecto;
        this.investigacionLineasinvestigacion = investigacionLineasinvestigacion;
        this.nombreproyecto = nombreproyecto;
        this.liderproyecto = liderproyecto;
        this.fechainicio = fechainicio;
        this.fechafin = fechafin;
        this.tipofinanciamiento = tipofinanciamiento;
    }

    public int getCodigoproyecto() {
        return this.codigoproyecto;
    }
    
    public void setCodigoproyecto(int codigoproyecto) {
        this.codigoproyecto = codigoproyecto;
    }

    public InvestigacionLineasinvestigacion getInvestigacionLineasinvestigacion() {
        return this.investigacionLineasinvestigacion;
    }
    
    public void setInvestigacionLineasinvestigacion(InvestigacionLineasinvestigacion investigacionLineasinvestigacion) {
        this.investigacionLineasinvestigacion = investigacionLineasinvestigacion;
    }

    
    public String getNombreproyecto() {
        return this.nombreproyecto;
    }
    
    public void setNombreproyecto(String nombreproyecto) {
        this.nombreproyecto = nombreproyecto;
    }

    
    public InvestigacionIntegrante getLiderproyecto() {
        return this.liderproyecto;
    }
    
    public void setLiderproyecto(InvestigacionIntegrante liderproyecto) {
        this.liderproyecto = liderproyecto;
    }

    public Date getFechainicio() {
        return this.fechainicio;
    }
    
    public void setFechainicio(Date fechainicio) {
        this.fechainicio = fechainicio;
    }


    public Date getFechafin() {
        return this.fechafin;
    }
    
    public void setFechafin(Date fechafin) {
        this.fechafin = fechafin;
    }

    
    public String getTipofinanciamiento() {
        return this.tipofinanciamiento;
    }
    
    public void setTipofinanciamiento(String tipofinanciamiento) {
        this.tipofinanciamiento = tipofinanciamiento;
    }

    public ArrayList<InvestigacionAliados> getInvestigacionAliadoses() {
        return this.investigacionAliadoses;
    }
    
    public void setInvestigacionAliadoses(ArrayList<InvestigacionAliados> investigacionAliadoses) {
        this.investigacionAliadoses = investigacionAliadoses;
    }

    public ArrayList<Producto> getInvestigacionProductos() {
        return this.investigacionProductos;
    }
    
    public void setInvestigacionProductos(ArrayList<Producto> investigacionProductos) {
        this.investigacionProductos = investigacionProductos;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
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
        final Proyecto other = (Proyecto) obj;
        if (this.codigoproyecto != other.codigoproyecto) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "InvestigacionProyecto{" + "codigoproyecto=" + codigoproyecto + ", investigacionLineasinvestigacion=" + investigacionLineasinvestigacion + ", nombreproyecto=" + nombreproyecto + ", liderproyecto=" + liderproyecto + ", fechainicio=" + fechainicio + ", fechafin=" + fechafin + ", tipofinanciamiento=" + tipofinanciamiento + ", investigacionAliadoses=" + investigacionAliadoses + ", investigacionProductos=" + investigacionProductos + '}';
    }

}