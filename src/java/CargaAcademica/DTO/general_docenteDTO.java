/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CargaAcademica.DTO;

import java.sql.Date;

/**
 *
 * @author jesus
 */
public class general_docenteDTO {
    private String codigo;
    private String cedula;
    private String nombres;
    private String apellidos;
    private byte   estado;
    private String nivel_estudio;
    private String categoria;
    private String tipo_vinculacion;
    private String correo_institucional;
    private String correo_personal;
    private String titulo_pregrado;
    private String celular;
    private byte   anos_exp;
    private Date   fecha_nac;
    private String direccion_resi;

    public general_docenteDTO(String codigo, String cedula, String nombres, String apellidos, byte estado, String nivel_estudio,
                                String categoria, String tipo_vinculacion, String correo_institucional, String correo_personal, 
                                String titulo_pregrado, String celular, byte anos_exp, Date fecha_nac, String direccion_resi) {
        this.codigo = codigo;
        this.cedula = cedula;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.estado = estado;
        this.nivel_estudio = nivel_estudio;
        this.categoria = categoria;
        this.tipo_vinculacion = tipo_vinculacion;
        this.correo_institucional = correo_institucional;
        this.correo_personal = correo_personal;
        this.titulo_pregrado = titulo_pregrado;
        this.celular = celular;
        this.anos_exp = anos_exp;
        this.fecha_nac = fecha_nac;
        this.direccion_resi = direccion_resi;
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

    public byte getEstado() {
        return estado;
    }

    public void setEstado(byte estado) {
        this.estado = estado;
    }

    public String getNivel_estudio() {
        return nivel_estudio;
    }

    public void setNivel_estudio(String nivel_estudio) {
        this.nivel_estudio = nivel_estudio;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getTipo_vinculacion() {
        return tipo_vinculacion;
    }

    public void setTipo_vinculacion(String tipo_vinculacion) {
        this.tipo_vinculacion = tipo_vinculacion;
    }

    public String getCorreo_institucional() {
        return correo_institucional;
    }

    public void setCorreo_institucional(String correo_institucional) {
        this.correo_institucional = correo_institucional;
    }

    public String getCorreo_personal() {
        return correo_personal;
    }

    public void setCorreo_personal(String correo_personal) {
        this.correo_personal = correo_personal;
    }

    public String getTitulo_pregrado() {
        return titulo_pregrado;
    }

    public void setTitulo_pregrado(String titulo_pregrado) {
        this.titulo_pregrado = titulo_pregrado;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public byte getAnos_exp() {
        return anos_exp;
    }

    public void setAnos_exp(byte anos_exp) {
        this.anos_exp = anos_exp;
    }

    public Date getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(Date fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    public String getDireccion_resi() {
        return direccion_resi;
    }

    public void setDireccion_resi(String direccion_resi) {
        this.direccion_resi = direccion_resi;
    }
            
    
}
