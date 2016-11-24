/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacion.Modelo.DTO;

import java.sql.Date;

/**
 *
 * @author JAVIER
 */
public class Docente {
    
    String codigo;
    String cedula;
    String nombres;
    String apellidos;
    boolean estado;
    String nivelestudio;
    String categoria;
    String tipovinculacion;
    String correoinstitucional;
    String correopersonal;
    String titulopregrado;
    String celular;
    int añosexperiencia;
    Date fechanacimiento;
    String direccion;
    boolean habilitado;
    String investigacion_codigocolciencias;
    
    public Docente(){
        
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getNivelestudio() {
        return nivelestudio;
    }

    public void setNivelestudio(String nivelestudio) {
        this.nivelestudio = nivelestudio;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getTipovinculacion() {
        return tipovinculacion;
    }

    public void setTipovinculacion(String tipovinculacion) {
        this.tipovinculacion = tipovinculacion;
    }

    public String getCorreoinstitucional() {
        return correoinstitucional;
    }

    public void setCorreoinstitucional(String correoinstitucional) {
        this.correoinstitucional = correoinstitucional;
    }

    public String getCorreopersonal() {
        return correopersonal;
    }

    public void setCorreopersonal(String correopersonal) {
        this.correopersonal = correopersonal;
    }

    public String getTitulopregrado() {
        return titulopregrado;
    }

    public void setTitulopregrado(String titulopregrado) {
        this.titulopregrado = titulopregrado;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public int getAñosexperiencia() {
        return añosexperiencia;
    }

    public void setAñosexperiencia(int añosexperiencia) {
        this.añosexperiencia = añosexperiencia;
    }

    public Date getFechanacimiento() {
        return fechanacimiento;
    }

    public void setFechanacimiento(Date fechanacimiento) {
        this.fechanacimiento = fechanacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public boolean isHabilitado() {
        return habilitado;
    }

    public void setHabilitado(boolean habilitado) {
        this.habilitado = habilitado;
    }

    public String getInvestigacion_codigocolciencias() {
        return investigacion_codigocolciencias;
    }

    public void setInvestigacion_codigocolciencias(String investigacion_codigocolciencias) {
        this.investigacion_codigocolciencias = investigacion_codigocolciencias;
    }
    
    

    public Docente(String codigo, String cedula, String nombres, String apellidos, boolean estado, String nivelestudio, String categoria, String tipovinculacion, String correoinstitucional, String correopersonal, String titulopregrado, String celular, int añosexperiencia, Date fechanacimiento, String direccion, boolean habilitado, String investigacion_codigocolciencias) {
        this.codigo = codigo;
        this.cedula = cedula;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.estado = estado;
        this.nivelestudio = nivelestudio;
        this.categoria = categoria;
        this.tipovinculacion = tipovinculacion;
        this.correoinstitucional = correoinstitucional;
        this.correopersonal = correopersonal;
        this.titulopregrado = titulopregrado;
        this.celular = celular;
        this.añosexperiencia = añosexperiencia;
        this.fechanacimiento = fechanacimiento;
        this.direccion = direccion;
        this.habilitado = habilitado;
        this.investigacion_codigocolciencias = investigacion_codigocolciencias;
    }     
}
