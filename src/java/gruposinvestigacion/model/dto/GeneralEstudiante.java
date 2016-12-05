package gruposinvestigacion.model.dto;
// Generated 18/11/2016 11:36:30 AM by Hibernate Tools 4.3.1


public class GeneralEstudiante  implements java.io.Serializable {


     private String codigo;
     private String documentoId;
     private String nombres;
     private String apellidos;
     private Integer semestre;
     private String programaacademico;
     private boolean activo;
     private boolean asignadoPractica;

    public GeneralEstudiante() {
    }

	
    public GeneralEstudiante(String codigo, String documentoId, boolean asignadoPractica) {
        this.codigo = codigo;
        this.documentoId = documentoId;
        this.asignadoPractica = asignadoPractica;
    }

    public GeneralEstudiante(String codigo, String documentoId, String nombres, String apellidos, Integer semestre, String programaacademico, boolean activo, boolean asignadoPractica) {
        this.codigo = codigo;
        this.documentoId = documentoId;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.semestre = semestre;
        this.programaacademico = programaacademico;
        this.activo = activo;
        this.asignadoPractica = asignadoPractica;
    }

    public String getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDocumentoId() {
        return this.documentoId;
    }
    
    public void setDocumentoId(String documentoId) {
        this.documentoId = documentoId;
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

    
    public Integer getSemestre() {
        return this.semestre;
    }
    
    public void setSemestre(Integer semestre) {
        this.semestre = semestre;
    }

    
    public String getProgramaacademico() {
        return this.programaacademico;
    }
    
    public void setProgramaacademico(String programaacademico) {
        this.programaacademico = programaacademico;
    }

    
    public boolean getActivo() {
        return this.activo;
    }
    
    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    
    public boolean isAsignadoPractica() {
        return this.asignadoPractica;
    }
    
    public void setAsignadoPractica(boolean asignadoPractica) {
        this.asignadoPractica = asignadoPractica;
    }

    @Override
    public String toString() {
        return "GeneralEstudiante{" + "codigo=" + codigo + ", documentoId=" + documentoId + ", nombres=" + nombres + ", apellidos=" + apellidos + ", semestre=" + semestre + ", programaacademico=" + programaacademico + ", activo=" + activo + ", asignadoPractica=" + asignadoPractica + '}';
    }

}


