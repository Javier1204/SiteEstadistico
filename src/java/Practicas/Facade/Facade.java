/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Facade;

import Practicas.Controlador.*;
import java.util.ArrayList;
import Practicas.DTO.*;
import Internacionalizacion.Controlador.ControladorTipo_actividades;
import Internacionalizacion.Modelo.DTO.Tipo_actividades;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Administrador
 */
public class Facade {
    
    public String RegistrarPerfil(perfilDTO p){
        perfilControlador c = new perfilControlador();
        return c.RegistrarPerfil(p);
    }
     
    public int idperfilMaximo(){
        perfilControlador c= new perfilControlador();
        return c.id_perfil_maximo();
    } 
    
    public ArrayList<empresaDTO> obtenerEmpresas(){
        empresaControlador c = new empresaControlador();
        return c.consultar_Empresas();
    }
    
     public String registrarEmpresa( empresaDTO e) throws Exception{
         empresaControlador s=new empresaControlador();
         System.out.println("FACADE:: " + e.toString());//corralo
         return s.registrarEmpresas(e);               
    }
     public String editarEmpresa( empresaDTO e) throws Exception{
         empresaControlador s=new empresaControlador();
         System.out.println("FACADE: ALGUNa vaina: " + e.toString());//corralo
         return s.editarEmpresas(e);               
    }
    
     public String editarPractica( practicaDTO e) throws Exception{
         practicaControlador s=new practicaControlador();
         System.out.println("FACADE: ALGUNa vaina: " + e.toString());//corralo
         return s.editarPractica(e);               
    }
    //aqui
    
     public ArrayList<estudianteDTO> obtenerEstudiantes(int semestre, int año){
        estudianteControlador c = new estudianteControlador();
        return c.obtener_Estudiantes(semestre, año);
    }
     public ArrayList<estudianteDTO> obtenerEstudiantes_asignados(){
        estudianteControlador c = new estudianteControlador();
        return c.obtener_Estudiantes_asignados();
    }
     
    public List<perfilDTO> listarPerfil(){
        perfilControlador c= new perfilControlador();
        return c.listarPerfiles();
    }
    
    public estudianteDTO buscarEstudiante(String codigo){
        estudianteControlador c= new estudianteControlador();
        return c.buscarEstudiante(codigo);
    }
    
    public practicaDTO buscarPractica(int id){
        practicaControlador c= new practicaControlador();
        return c.buscarPractica(id);
    }
    
    public docenteDTO buscar_Docente(int codigo){
        docenteControlador c= new docenteControlador();
        return c.buscar_Docente(codigo);
    }
    
    public String registrarConvenio(convenioDTO e) throws Exception{
         convenioControlador s=new convenioControlador();
         System.out.println("FACADE:: " + e.toString());
         //return s.registrarConvenio(nombre, descripcion,vigencia,tipo,estado,fechacreacion,fechaterminacion, entidad,act); 
         return s.registrarConvenio(e);               
    }
    
    public ArrayList<convenioDTO> obtenerConvenios(){
        convenioControlador c = new convenioControlador();
        return c.obtenerConvenios();
    }
    
   public ArrayList<String> obtenerAnios(){
        practicaControlador c = new practicaControlador();
        return c.obtenerAnios();
    }
    
    public ArrayList<practicaDTO> obtenerPracticas(){
        practicaControlador c = new practicaControlador();
        return c.obtenerPracticas();
    }
    
   
   
    public ArrayList<practicaDTO> obtenerPracticas_anio(int semestre,int año){
        practicaControlador c = new practicaControlador();
        return c.obtenerPracticas_anio(semestre,año);
    }
    
    public convenioDTO consultarConvenio(String nombreconvenio){
        convenioControlador c = new convenioControlador();
        return c.consultarConvenio(nombreconvenio);
    }
    
    public String registrarTutor( tutor_empresaDTO e) throws Exception{
         tutorControlador s=new tutorControlador();
         System.out.println("FACADE:: " + e.toString());//corralo
         return s.registrarTutor(e);               
    }
    public ArrayList<tutor_empresaDTO> obtenerTutores(){
        tutorControlador c = new tutorControlador();
        return c.consultarTutores();
    }
    
    public String agregarPerfilEstudiante(perfil_estudianteDTO[] perfiles){
        estudianteControlador c= new estudianteControlador();
        return c.agregarPerfilesEstudiante(perfiles);
    }
   
    public List<perfil_estudianteDTO> listarPerfilesEstudiante(int cod){
        estudianteControlador c= new estudianteControlador();
        return c.listarPerfilesEstudiante(cod);
    }
    public boolean RegistrarTipo_Actividades(Tipo_actividades act){
        ControladorTipo_actividades c = new ControladorTipo_actividades();
        return c.registrarTipo_actividades(act);
    }
    
    public perfilDTO buscarPerfil(int id){
        perfilControlador c= new perfilControlador();
        return c.buscarPerfil(id);
    }
    
      public String RegistrarPractica(practicaDTO p){
       
        practicaControlador c = new practicaControlador();
        System.out.println("FACADE:: " + p.toString());
        return c.RegistrarPractica(p);
    }
      public String eliminarEmpresa(String nit) throws SQLException{
          empresaControlador c=new empresaControlador();
          System.out.println("FACADE::" +nit+"");
          return c.eliminarEmpresa(nit);
      }
      
      public String eliminarPractica(int id) throws SQLException{
          practicaControlador c=new practicaControlador();
          System.out.println("FACADE::" +id+"");
          return c.eliminarPractica(id);
      }
      
      
      public empresaDTO buscarEmpresa(String nit){
        empresaControlador c= new empresaControlador();
        return c.buscarEmpresa(nit);
    }
        public convenioDTO buscarConvenio(String id){
        convenioControlador c= new convenioControlador();
        return c.buscarConvenio(id);
    }
     public String editarConvenio( convenioDTO e) throws Exception{
         convenioControlador s=new convenioControlador();
         System.out.println("FACADE: ALGUNa vaina: " + e.toString());//corralo
         return s.editarConvenio(e);               
    }
        public String eliminarConvenio(String id) throws SQLException{
          convenioControlador c=new convenioControlador();
          System.out.println("FACADE::" +id+"");
          return c.eliminarConvenio(id);
      }
        
        public String eliminarPerfil(int id) throws SQLException{
          perfilControlador c=new perfilControlador();
          System.out.println("FACADE::" +id+"");
          return c.eliminarPerfil(id);
      }
        
        public ArrayList fechas_practicas(){
            practicaControlador a = new practicaControlador();
            return a.fechas_practicas();
        }
        
        public String generarEstadisticas(int añop, int semestrep) throws IOException{
            practicaControlador p = new practicaControlador();
            return p.generarEstadisticas(añop, semestrep);
        }
        
         public boolean generarInformes(int añop, int semestrep){
            practicaControlador p = new practicaControlador();
            return p.generarInformes(añop, semestrep);
        }
        
        public boolean guardarDocumentos(String nombre, String ruta){
            estudianteControlador a= new estudianteControlador();
            return a.guardarDocumentos(nombre, ruta);
        } 
        
}
