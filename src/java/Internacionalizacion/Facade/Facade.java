/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Internacionalizacion.Facade;


import Internacionalizacion.Controlador.ControladorActividad;
import Internacionalizacion.Controlador.ControladorActividad_Estudiante;
import Internacionalizacion.Controlador.ControladorConvenio;
import Internacionalizacion.Controlador.ControladorEntidad;
import Internacionalizacion.Controlador.ControladorPais;
import Internacionalizacion.Controlador.ControladorTipo_actividades;
import Internacionalizacion.Modelo.DTO.Actividad;
import Internacionalizacion.Modelo.DTO.Actividad_Estudiante;
import Internacionalizacion.Modelo.DTO.Convenio;
import Internacionalizacion.Modelo.DTO.Entidad;
import Internacionalizacion.Modelo.DTO.Pais;
import Internacionalizacion.Modelo.DTO.Tipo_actividades;
import java.util.ArrayList;

/**
 *
 * @author JAVIER
 */
public class Facade {
    
    
    //METODOS PARA EL MANEJO DE LAS ACTIVIDADES.
    
    public String RegistrarActividad(Actividad a){
        ControladorActividad c = new ControladorActividad();
        return c.RegistrarActividad(a);
    }
    
     public Actividad consultarActividad_By_IDConvenio(String convenio) {    
        ControladorActividad c = new ControladorActividad();
        return c.consultarActividad_By_IDConvenio(convenio);    
    }
     
     public ArrayList<Actividad> consultarActividades() {    
        ControladorActividad c = new ControladorActividad();
        return c.consultarActividades();
    }
    
    
    //METODOS PARA EL REGISTRO DE LOS TIPOS DE ACTIVIDADES QUE PUEDEN HACERSE EN UN CONVENIO.
    
    public boolean RegistrarTipo_Actividades(Tipo_actividades act){
        ControladorTipo_actividades c = new ControladorTipo_actividades();
        return c.registrarTipo_actividades(act);
    }
    
     public ArrayList<String> obtenerActividades(String idconvenio){
        ControladorTipo_actividades c = new ControladorTipo_actividades();
        return c.obtenerActividades(idconvenio);
    }
    
    //METODOS PARA EL MANEJO DE LAS ENTIDADES.
    
    public String registrarEntidad(String nombre,String representante,String sector,String ambito,String tipo,String telefono,String direccion,int pais,String nit) throws Exception{
         ControladorEntidad s=new ControladorEntidad();
         return s.registrarEntidad(nombre,representante,sector,tipo,telefono,direccion,pais,nit);               
    }
    
    public ArrayList<Entidad> obtenerEntidades(){
        ControladorEntidad c = new ControladorEntidad();
        return c.consultarEntidades();
    }
    
    //METODOS PARA EL MANEJO DE LOS CONVENIOS.
    
    public String registrarConvenio(String radicado, String nombre, String descripcion, String fecharadicacion, String fechainicio, String fechaterminacion, String vigencia, String estado, String tipo, int entidad) throws Exception{
         ControladorConvenio s=new ControladorConvenio();         
         return s.registrarConvenio(radicado, nombre, descripcion, fecharadicacion, fechainicio, fechaterminacion, vigencia, estado, tipo, entidad);               
    }
    
    public ArrayList<Convenio> obtenerConvenios(){
        ControladorConvenio c = new ControladorConvenio();
        return c.obtenerConvenios();
    }
    
    public Convenio consultarConvenio(String radicado){
        ControladorConvenio c = new ControladorConvenio();
        return c.consultarConvenio(radicado);
    }
    
    //METODOS PARA EL MANEJO DE LOS PAISES.
    
    public ArrayList<Pais> obtenerPaises(){
        ControladorPais c = new ControladorPais();
        return c.obtenerPaises();
        
    }    
     
    //METODOS PARA EL MANEJO DE REGISTRO Y CONSULTAS DE LA ENTIDAD ACTIVIDAD X ESTUDIANTE
     
     public String RegistrarActividad_Estudiante(Actividad_Estudiante a){
        ControladorActividad_Estudiante c = new ControladorActividad_Estudiante();
        return c.RegistrarActividad_Estudiante(a);
    }
    
}
