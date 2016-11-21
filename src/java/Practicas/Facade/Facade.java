/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practicas.Facade;

import Practicas.Controlador.*;
import java.util.ArrayList;
import Practicas.DTO.*;
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
    
     public String registrarEmpresa( empresaDTO e) throws Exception{
         empresaControlador s=new empresaControlador();
         System.out.println("FACADE:: " + e.toString());//corralo
         return s.registrarEmpresa(e);               
    }
    
    public ArrayList<empresaDTO> obtenerEmpresa(){
        empresaControlador c = new empresaControlador();
        return c.consultarEmpresas();
    }
    
    public ArrayList<estudianteDTO> obtenerEstudiante(){
        estudianteControlador c = new estudianteControlador();
        return c.obtenerEstudiantes();
    }
    public List<perfilDTO> listarPerfil(){
        perfilControlador c= new perfilControlador();
        return c.listarPerfiles();
    }
    
    public estudianteDTO buscarEstudiante(int codigo){
        estudianteControlador c= new estudianteControlador();
        return c.buscarEstudiante(codigo);
    }
    
    
    public docenteDTO buscarDocente(int codigo){
        docenteControlador c= new docenteControlador();
        return c.buscarDocente(codigo);
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
    
    public String agregarPerfilEstudiante(int perfil, int valor, int codEstudiante){
        estudianteControlador c= new estudianteControlador();
        return c.agregarPerfilEstudiante(perfil, valor, codEstudiante);
    }
   
    public List<perfil_estudianteDTO> listarPerfilesEstudiante(int cod){
        estudianteControlador c= new estudianteControlador();
        return c.listarPerfilesEstudiante(cod);
    }
    
    public perfilDTO buscarPerfil(int id){
        perfilControlador c= new perfilControlador();
        return c.buscarPerfil(id);
    }
}
