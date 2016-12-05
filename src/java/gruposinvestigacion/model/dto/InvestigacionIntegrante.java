package gruposinvestigacion.model.dto;
// Generated 18/11/2016 11:36:30 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.ArrayList;

public class InvestigacionIntegrante<T>  implements java.io.Serializable {

     private String codigo;
     private int tipo;
     private String contrasena;
     private T persona;
     private String grupoCodigoColciencias;
     private Date fechaingreso;
     private boolean estado;
     private ArrayList<Producto> investigacionProductos;
     
    public InvestigacionIntegrante() {
    }

	
    public InvestigacionIntegrante(String codigo, int tipo, Date fechaingreso) {
        this.codigo = codigo;
        this.tipo = tipo;
        this.fechaingreso = fechaingreso;
    }

    public String getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getTipo() {
        return this.tipo;
    }
    
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public Date getFechaingreso() {
        return this.fechaingreso;
    }
    
    public void setFechaingreso(Date fechaingreso) {
        this.fechaingreso = fechaingreso;
    }

    public T getPersona() {
        return persona;
    }

    public void setPersona(T persona) {
        this.persona = persona;
    }

    public ArrayList<Producto> getInvestigacionProductos() {
        return this.investigacionProductos;
    }
    
    public void setInvestigacionProductos(ArrayList<Producto> investigacionProductos) {
        this.investigacionProductos = investigacionProductos;
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
        final InvestigacionIntegrante other = (InvestigacionIntegrante) obj;
        if (this.codigo != other.codigo) {
            return false;
        }
        return true;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getGrupoCodigoColciencias() {
        return grupoCodigoColciencias;
    }

    public void setGrupoCodigoColciencias(String grupoCodigoColciencias) {
        this.grupoCodigoColciencias = grupoCodigoColciencias;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "InvestigacionIntegrante{" + "codigo=" + codigo + ", tipo=" + tipo + ", persona=" + persona + ", fechaingreso=" + fechaingreso + ", investigacionProductos=" + investigacionProductos + '}';
    }

}
