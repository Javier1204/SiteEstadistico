/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ActividadesFormacion.DTO;


import java.sql.Date;

/**
 *
 * @author WILSON
 */
public class ActividadDTO {
    
    int codigo;
    String nombre;
    int responsablePonente;
    String NomresponsablePonente;
    String convenio;
    String Nomconvenio;
    int siconv;
    String tipoActividad;
    String fechaInicio;
    String fechaFin;
    int horaInicio;
    String lugar;
    Date horaFiin;
    String organizador;

    public ActividadDTO() {
    }

    public ActividadDTO(String Nombre, int responsablePonente, String convenio, int siconv, String tipoActividad, String fechaInicio,String fechaFin, int horaInicio,String lugar,String organizador) {
       
        this.nombre = Nombre;
        this.responsablePonente = responsablePonente;
        this.convenio = convenio;
        this.siconv = siconv;
        this.tipoActividad = tipoActividad;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
       
        this.lugar = lugar;       
        this.organizador = organizador;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getNomresponsablePonente() {
        return NomresponsablePonente;
    }

    public void setNomresponsablePonente(String NomresponsablePonente) {
        this.NomresponsablePonente = NomresponsablePonente;
    }

    public String getNomconvenio() {
        return Nomconvenio;
    }

    public void setNomconvenio(String Nomconvenio) {
        this.Nomconvenio = Nomconvenio;
    }

    public int getSiconv() {
        return siconv;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public void setSiconv(int siconv) {
        this.siconv = siconv;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

   
    

    public int getResponsablePonente() {
        return responsablePonente;
    }

    public void setResponsablePonente(int responsablePonente) {
        this.responsablePonente = responsablePonente;
    }

    public String getConvenio() {
        return convenio;
    }

    public void setConvenio(String convenio) {
        this.convenio = convenio;
    }

    public String getTipoActividad() {
        return tipoActividad;
    }

    public void setTipoActividad(String tipoActividad) {
        this.tipoActividad = tipoActividad;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public int getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(int horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public Date getHoraFiin() {
        return horaFiin;
    }

    public void setHoraFiin(Date horaFiin) {
        this.horaFiin = horaFiin;
    }

    public String getOrganizador() {
        return organizador;
    }

    public void setOrganizador(String organizador) {
        this.organizador = organizador;
    }

    @Override
    public String toString() {
        return "ActividadDTO{" + "codigo=" + codigo + ", responsablePonente=" + responsablePonente + ", convenio=" + convenio + ", tipoActividad=" + tipoActividad + ", fechaInicio=" + fechaInicio + ", horaInicio=" + horaInicio + ", lugar=" + lugar + ", horaFiin=" + horaFiin + ", organizador=" + organizador + '}';
    }

    
    
    
    
    
    
    
}
