/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufps.facade;

/**
 *
 * @author luxx
 */
import ufps.dto.*;
import ufps.negocio.*;

public class ModuloEstudiante {
     private static final ModuloEstudianteNego modEstu= new ModuloEstudianteNego();
     
     
     
    public String registrarDatapersonal(DatosPersonales_DTO admin) {
        return modEstu.registrarDatapersonal(admin);
    }

    public String registrarDataacademica(DatosAcademicos_DTO admin) {
        return modEstu.registrarDataacademica(admin);
    }
    
    public String EditarDataacademica(DatosAcademicos_DTO admin) {
        return modEstu.EditarDataacademica(admin);
    }
    
    public String EditarDataPersonal(DatosPersonales_DTO admin) {
        return modEstu.EditarDataPersonal(admin);
    }
     
    
    
    public String ConsultaAvanzada(int poredad,int edad1,int edad2,int porgene,int genero,int porcivi,int estado_civil,int porlec,int lectura,int porcienc,int naturales,int porsoci,int sociales,int poring,int ingles) {
        return modEstu.ConsultaAvanzada(poredad,edad1,edad2,porgene,genero,porcivi,estado_civil,porlec,lectura,porcienc,naturales,porsoci,sociales,poring,ingles);
    }
      public String registrarUsuario(UsuarioDTO usu) {
        return modEstu.registrarUsuario(usu);
    }
      
    public String validarUsuario(UsuarioDTO usu) {
        return modEstu.ValidarUsuario(usu);
    }
    
     
     public String buscarAcademica(UsuarioDTO usuario) {
        return modEstu.buscarAcademica(usuario);
    }
     public String buscarPersonal(UsuarioDTO usuario) {
        return modEstu.buscarPersonal(usuario);
    }
}
