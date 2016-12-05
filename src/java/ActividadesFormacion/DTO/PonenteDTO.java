/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ActividadesFormacion.DTO;

/**
 *
 * @author WILSON
 */
public class PonenteDTO {
    
    int codigo;
    String cedula;
    String nombre;
    String apellido;
    String nivel;
    String tipoVinculacion;
    String correoPersonal;
    String titulo;
    String celular;
    String anos_experiencia;

    public PonenteDTO() {
    }

    public PonenteDTO( String cedula, String nombre, String apellido, String nivel, String tipoVinculacion, String correoPersonal, String titulo, String celular, String anos_experiencia) {
       
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellido = apellido;
        this.nivel = nivel;
        this.tipoVinculacion = tipoVinculacion;
        this.correoPersonal = correoPersonal;
        this.titulo = titulo;
        this.celular = celular;
        this.anos_experiencia = anos_experiencia;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNivelEducativo() {
        return nivel;
    }

    public void setNivelEducativo(String nivelEducativo) {
        this.nivel  = nivelEducativo;
    }

    public String getTipoVinculacion() {
        return tipoVinculacion;
    }

    public void setTipoVinculacion(String tipoVinculacion) {
        this.tipoVinculacion = tipoVinculacion;
    }

    public String getCorreoPersonal() {
        return correoPersonal;
    }

    public void setCorreoPersonal(String correoPersonal) {
        this.correoPersonal = correoPersonal;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getAñosExperiencia() {
        return anos_experiencia;
    }

    public void setAñosExperiencia(String anos_experiencia) {
        this.anos_experiencia = anos_experiencia;
    }

    @Override
    public String toString() {
        return "PonenteDTO{" + "codigo=" + codigo + ", cedula=" + cedula + ", nombre=" + nombre + ", apellido=" + apellido + ", nivelEducativo=" + nivel + ", tipoVinculacion=" + tipoVinculacion + ", correoPersonal=" + correoPersonal + ", titulo=" + titulo + ", celular=" + celular + ", a\u00f1osExperiencia=" + anos_experiencia + '}';
    }
    
    
    
    
}
