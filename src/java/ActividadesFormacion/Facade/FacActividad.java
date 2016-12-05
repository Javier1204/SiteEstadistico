/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ActividadesFormacion.Facade;

/**
 *
 * @author luxx
 */
import ActividadesFormacion.Controlador.ModuloActividades;
import ActividadesFormacion.DTO.*;
import ActividadesFormacion.DTO.EstudianteDTO;
import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;



public class FacActividad {
     private static final ModuloActividades modEstu= new ModuloActividades();
     
     
     
//    public String registrarActividad(ActividadDTO datap) {
//        return modEstu.registrarActividad(datap);
//
//    }

   
     
//    public String registrarAsistencia2() {
//        return modEstu.registrarAsistencia2();
//    }
     
    public String registrarPonente(PonenteDTO datap) {
        return modEstu.registrarPonente(datap);
    }
    
    public String ListarEstudiantes() {
        return modEstu.ListarEstudiantes();
    }
    public String ListarEstudiantes2() {
        return modEstu.ListarEstudiantes2();
    }
    
    public String ListarActividades() {
        return modEstu.ListarActividades();
    }
    
    public String ListarActividades2() {
        return modEstu.ListarActividades2();
    }
    
    public String ListarConvenios() {
        return modEstu.ListarConvenios();
    }
    
    public String ListarPonentes() {
        return modEstu.ListarPonentes();
    }
    
    public String Tablaactividades(ActividadDTO acti) {
         return modEstu.Tablaactividades(acti);
    }
    
    public String  TablaSemestre(ActividadDTO acti) {
         return modEstu.TablaSemestre( acti);
    }
    
    public String TablaEstudiante(EstudianteDTO est) {
         return modEstu.TablaEstudiante(est);
    }
    
     public String registrarAsistencia2(int codigoActividad,int codigoEstudiante, InputStream inputStream,long size) {
        return modEstu.registrarAsistencia2(codigoActividad,codigoEstudiante,inputStream,size);
    }
    
     public String registrarAsistencia3(HttpServletRequest request) {
        return modEstu.registrarAsistencia3(request);
    }
    
     
}
