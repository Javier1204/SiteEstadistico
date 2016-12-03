/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.DTO;

/**
 *
 * @author Administrador
 */
public class practicaDTO {
    int idpractica;
    String año_practica;
    String semestre_practica;
    String urlCartaSolicitud;
    String id_convenio;
    String urlCartaCumplido;
    String urlCartaAceptacion;
    String estado;
    String id_estudiante;
    String id_docente;
    int id_perfil;
    int id_tutor;
    String urlConvenio;
    convenioDTO convenio;
    estudianteDTO estudiante;
    perfilDTO perfil;

    public practicaDTO(String año_practica) {
        this.año_practica = año_practica;
    }
    
    @Override
    public String toString() {
        return "practicaDTO{" + "idpractica=" + idpractica + ", a\u00f1o_practica=" + año_practica + ", semestre_practica=" + semestre_practica + ", id_convenio=" + id_convenio + ", urlCartaCumplido=" + urlCartaCumplido + ", estado=" + estado + ", id_estudiante=" + id_estudiante + ", id_docente=" + id_docente + ", id_perfil=" + id_perfil + ", id_tutor=" + id_tutor + '}';
    }

    public int getIdpractica() {
        return idpractica;
    }

    public void setIdpractica(int idpractica) {
        this.idpractica = idpractica;
    }

    public String getAño_practica() {
        return año_practica;
    }

    public void setAño_practica(String año_practica) {
        this.año_practica = año_practica;
    }

    public String getSemestre_practica() {
        return semestre_practica;
    }

    public void setSemestre_practica(String semestre_practica) {
        this.semestre_practica = semestre_practica;
    }

    public String getUrlCartaSolicitud() {
        return urlCartaSolicitud;
    }

    public void setUrlCartaSolicitud(String urlCartaSolicitud) {
        this.urlCartaSolicitud = urlCartaSolicitud;
    }

    public String getId_convenio() {
        return id_convenio;
    }

    public void setId_convenio(String id_convenio) {
        this.id_convenio = id_convenio;
    }

    public String getUrlCartaCumplido() {
        return urlCartaCumplido;
    }

    public void setUrlCartaCumplido(String urlCartaCumplido) {
        this.urlCartaCumplido = urlCartaCumplido;
    }

    public String getUrlCartaAceptacion() {
        return urlCartaAceptacion;
    }

    public void setUrlCartaAceptacion(String urlCartaAceptacion) {
        this.urlCartaAceptacion = urlCartaAceptacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    
    public String getId_estudiante() {
        return id_estudiante;
    }

    public void setId_estudiante(String id_estudiante) {
        this.id_estudiante = id_estudiante;
    }

    public String getId_docente() {
        return id_docente;
    }

    public void setId_docente(String id_docente) {
        this.id_docente = id_docente;
    }

    public int getId_perfil() {
        return id_perfil;
    }

    public void setId_perfil(int id_perfil) {
        this.id_perfil = id_perfil;
    }

    public int getId_tutor() {
        return id_tutor;
    }

    public void setId_tutor(int id_tutor) {
        this.id_tutor = id_tutor;
    }

    public String getUrlConvenio() {
        return urlConvenio;
    }

    public void setUrlConvenio(String urlConvenio) {
        this.urlConvenio = urlConvenio;
    }
    public practicaDTO( int idpractica, String año_practica, String semestre_practica, String id_convenio, String estado,  String id_docente,String id_estudiante,  int id_perfil, int id_tutor) {
        this.idpractica=idpractica;
        this.año_practica = año_practica;
        this.semestre_practica = semestre_practica;
        this.id_convenio = id_convenio;
        this.estado = estado;
        this.id_estudiante = id_estudiante;
        this.id_docente = id_docente;
        this.id_perfil = id_perfil;
        this.id_tutor = id_tutor;
    }

    public practicaDTO( String año_practica, String semestre_practica, String id_convenio, String estado,  String id_docente,String id_estudiante,  int id_perfil, int id_tutor) {
        
        this.año_practica = año_practica;
        this.semestre_practica = semestre_practica;
        this.id_convenio = id_convenio;
        this.estado = estado;
        this.id_estudiante = id_estudiante;
        this.id_docente = id_docente;
        this.id_perfil = id_perfil;
        this.id_tutor = id_tutor;
    }
    public void setEmpresa(String idconvenio, int id_empresa,String nombre_empresa){
     
     convenio=new convenioDTO();
     convenio.setEmpresa(id_empresa, nombre_empresa);
     
    }
    
    public convenioDTO getEmpresa(){
     return convenio;
 }
    public void setEstudiante(String codigoEstudiante, String nombreEstudiante){
     
     estudiante=new estudianteDTO();
     estudiante.setCodigoEstudiante(codigoEstudiante);
     estudiante.setNombresEstudiante(nombreEstudiante);
 }
    
    public estudianteDTO getEstudiante(){
     return estudiante;
 }
    public void setPerfil(int id_perfil, String nombrePerfil){
     
     perfil=new perfilDTO();
     perfil.setIdperfil(id_perfil);
     perfil.setNombre(nombrePerfil);
 }
    
    public perfilDTO getPerfil(){
     return perfil;
 }

    public practicaDTO() {
    }
    
}
