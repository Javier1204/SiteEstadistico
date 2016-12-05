package gruposinvestigacion.model.dto;
// Generated 18/11/2016 11:36:30 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Objects;

public class GeneralDocente  implements java.io.Serializable {


     private String codigo;
     private String cedula;
     private String nombres;
     private String apellidos;
     private Boolean estado;
     private String nivelEstudio;
     private String categoria;
     private String tipoVinculacion;
     private String correoInstitucional;
     private String correoPersonal;
     private String tituloPregrado;
     private String celular;
     private Integer anosExp;
     private Date fechaNac;
     private String direccionResi;
     private Boolean oficinaHabilitado;     

    public GeneralDocente() {
    }

	
    public GeneralDocente(String codigo) {
        this.codigo = codigo;
    }
    public GeneralDocente(String codigo, String cedula, String nombres, String apellidos, Boolean estado, String nivelEstudio, String categoria, String tipoVinculacion, String correoInstitucional, String correoPersonal, String tituloPregrado, String celular, Integer anosExp, Date fechaNac, String direccionResi, Boolean oficinaHabilitado) {
       this.codigo = codigo;
       this.cedula = cedula;
       this.nombres = nombres;
       this.apellidos = apellidos;
       this.estado = estado;
       this.nivelEstudio = nivelEstudio;
       this.categoria = categoria;
       this.tipoVinculacion = tipoVinculacion;
       this.correoInstitucional = correoInstitucional;
       this.correoPersonal = correoPersonal;
       this.tituloPregrado = tituloPregrado;
       this.celular = celular;
       this.anosExp = anosExp;
       this.fechaNac = fechaNac;
       this.direccionResi = direccionResi;
       this.oficinaHabilitado = oficinaHabilitado;
    }

    public String getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCedula() {
        return this.cedula;
    }
    
    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    
    public String getNombres() {
        return this.nombres;
    }
    
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    
    public String getApellidos() {
        return this.apellidos;
    }
    
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    
    public Boolean getEstado() {
        return this.estado;
    }
    
    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    
    public String getNivelEstudio() {
        return this.nivelEstudio;
    }
    
    public void setNivelEstudio(String nivelEstudio) {
        this.nivelEstudio = nivelEstudio;
    }

    
    public String getCategoria() {
        return this.categoria;
    }
    
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    
    public String getTipoVinculacion() {
        return this.tipoVinculacion;
    }
    
    public void setTipoVinculacion(String tipoVinculacion) {
        this.tipoVinculacion = tipoVinculacion;
    }

    
    public String getCorreoInstitucional() {
        return this.correoInstitucional;
    }
    
    public void setCorreoInstitucional(String correoInstitucional) {
        this.correoInstitucional = correoInstitucional;
    }

    
    public String getCorreoPersonal() {
        return this.correoPersonal;
    }
    
    public void setCorreoPersonal(String correoPersonal) {
        this.correoPersonal = correoPersonal;
    }

    
    public String getTituloPregrado() {
        return this.tituloPregrado;
    }
    
    public void setTituloPregrado(String tituloPregrado) {
        this.tituloPregrado = tituloPregrado;
    }

    
    public String getCelular() {
        return this.celular;
    }
    
    public void setCelular(String celular) {
        this.celular = celular;
    }

    
    public Integer getAnosExp() {
        return this.anosExp;
    }
    
    public void setAnosExp(Integer anosExp) {
        this.anosExp = anosExp;
    }

    public Date getFechaNac() {
        return this.fechaNac;
    }
    
    public void setFechaNac(Date fechaNac) {
        this.fechaNac = fechaNac;
    }

    
    public String getDireccionResi() {
        return this.direccionResi;
    }
    
    public void setDireccionResi(String direccionResi) {
        this.direccionResi = direccionResi;
    }

    
    public Boolean getOficinaHabilitado() {
        return this.oficinaHabilitado;
    }
    
    public void setOficinaHabilitado(Boolean oficinaHabilitado) {
        this.oficinaHabilitado = oficinaHabilitado;
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
        final GeneralDocente other = (GeneralDocente) obj;
        if (!Objects.equals(this.codigo, other.codigo)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "GeneralDocente{" + "codigo=" + codigo + ", cedula=" + cedula + ", nombres=" + nombres + ", apellidos=" + apellidos + ", estado=" + estado + ", nivelEstudio=" + nivelEstudio + ", categoria=" + categoria + ", tipoVinculacion=" + tipoVinculacion + ", correoInstitucional=" + correoInstitucional + ", correoPersonal=" + correoPersonal + ", tituloPregrado=" + tituloPregrado + ", celular=" + celular + ", anosExp=" + anosExp + ", fechaNac=" + fechaNac + ", direccionResi=" + direccionResi + ", oficinaHabilitado=" + oficinaHabilitado + '}';
    }

}