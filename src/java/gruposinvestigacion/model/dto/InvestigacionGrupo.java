package gruposinvestigacion.model.dto;
// Generated 18/11/2016 11:36:30 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.ArrayList;

public class InvestigacionGrupo  implements java.io.Serializable {


     private String codigocolciencias;
     private ArrayList<InvestigacionLineasinvestigacion> investigacionLineasinvestigacion;
     private String nombregrupo;
     private String sigla;
     private InvestigacionIntegrante<GeneralDocente> director;
     private String correoelectronico;
     private Date anocreacion;
     private String ubicacion;
     private String telefono;
     private boolean estado;
     
     private ArrayList<InvestigacionIntegrante> integrantes;
     private ArrayList<Proyecto> investigacionProyectos;

    public InvestigacionGrupo() {
    }

    public InvestigacionGrupo(String codigocolciencias, ArrayList<InvestigacionLineasinvestigacion> investigacionLineasinvestigacion, String nombregrupo, String sigla, InvestigacionIntegrante<GeneralDocente> director, String correoelectronico, Date anocreacion, String ubicacion, String telefono) {
        this.codigocolciencias = codigocolciencias;
        this.investigacionLineasinvestigacion = investigacionLineasinvestigacion;
        this.nombregrupo = nombregrupo;
        this.sigla = sigla;
        this.director = director;
        this.correoelectronico = correoelectronico;
        this.anocreacion = anocreacion;
        this.ubicacion = ubicacion;
        this.telefono = telefono;
    }

    
    
    public String getCodigocolciencias() {
        return this.codigocolciencias;
    }
    
    public void setCodigocolciencias(String codigocolciencias) {
        this.codigocolciencias = codigocolciencias;
    }

    public ArrayList<InvestigacionLineasinvestigacion> getLineasinvestigacion() {
        return this.investigacionLineasinvestigacion;
    }
    
    public void setLineasinvestigacion (ArrayList<InvestigacionLineasinvestigacion> investigacionLineasinvestigacion) {
        this.investigacionLineasinvestigacion = investigacionLineasinvestigacion;
    }

    
    public String getNombregrupo() {
        return this.nombregrupo;
    }
    
    public void setNombregrupo(String nombregrupo) {
        this.nombregrupo = nombregrupo;
    }

    
    public String getSigla() {
        return this.sigla;
    }
    
    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public InvestigacionIntegrante<GeneralDocente> getDirector() {
        return director;
    }

    public void setDirector(InvestigacionIntegrante<GeneralDocente> director) {
        this.director = director;
    }

    public String getCorreoelectronico() {
        return this.correoelectronico;
    }
    
    public void setCorreoelectronico(String correoelectronico) {
        this.correoelectronico = correoelectronico;
    }

    public Date getAnocreacion() {
        return this.anocreacion;
    }
    
    public void setAnocreacion(Date anocreacion) {
        this.anocreacion = anocreacion;
    }

    
    public String getUbicacion() {
        return this.ubicacion;
    }
    
    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    
    public String getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public ArrayList<Proyecto> getInvestigacionProyectos() {
        return this.investigacionProyectos;
    }
    
    public void setInvestigacionProyectos(ArrayList<Proyecto> investigacionProyectos) {
        this.investigacionProyectos = investigacionProyectos;
    }

    public ArrayList<InvestigacionLineasinvestigacion> getInvestigacionLineasinvestigacion() {
        return investigacionLineasinvestigacion;
    }

    public void setInvestigacionLineasinvestigacion(ArrayList<InvestigacionLineasinvestigacion> investigacionLineasinvestigacion) {
        this.investigacionLineasinvestigacion = investigacionLineasinvestigacion;
    }

    public ArrayList<InvestigacionIntegrante> getIntegrantes() {
        return integrantes;
    }

    public void setIntegrantes(ArrayList<InvestigacionIntegrante> integrantes) {
        this.integrantes = integrantes;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "InvestigacionGrupo{" + "codigocolciencias=" + codigocolciencias + ", investigacionLineasinvestigacion=" + investigacionLineasinvestigacion + ", nombregrupo=" + nombregrupo + ", sigla=" + sigla + ", director=" + director + ", correoelectronico=" + correoelectronico + ", anocreacion=" + anocreacion + ", ubicacion=" + ubicacion + ", telefono=" + telefono + ", estado=" + estado + ", integrantes=" + integrantes + ", investigacionProyectos=" + investigacionProyectos + '}';
    }

}